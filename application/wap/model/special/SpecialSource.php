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


use traits\ModelTrait;
use basic\ModelBasic;

/**
 * Class Special 专题素材关联表
 * @package app\admin\model\special
 */
class SpecialSource extends ModelBasic
{
    use ModelTrait;

    /**获取专题素材
     * @param bool $special_id
     * @return false|\PDOStatement|string|\think\Collection
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function getSpecialSource($special_id = false, $source_id = false, $limit = false, $page = false)
    {
        $where = array();
        $data = self::where($where);
        if ($special_id) {
            if (is_array($special_id)) {
                $data->whereIn('special_id', $special_id);
            }else{
                $where['special_id'] = $special_id;
                $data->where($where);
            }
        }
        if ($source_id) {
            if (!is_array($source_id)) {
                $where['source_id'] = $source_id;
                $data->where($where);
            } else {
                $data->whereIn('source_id', $source_id);
            }
        }
        if ($page) {
            $data->page((int)$page, !$limit ? 10 : (int)$limit);
        }
        return $data->order('sort DESC,id DESC')->select();
    }

}
