<?php
// +----------------------------------------------------------------------
// | CRMEB [ CRMEB赋能开发者，助力企业发展 ]
// +----------------------------------------------------------------------
// | Copyright (c) 2016~2020 https://www.crmeb.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed CRMEB并不是自由软件，未经许可不能去掉CRMEB相关版权
// +----------------------------------------------------------------------
// | Author: CRMEB Team <admin@crmeb.com>
// +----------------------------------------------------------------------

namespace app\wap\model\recommend;

use app\admin\model\special\SpecialSource;
use app\wap\model\live\LiveStudio;
use app\wap\model\special\Special;
use app\wap\model\article\Article;
use app\wap\model\special\SpecialTask;
use basic\ModelBasic;
use service\GroupDataService;
use traits\ModelTrait;

class RecommendRelation extends ModelBasic
{
    use ModelTrait;

    /**
     * 获取主页推荐列表下的专题和图文内容
     * @param int $recommend_id 推荐id
     * @param int $type 类型 0=专题,1=图文
     * @param int $imagetype 图片显示类型
     * @param int $limit 显示多少条
     * @return array
     * */
    public static function getRelationList($recommend_id, $type, $imagetype, $limit = 0)
    {
        $limit = $limit ? $limit : 4;
        if ($type == 0){
            $list = self::where('a.recommend_id', $recommend_id)
                ->alias('a')->order('a.sort desc,a.add_time desc')->limit($limit)
                ->join("__SPECIAL__ p", 'p.id=a.link_id')
                ->join('__SPECIAL_SUBJECT__ j', 'j.id=p.subject_id', 'LEFT')
                ->where(['p.is_show' => 1, 'p.is_del' => 0])
                ->field(['p.id','p.pink_money', 'p.is_pink','p.sort','p.title', 'p.image', 'p.abstract', 'p.label', 'p.image', 'p.money', 'p.pay_type', 'p.type as special_type','j.name as subject_name', 'a.link_id','a.add_time','p.browse_count','p.member_pay_type', 'p.member_money'])
                ->select();
        }elseif($type == 5){
            //热门直播
            $list = LiveStudio::getLiveList(10);
        }elseif($type == 1) {
            $list = self::alias('a')->join('__ARTICLE__ e', 'e.id=a.link_id')
                ->where(['a.recommend_id' => $recommend_id, 'e.is_show' => 1])
                ->field(['e.title', 'e.image_input as image', 'e.synopsis as abstract', 'e.label', 'a.link_id', 'e.visit as browse_count','a.add_time'])
                ->limit($limit)->order('a.sort desc,a.add_time desc')->select();
        }elseif($type == 10) {
            $list = self::alias('a')->join('SpecialTask t', 't.id=a.link_id')
                ->where(['a.recommend_id' => $recommend_id, 't.is_show' => 1])
                ->field(['t.title', 't.image', 't.abstract', 't.type as task_type', 'a.link_id', 't.play_count as browse_count','a.add_time'])
                ->limit($limit)->order('a.sort desc,a.add_time desc')->select();
        }
        $list = (count($list) && !in_array($type,[5])) ? $list->toArray() : $list;
        foreach ($list as &$item) {
            if($type==0){
                if (!isset($item['subject_name'])) $item['subject_name'] = '';
                if (!isset($item['money'])) $item['money'] = 0;
                if($type==0){
                    $specialSourceId = SpecialSource::getSpecialSource($item['id']);
                    if($specialSourceId) $item['count']=count($specialSourceId);
                    else $item['count']=0;
                }else $item['count'] =0;
                $item['image'] = isset($item['image']) ? get_oss_process($item['image'],$imagetype) : "";
                $item['label'] = (isset($item['label']) && $item['label'] && !is_array($item['label'])) ? json_decode($item['label']) : [];
                $special_type_name = "";
                if (isset($item['special_type']) && SPECIAL_TYPE[$item['special_type']]) {
                    $special_type_name = explode("专题",SPECIAL_TYPE[$item['special_type']]) ? explode("专题",SPECIAL_TYPE[$item['special_type']])[0] : "";
                }
                $item['special_type_name'] = $special_type_name;
            }else if($type==10){
                if (!isset($item['subject_name'])) $item['subject_name'] = '';
                if (!isset($item['money'])) $item['money'] = 0;
                $item['label'] = [];
                if($item['task_type']==1){
                    $item['special_type_name'] ='图文';
                }elseif ($item['task_type']==2){
                    $item['special_type_name'] ='音频';
                }elseif ($item['task_type']==3){
                    $item['special_type_name'] ='视频';
                }
                $item['count']=0;
            }else if($type==1){
                $item['label'] =json_decode($item['label'],true);
            }
        }
        return $list;
    }

    /**
     * 获取主页推荐下图文或者专题的总条数
     * @param int $recommend_id 推荐id
     * @param int $type 类型
     * @return int
     * */
    public static function getRelationCount($recommend_id, $type)
    {
        if ($type == 0){
            $count = self::where('a.recommend_id', $recommend_id)->alias('a')->join("__SPECIAL__ p", 'p.id=a.link_id')
                ->join('__SPECIAL_SUBJECT__ j', 'j.id=p.subject_id', 'LEFT')->where(['p.is_show' => 1,'p.is_del' => 0])->count();
        }else if($type == 1){
            $count = self::alias('a')->join('__ARTICLE__ e', 'e.id=a.link_id')->where(['a.recommend_id' => $recommend_id, 'e.is_show' => 1])->count();
        }else if($type == 5){
            $count = Special::where(['type' =>4, 'is_show' => 1, 'is_del' => 0])->count();
        }else if($type == 10){
            $count = self::where('a.recommend_id', $recommend_id)->alias('a')->join("__SPECIAL_TASK__ t", 't.id=a.link_id')
                ->where(['t.is_show' => 1,'t.is_del' => 0])->count();
        }else{
            $count=0;
        }
        return $count;
    }
}
