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

namespace app\admin\model\special;

use app\admin\model\live\LiveGoods;
use app\admin\model\live\LiveStudio;
use app\admin\model\order\StoreOrder;
use app\admin\model\system\RecommendRelation;
use think\cache\driver\Redis;
use traits\ModelTrait;
use basic\ModelBasic;

/**
 * Class Special 专题
 * @package app\admin\model\special
 */
class Special extends ModelBasic
{
    use ModelTrait;

    const wap_index_has='recommend_list';

    protected static function init()
    {
        self::afterUpdate(function () {
            del_redis_hash("wap_index_has",self::wap_index_has);
        });
    }
    public function profile()
    {
        return $this->hasOne('SpecialContent', 'special_id', 'id')->field('content');
    }

    public static function PreWhere($alert = '')
    {
        $alert = $alert ? $alert . '.' : '';
        return self::where([$alert . 'is_show' => 1, $alert . 'is_del' => 0]);
    }

    //动态赋值
    public static function getPinkStrarTimeAttr($value)
    {
        return $value ? date('Y-m-d H:i:s', $value) : '';
    }

    public static function getPinkEndTimeAttr($value)
    {
        return $value ? date('Y-m-d H:i:s', $value) : '';
    }

    public static function getAddTimeAttr($value)
    {
        return date('Y-m-d H:i:s', $value);
    }

    public static function getBannerAttr($value)
    {
        return is_string($value) ? json_decode($value, true) : $value;
    }

    public static function getLabelAttr($value)
    {
        return is_string($value) ? json_decode($value, true) : $value;
    }
    //end
    //设置
    public static function getBannerKeyAttr($banner)
    {
        if (is_string($banner)) $banner = json_decode($banner, true);
        if ($banner === false) return [];
        $value = [];
        foreach ($banner as $item) {
            $value[] = [
                'is_show' => false,
                'pic' => $item
            ];
        }
        return $value;
    }

    public static function saveFieldByWhere(array $where, array $data)
    {
        if (!$where || !$data) return false;
        return parent::saveFieldByWhere($where, $data);
    }

    //获取单个专题
    public static function getOne($id, $is_live = false)
    {
        $special = self::get($id);
        if (!$special) return false;
        if ($special->is_del) return false;
        $special->banner = self::getBannerKeyAttr($special->banner);
        $special->profile->content = htmlspecialchars_decode($special->profile->content);
        if ($is_live) {
            $liveInfo = LiveStudio::where('special_id', $special->id)->find();
            if (!$liveInfo) return self::setErrorInfo('暂未查到直播间');
            if ($liveInfo->is_del) return self::setErrorInfo('直播间已删除无法编辑');
            $liveInfo->live_duration = (strtotime($liveInfo->stop_play_time) - strtotime($liveInfo->start_play_time)) / 60;
            $liveInfo = $liveInfo->toArray();
        } else
            $liveInfo = [];
        return [$special->toArray(), $liveInfo];
    }

    //设置条件
    public static function setWhere($where, $alert = '', $model = null)
    {
        $model = $model === null ? new self() : $model;
        if ($alert) $model = $model->alias($alert);
        $alert = $alert ? $alert . '.' : '';
        if ($where['order'])
            $model = $model->order($alert . self::setOrder($where['order']));
        else
            $model = $model->order($alert.'sort desc,'.$alert.'id desc');
        if (isset($where['subject_id']) && $where['subject_id']) $model = $model->where($alert . 'subject_id', $where['subject_id']);
        if (isset($where['store_name']) && $where['store_name']!='') $model = $model->where($alert . 'title|' . $alert . 'abstract|' . $alert . 'phrase|'. $alert . 'id', "LIKE", "%$where[store_name]%");
        if ($where['is_show'] !== '') $model = $model->where($alert . 'is_show', $where['is_show']);
        if (isset($where['type']) && $where['type']) $model = $model->where($alert . 'type', $where['type']);
        if (isset($where['special_type']) && $where['special_type'] !== '') {
            $model = $model->where($alert . 'type', $where['special_type']);
        }
        if (isset($where['admin_id']) && $where['admin_id']) $model = $model->where($alert . 'admin_id', $where['admin_id']);
        if (isset($where['start_time']) && $where['start_time'] && isset($where['end_time']) && $where['end_time']) $model = $model->whereTime($alert . 'add_time', 'between', [strtotime($where['start_time']), strtotime($where['end_time'])]);
        return $model->where($alert .'is_del', 0);
    }

    /**拼团专题列表
     * @param $where
     */
    public static function getPinkList($where)
    {
        $data = self::setWhere($where, 'A')->field('A.*,S.name as subject_name')
            ->join('__SPECIAL_SUBJECT__ S', 'S.id=A.subject_id','LEFT')
            ->page((int)$where['page'], (int)$where['limit'])->where('A.is_pink',1)->select();
        $data = count($data) ? $data->toArray() : [];
        foreach ($data as &$item) {
            $item['recommend'] = RecommendRelation::where('a.link_id', $item['id'])->where('a.type', 'in', [0, 2,8])->alias('a')
                ->join('__RECOMMEND__ r', 'a.recommend_id=r.id')->column('a.id,r.title');
            $item['pink_end_time'] = $item['pink_end_time'] ? strtotime($item['pink_end_time']) : 0;
            //查看拼团状态,如果已结束关闭拼团
            if ($item['is_pink'] && $item['pink_end_time'] < time()) {
                self::update(['is_pink' => 0], ['id' => $item['id']]);
                $item['is_pink'] = 0;
            }
            if(!$item['is_pink']){
                $item['pink_money'] = 0;
            }
            if ($item['type'] == 4) {
                $studio = LiveStudio::where('special_id', $item['id'])->field('id,stream_name,start_play_time,online_num,is_play')->find();
                if ($studio) {
                    $item['stream_name'] = $studio['stream_name'];
                    $item['live_id'] = $studio['id'];
                    $item['start_play_time'] = $studio['start_play_time'];
                    $item['online_num'] = $studio['online_num'];
                    $item['is_play'] = $studio['is_play'] ? 1 : 0;
                }
            }
        }
        $count = self::setWhere($where, 'A')->join('__SPECIAL_SUBJECT__ S', 'S.id=A.subject_id','LEFT')->where('is_pink',1)->count();
        return compact('data', 'count');
    }
    //查找专题列表
    public static function getSpecialList($where)
    {
        $data = self::setWhere($where, 'A')->field('A.*,S.name as subject_name')
            ->join('__SPECIAL_SUBJECT__ S', 'S.id=A.subject_id','LEFT')
            ->page((int)$where['page'], (int)$where['limit'])->select();
        $data = count($data) ? $data->toArray() : [];
        foreach ($data as &$item) {
            $item['recommend'] = RecommendRelation::where('a.link_id', $item['id'])->where('a.type', 'in', [0, 2,8])->alias('a')
                ->join('__RECOMMEND__ r', 'a.recommend_id=r.id')->column('a.id,r.title');
            $item['pink_end_time'] = $item['pink_end_time'] ? strtotime($item['pink_end_time']) : 0;
            //查看拼团状态,如果已结束关闭拼团
            if ($item['is_pink'] && $item['pink_end_time'] < time()) {
                self::update(['is_pink' => 0], ['id' => $item['id']]);
                $item['is_pink'] = 0;
            }
            if(!$item['is_pink']){
                $item['pink_money'] = 0;
            }
            if ($where['type'] == 4) {
                $studio = LiveStudio::where('special_id', $item['id'])->field('id,stream_name,start_play_time,online_num,is_play')->find();
                if ($studio) {
                    $item['stream_name'] = $studio['stream_name'];
                    $item['live_id'] = $studio['id'];
                    $item['start_play_time'] = $studio['start_play_time'];
                    $item['online_num'] = $studio['online_num'];
                    $item['is_play'] = $studio['is_play'] ? 1 : 0;
                }
            }
        }
        $count = self::setWhere($where, 'A')->join('__SPECIAL_SUBJECT__ S', 'S.id=A.subject_id','LEFT')->count();
        return compact('data', 'count');
    }
}
