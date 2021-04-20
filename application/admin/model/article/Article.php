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


namespace app\admin\model\article;

use app\admin\model\system\RecommendRelation;
use app\admin\model\system\SystemAdmin;
use traits\ModelTrait;
use basic\ModelBasic;
use think\Db;

/**
 * 图文管理 Model
 * Class WechatNews
 * @package app\admin\model\wechat
 */
class Article extends ModelBasic {

    use ModelTrait;

    public function profile()
    {
        return $this->hasOne('ArticleContent','nid','id')->field('content');
    }
    public static function getAddTimeAttr($value){
        return $value ? date('Y-m-d H:i:s',$value) : '';
    }
    public static function getLabelAttr($value){
        return is_string($value) ? json_decode($value,true) : $value;
    }
    public static function PreWhere($alias=''){
        $alias=$alias ? $alias.'.' : '';
        return self::where(["{$alias}is_show"=>1]);
    }
    public static function setWhere($where,$alias='',$model=null){
        if($model===null) $model=new self();
        if($alias){
            $model->alias($alias);
            $alias.='.';
        }
        if($where['store_name']) $model->where("{$alias}title",'LIKE',"%$where[store_name]%");
        if($where['cid']) $model->where("{$alias}cid",$where['cid']);
        if($where['order'])
            $model->order($alias.self::setOrder($where['order']));
        else
            $model->order($alias.'sort desc');
        if($where['is_show']!=='') $model->where("{$alias}is_show",$where['is_show']);
        $model->where("{$alias}hide",0);
        return $model;
    }
    public static function getArticleLayList($where){
        $data=self::setWhere($where,'A')->join('__ARTICLE_CONTENT__ B','A.id=B.nid')->field('A.*,B.content')->page((int)$where['page'],(int)$where['limit'])->select();
        foreach ($data as &$item){
           $item['cate_name']=ArticleCategory::where('id',$item['cid'])->where('is_del',0)->value('title');
            $item['recommend'] = RecommendRelation::where('a.link_id', $item['id'])->where('a.type', 1)->alias('a')
                ->join('__RECOMMEND__ r', 'a.recommend_id=r.id')->column('a.id,r.title');
        }
        $count=self::setWhere($where)->count();
        return compact('data','count');
    }
    /**
     * 获取配置分类
     * @param array $where
     * @return array
     */
    public static function getAll($where = array()){
        $model = new self;
        if($where['title'] !== '') $model = $model->where('title','LIKE',"%$where[title]%");
        if($where['cid'] !== '') $model = $model->where("CONCAT(',',cid,',')  LIKE '%,$where[cid],%'");
        if($where['cid'] == ''){
            if(!$where['merchant']) $model = $model->where('mer_id',0);
            if($where['merchant']) $model = $model->where('mer_id','GT',0);
        }
        $model = $model->where('status',1)->where('hide',0);
        return self::page($model,function($item){
            $item['admin_name'] = '后台管理员---》'.SystemAdmin::where('id',$item['admin_id'])->value('real_name');
            $item['content'] = Db::name('ArticleContent')->where('nid',$item['id'])->value('content');
            $item['catename'] = Db::name('ArticleCategory')->where('id',$item['cid'])->value('title');
        },$where);
    }

    /**
     * 删除图文
     * @param $id
     * @return bool
     */
    public static function del($id){
        return self::edit(['status'=>0],$id,'id');
    }

    /**
     * 获取指定字段的值
     * @return array
     */
    public static function getNews()
    {
        return self::where('status',1)->where('hide',0)->order('id desc')->column('id,title');
    }

    /**
     * 给表中的字符串类型追加值
     * 删除所有有当前分类的id之后重新添加
     * @param $cid
     * @param $id
     * @return bool
     */
    public static function saveBatchCid($cid,$id){
        $res_all = self::where('cid','LIKE',"%$cid%")->select();//获取所有有当前分类的图文
        foreach ($res_all as $k=>$v){
            $cid_arr = explode(',',$v['cid']);
            if(in_array($cid,$cid_arr)){
                $key = array_search($cid, $cid_arr);
                array_splice($cid_arr, $key, 1);
            }
            if(empty($cid_arr)) {
                $data['cid'] = 0;
                self::edit($data,$v['id']);
            }else{
                $data['cid'] = implode(',',$cid_arr);
                self::edit($data,$v['id']);
            }
        }
        $res = self::where('id','IN',$id)->select();
        foreach ($res as $k=>$v){
            if(!in_array($cid,explode(',',$v['cid']))){
                if(!$v['cid']){
                    $data['cid'] = $cid;
                }else{
                    $data['cid'] = $v['cid'].','.$cid;
                }
                self::edit($data,$v['id']);
            }
        }
       return true;
    }

    public static function setContent($id,$content){
        $count = Db::name('ArticleContent')->where('nid',$id)->count();
        $data['nid'] = $id;
        $data['content'] = $content;
        if($count){
            $res = Db::name('ArticleContent')->where('nid',$id)->setField('content',$content);
            if($res !== false) $res = true;
        }
        else
            $res = Db::name('ArticleContent')->insert($data);
        return $res;
    }

    public static function merchantPage($where = array()){
        $model = new self;
        if($where['title'] !== '') $model = $model->where('title','LIKE',"%$where[title]%");
        if($where['cid'] !== '') $model = $model->where('cid','LIKE',"%$where[cid]%");
        $model = $model
            ->where('status',1)
            ->where('hide',0)
            ->where('admin_id',$where['admin_id']);
        return self::page($model,function($item){
            $item['content'] = Db::name('ArticleContent')->where('nid',$item['id'])->value('content');
        },$where);
    }

    /**
     * 获取指定文章列表  图文管理使用
     * @param string $id
     * @param string $field
     * @return false|\PDOStatement|string|\think\Collection
     */
    public static function getArticleList($id = '',$field = 'title,author,image_input,synopsis,id'){
         $list = self::where('id','IN',$id)->field($field)->select();
         foreach ($list as $k=>$v){
             $list[$k]['content'] = Db::name('ArticleContent')->where('nid',$v['id'])->value('content');
         }
         return $list;
    }


    /**
     * 获取活动咨询列表
     * @param array $where
     * @return array
     */
    public static function getConsultList($where = array()){
        $model = new self;
        if(isset($where['title']) && $where['title'] !== '') $model = $model->where('title','LIKE',"%$where[title]%");
        if(isset($where['consult_type']) && $where['consult_type']) $model = $model->where('consult_type',$where['consult_type']);
        $model = $model->where('is_consult',1)->where('hide',0);
        return self::page($model,$where);
    }

}
