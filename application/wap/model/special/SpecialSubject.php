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

namespace app\wap\model\special;

use basic\ModelBasic;
use traits\ModelTrait;

class SpecialSubject extends ModelBasic
{
    use ModelTrait;

    public function children()
    {
        return $this->hasMany('SpecialSubject', 'grade_id','id')->where(['is_del' => 0,'is_show'=>1])->order('sort DESC,id DESC');
    }

    public static function wapSpecialCategoryAll($type=0){
        $model=self::where(['is_del' => 0,'is_show'=>1]);
        if($type==1){
            $model=$model->where('grade_id',0);
        }
        $list=$model->order('sort desc,add_time desc')->field('id,name')->select();
        $list=count($list) > 0 ? $list->toArray() : [];
        return $list;
    }
}
