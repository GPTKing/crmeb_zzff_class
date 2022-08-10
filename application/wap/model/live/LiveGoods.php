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

namespace app\wap\model\live;

/**
 * 直播带货
 */

use app\admin\model\order\StoreOrder;
use basic\ModelBasic;
use service\SystemConfigService;
use traits\ModelTrait;
use app\wap\model\user\User;
use app\wap\model\special\Special;

class LiveGoods extends ModelBasic
{

    use ModelTrait;


    public static function getLiveGoodsList($where, $page = 0, $limit = 10)
    {
        $model = self::alias('g');
        $model = $model->where('g.is_delete', 0);
        if ($where['is_show'] != "" && isset($where['is_show'])) {
            $model = $model->where('g.is_show', $where['is_show']);
        }
        if ($where['live_id'] != 0 && isset($where['live_id'])) {
            $model = $model->where('g.live_id', $where['live_id']);
        }
        $model = $model->field('g.id as live_goods_id,g.special_id, g.sort as gsort, g.fake_sales as gfake_sales,g.type as gfake_type, g.is_show as gis_show, g.sales as gsales');
        $model = $model->order('g.sort desc');
        if ($page && $limit) {
            $list = $model->page((int)$page, (int)$limit)->select();
        } else {
            $list = $model->select();
        }
        $list = count($list) ? $list->toArray() : [];
        foreach ($list as $key => &$item) {
            if ($item['gfake_type'] == 0) {
                $special = Special::where('id', $item['special_id'])->where('is_del', 0)->find();
                if (!$special) {
                    array_splice($list, $key, 1);
                    continue;
                }
                $item['id'] = $special['id'];
                $item['image'] = $special['image'];
                $item['title'] = $special['title'];
                $item['member_pay_type'] = $special['member_pay_type'];
                $item['member_money'] = $special['member_money'];
                $item['money'] = $special['money'];
                $item['label'] = $special['label'];
                $item['_add_time'] = $special['add_time'];
                $item['pink_end_time'] = $special['pink_end_time'] ? strtotime($special['pink_end_time']) : 0;
                $item['sales'] = StoreOrder::where(['paid' => 1, 'cart_id' => $special['id'], 'refund_status' => 0, 'type' => 0])->count();
                //查看拼团状态,如果已结束关闭拼团
                if ($special['is_pink'] && $special['pink_end_time'] < time()) {
                    self::update(['is_pink' => 0], ['id' => $item['live_goods_id']]);
                    $item['is_pink'] = 0;
                }
            } else {
                $store = StoreProduct::where('id', $item['special_id'])->where('is_del', 0)->find();
                if (!$store) {
                    array_splice($list, $key, 1);
                    continue;
                }
                $item['id'] = $store['id'];
                $item['image'] = $store['image'];
                $item['title'] = $store['store_name'];
                $item['member_pay_type'] = 0;
                $item['member_money'] = $store['vip_price'];
                $item['money'] = $store['price'];
                $item['label'] = explode(',', $store['keyword']);
                $item['_add_time'] = date('Y-m-d H:i:s', $store['add_time']);
                $item['sales'] = $store['sales'];
            }
        }
        $page++;
        return ['list' => $list, 'page' => $page];
    }


}
