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

namespace app\admin\model\special;

use traits\ModelTrait;
use basic\ModelBasic;

/**
 * Class Grade 一级分类
 * @package app\admin\model\special
 */
class Grade extends ModelBasic
{
    use ModelTrait;

    const gradeName='name';

    public static function getAll()
    {
        return self::where(['is_del' => 0,'is_show'=>1])->order('sort desc,add_time desc')->field(['name', 'id'])->select();
    }

    public static function getAllList($where)
    {
        $model= self::with(['SpecialSubject'=>function($query){
            $query->where(['is_show'=>1,'is_del'=>0]);
        }])->page((int)$where['page'], (int)$where['limit'])->order('sort desc,add_time desc')->where('is_del', 0);
        if ($where['cate_name'] != '') $model = $model->where('name', 'like', "%$where[cate_name]%");
        $data =$model->select();
        $count = self::setWhere($where)->count();
        return compact('data', 'count');
    }

    public static function setWhere($where)
    {
        $model = self::order('sort desc,add_time desc')->where('is_del', 0);
        if ($where['cate_name'] != '') $model = $model->where('name', 'like', "%$where[cate_name]%");
        return $model;
    }

    public function SpecialSubject()
    {
        return $this->hasMany('SpecialSubject','grade_id');
    }

    /**
     * 分类修改 v1.4.3升级到v1.4.4时使用
     */
    public static function updateClassification(){
        $grade=self::where(['is_del'=>0,'is_show'=>1])->select();
        $grade=count($grade)>0 ? $grade->toArray() :[];
        if(count($grade) && self::gradeName){
            foreach ($grade as $key=>$value){
                $data=[
                    'name'=>$value['name'],
                    'sort'=>$value['sort'],
                    'is_show'=>$value['is_show'],
                    'pic'=>null,
                    'add_time'=>time(),
                ];
                $id=SpecialSubject::insertGetId($data);
                SpecialSubject::where(['is_del'=>0,'grade_id'=>$value['id']])->update(['grade_id'=>$id]);
                self::where(['id'=>$value['id']])->update(['is_del'=>1]);
            }
        }else{
            return true;
        }
    }
}
