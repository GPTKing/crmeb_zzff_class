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

class Grade extends ModelBasic
{
    use ModelTrait;

    public static function getPickerData(){
        $data=self::where('is_del',0)->where('is_show',1)->order('sort desc')->select();
        $pickdata=[];
        foreach ($data as $item){
            $val['value']=$item['id'];
            $val['text']=$item['name'];
            $pickdata[]=$val;
        }
        return $pickdata;
    }
}
