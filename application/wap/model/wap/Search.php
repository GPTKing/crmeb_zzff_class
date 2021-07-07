<?php
// +----------------------------------------------------------------------
// | CRMEB [ CRMEB赋能开发者，助力企业发展 ]
// +----------------------------------------------------------------------
// | Copyright (c) 2016~2021 https://www.crmeb.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed CRMEB并不是自由软件，未经许可不能去掉CRMEB相关版权
// +----------------------------------------------------------------------
// | Author: CRMEB Team <admin@crmeb.com>
// +----------------------------------------------------------------------

namespace app\wap\model\wap;

use app\admin\model\special\SpecialSource;
use app\wap\model\recommend\RecommendRelation;
use app\wap\model\special\Special;
use app\wap\model\special\SpecialTask;
use service\SystemConfigService;
use think\cache\driver\Redis;
use traits\ModelTrait;
use basic\ModelBasic;
use app\wap\model\article\Article;
use think\Db;

/**
 * Class Search
 * @package app\wap\model
 */
class Search extends ModelBasic
{
    use ModelTrait;

    const searchHistory='search_history_';

    public static function getHostSearch()
    {
        return self::order('add_time desc')->column('name');
    }

    /**
     * 获取搜索内容
     * @param $search
     * @param int $limit
     * @param int $page
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function getSearchContent($search, $limit = 3,$uid=0, $page = 0)
    {
        $specialModel = Special::PreWhere()->where('title|abstract', 'LIKE', "%$search%")->field(['is_pink', 'pink_money', 'label', 'id', 'title', 'abstract', 'image', 'money'])
            ->order('sort desc,id desc');
        if ($page === 0)
            $special = $specialModel->limit($limit)->select();
        else
            $special = $specialModel->page((int)$page, (int)$limit)->select();
        $special = count($special) ? $special->toArray() : [];
        foreach ($special as &$item) {
            $item['image'] = get_oss_process($item['image'],4);
        }
        $searchList['special'] = $special;
        if($uid){
            $data=[
                'uid'=>$uid,
                'search'=>$search,
                'add_time'=>time()
            ];
            $history=Db::name('search_history')->where(['uid'=>$uid,'search'=>$search])->find();
            if(!$history){
                $id = Db::name('search_history')->insertGetId($data);
            }else{
                $id=0;
            }
        }
        $redisModel = new Redis();
        $site_url = SystemConfigService::get('site_url');
        $subjectUrl=getUrlToDomain($site_url);
        $exists_search_reids = $redisModel->HEXISTS($subjectUrl."wap_index_has",self::searchHistory.$uid);
        if ($exists_search_reids && $id) {
            $data['id'] = $id;
            $search_list_redis = json_decode($redisModel->hget($subjectUrl."wap_index_has",self::searchHistory.$uid),true);
            $redis_tmp = array_merge([$data], $search_list_redis);
            $redisModel->hset($subjectUrl."wap_index_has",self::searchHistory.$uid, json_encode($redis_tmp));
        }
        return $searchList;
    }

    /**
     * 获取更多搜索内容并分页
     * @param $where
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function getMoerList($where)
    {
        $moreList = self::getSearchContent($where['search'], $where['limit'], $where['page']);
        $page = $where['page'] + 1;
        return ['page' => $page, 'more_list' => $where['type'] ? $moreList['tash'] : $moreList['special']];
    }

    /**
     *
     * @param $where
     * @return array
     */
    public static function getUnifiendList($where)
    {
        $ids = RecommendRelation::where(['type' => $where['type'], 'recommend_id' => $where['recommend_id']])->column('link_id');
        switch ((int)$where['type']) {
            case 0:
            case 2:
                $model = Special::PreWhere()->where('is_show',1);
                if (isset($where['subject_id']) && $where['subject_id']) $model = $model->where('subject_id', $where['subject_id']);
                $field = ['title', 'abstract', 'image','type','label', 'money', 'id', 'is_pink', 'pink_money'];
                break;
            case 1:
                $model = Article::PreWhere();
                $field = ['title', 'synopsis as abstract', 'image_input as image', 'label', 'id'];
                break;
            default:
                return ['list' => [], 'page' => 0];
                break;
        }
        $list = $model->where('id', 'in', $ids)->order('sort desc,id desc')->field($field)->page((int)$where['page'], (int)$where['limit'])->select();
        $list = count($list) ? $list->toArray() : [];
        foreach ($list as &$item) {
            if (!isset($item['money'])) $item['money'] = 0;
            $item['money'] = (float)$item['money'];
            $item['image'] = get_oss_process($item['image'],$where['typesetting']);
            $item['count'] =0;
            if($where['type']==0 || $where['type']==2){
                $specialSourceId = SpecialSource::getSpecialSource($item['id']);
                if($specialSourceId) $item['count']=count($specialSourceId);
                else $item['count'] =0;
            }
        }
        $page = $where['page'] + 1;
        return compact('list', 'page');
    }

    /**
     * 用户搜索历史
     */
    public static function userSearchHistory($uid=0){
        $list=Db::name('search_history')->where('uid',$uid)->limit(0,10)->order('add_time DESC')->select();
        return $list;
    }
}
