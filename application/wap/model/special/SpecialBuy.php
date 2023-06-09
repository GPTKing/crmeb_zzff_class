<?php
// +----------------------------------------------------------------------
// | CRMEB [ CRMEB赋能开发者，助力企业发展 ]
// +----------------------------------------------------------------------
// | Copyright (c) 2016~2022 https://www.crmeb.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed CRMEB并不是自由软件，未经许可不能去掉CRMEB相关版权
// +----------------------------------------------------------------------
// | Author: CRMEB Team <admin@crmeb.com>
// +----------------------------------------------------------------------

namespace app\wap\model\special;

use basic\ModelBasic;
use traits\ModelTrait;

class SpecialBuy extends ModelBasic
{
    use ModelTrait;

    protected function setAddTimeAttr()
    {
        return time();
    }

    protected function getAddTimeAttr($value)
    {
        return date('Y-m-d H:i:s', $value);
    }

    protected function getTypeAttr($value)
    {
        $name = '';
        switch ($value) {
            case 0:
                $name = '支付获得';
                break;
            case 1:
                $name = '拼团获得';
                break;
            case 2:
                $name = '领取礼物获得';
                break;
            case 3:
                $name = '赠送获得';
                break;
        }
        return $name;
    }

    public static function setAllBuySpecial($order_id, $uid, $special_id, $type = 0)
    {
        if (!$order_id || !$uid || !$special_id) return false;
        //如果是专栏，记录专栏下所有专题购买。
        $special = Special::get($special_id);
        if ($special['type'] == SPECIAL_COLUMN) {
            $special_source = SpecialSource::getSpecialSource($special['id']);
            if ($special_source) {
                foreach ($special_source as $k => $v) {
                    $task_special = Special::get($v['source_id']);
                    if ($task_special['is_show'] == 1) {
                        self::setBuySpecial($order_id, $uid, $v['source_id'], $type, $special_id);
                    }
                }
            }
        }
        self::setBuySpecial($order_id, $uid, $special_id, $type);
    }

    public static function setBuySpecial($order_id, $uid, $special_id, $type = 0, $column_id = 0)
    {
        $add_time = time();
        if (self::be(['order_id' => $order_id, 'uid' => $uid, 'special_id' => $special_id, 'type' => 0, 'column_id' => $column_id])) return false;
        return self::set(compact('order_id', 'column_id', 'uid', 'special_id', 'type', 'add_time'));
    }

    /**专栏更新数据
     * @param $special_id
     */
    public static function columnUpdate($special_id)
    {
        if (!self::be(['special_id' => $special_id, 'is_del' => 0])) return true;
        self::where(['special_id' => $special_id, 'is_del' => 0])->update(['is_update' => 1]);
    }

    /**用户名下专栏更新
     * @param $id
     * @return bool|void
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function update_column($id, $uid)
    {
        if (!$id || !$uid) return true;
        $column = self::where(['is_del' => 0, 'uid' => $uid, 'special_id' => $id, 'is_update' => 1])->field('id,order_id,column_id,uid,special_id,is_del,type as types')->select();
        $column = count($column) > 0 ? $column->toArray() : [];
        if (!$column) return true;
        foreach ($column as $key => $value) {
            $sourceList = self::where(['order_id' => $value['order_id'], 'is_del' => 0, 'uid' => $value['uid'], 'column_id' => $id, 'type' => $value['types']])->select();
            $sourceList = count($sourceList) > 0 ? $sourceList->toArray() : [];
            if (count($sourceList) > 0) {
                $res = self::where(['order_id' => $value['order_id'], 'is_del' => 0, 'uid' => $value['uid'], 'column_id' => $id, 'type' => $value['types']])->delete();
                if (!$res) continue;
            }
            $special_source = SpecialSource::getSpecialSource($id);
            if (!$special_source) continue;
            foreach ($special_source as $k => $v) {
                $task_special = Special::PreWhere()->where(['id' => $v['source_id']])->find();
                if (!$task_special) continue;
                if (!$task_special['is_show']) continue;
                self::setBuySpecial($value['order_id'], $value['uid'], $v['source_id'], $value['types'], $id);
            }
        }
        self::where(['is_del' => 0, 'uid' => $uid, 'special_id' => $id, 'is_update' => 1])->update(['is_update' => 0]);
    }

    public static function PaySpecial($special_id, $uid)
    {
        return self::where(['uid' => $uid, 'special_id' => $special_id, 'is_del' => 0])->count() ? true : false;
    }

    public static function getPayList($where)
    {
        $list = self::where(['a.uid' => $where['uid']])->alias('a')->join('__SPECIAL__ s', 's.id=a.special_id')
            ->field('a.*,s.title')->order('a.add_time desc')->page((int)$where['page'], (int)$where['limit'])->select();
        foreach ($list as &$item) {
            $pay_price = self::getDb('store_order')->where('order_id', $item['order_id'])->value('pay_price');
            $item['pay_price'] = $pay_price > 0 ? $pay_price : 0;
        }
        return $list;
    }
}
