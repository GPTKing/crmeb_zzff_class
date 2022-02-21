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

use traits\ModelTrait;
use basic\ModelBasic;
/**
 * Class SpecialTask 专题任务
 * @package app\admin\model\special
 */
class SpecialTask extends ModelBasic
{
    use ModelTrait;

    public static function getAddTimeAttr($value)
    {
        return $value ? date("Y-m-d H:i:s", $value) : '';
    }

    public static function getCouresNameAttr($value, $data)
    {
        return SpecialCourse::where('id', $data['coures_id'])->value('course_name');
    }

    //设置where条件
    public static function setWhere($where, $alirs = '', $model = null)
    {
        $model = $model === null ? new self() : $model;
        $model = $alirs === '' ? $model->alias($alirs) : $model;
        $alirs = $alirs === '' ? $alirs : $alirs . '.';
        if ($where['is_show'] !== '') $model = $model->where("{$alirs}is_show", $where['is_show']);
        if ($where['pid']>0) {
            $pids=SpecialTaskCategory::categoryId($where['pid']);
            array_push($pids,$where['pid']);
           if(count($pids)>0){
               $model = $model->where("{$alirs}pid",'in', $pids);
           }else{
               $model = $model->where("{$alirs}pid", $where['pid']);
           }
        }
        if ($where['title']) $model = $model->where("{$alirs}title", 'LIKE', "%$where[title]%");
        if (isset($where['special_type']) && $where['special_type']) $model = $model->where("{$alirs}type", $where['special_type']);
        $model = $model->where("{$alirs}is_del", 0);
        if ($where['order'])
            $model = $model->order($alirs . self::setOrder($where['order']));
        else
            $model = $model->order("{$alirs}sort desc,{$alirs}id desc");
        return $model;
    }

    public static function getTaskCount($special_id)
    {
        $ids = self::getDb('special_course')->where('special_id', $special_id)->where('is_show', 1)->column('id');
        return self::where('is_show', 1)->where('is_del',0)->where('coures_id', 'in', $ids)->count();
    }

    //查找素材列表
    public static function getTaskList($where)
    {
        $data = self::setWhere($where)->page((int)$where['page'], (int)$where['limit'])->select();
        $data = count($data) ? $data->toArray() : [];
        $count = self::setWhere($where)->count();
        return compact('data', 'count');
    }
    public static function getTaskList2($where)
    {
        if (isset($where['special_type']) && $where['special_type'] == SPECIAL_COLUMN){
            unset($where['special_type']);
            $where['store_name']=$where['title'];
            if($where['type']==''){
                $data = Special::setWhere($where)->whereIn('type',[SPECIAL_IMAGE_TEXT, SPECIAL_AUDIO, SPECIAL_VIDEO])->page((int)$where['page'], (int)$where['limit'])->select();
                $data = count($data) ? $data->toArray() : [];
                $count = Special::setWhere($where)->whereIn('type',[SPECIAL_IMAGE_TEXT, SPECIAL_AUDIO, SPECIAL_VIDEO])->count();
            }else{
                $data = Special::setWhere($where)->page((int)$where['page'], (int)$where['limit'])->select();
                $data = count($data) ? $data->toArray() : [];
                $count = Special::setWhere($where)->count();
            }
        }elseif (isset($where['special_type']) && $where['special_type'] == SPECIAL_LIVE){
            unset($where['special_type']);
            $where['store_name']=$where['title'];
            if($where['type']==''){
                $data = Special::setWhere($where)->whereIn('type',[SPECIAL_IMAGE_TEXT, SPECIAL_AUDIO, SPECIAL_VIDEO])->page((int)$where['page'], (int)$where['limit'])->select();
                $data = count($data) ? $data->toArray() : [];
                $count = Special::setWhere($where)->whereIn('type',[SPECIAL_IMAGE_TEXT, SPECIAL_AUDIO, SPECIAL_VIDEO])->count();
            }else{
                $data = Special::setWhere($where)->page((int)$where['page'], (int)$where['limit'])->select();
                $data = count($data) ? $data->toArray() : [];
                $count = Special::setWhere($where)->count();
            }
        }else{
            if($where['pid']>0){$where['special_type']=0;}
            $data = self::setWhere($where)->page((int)$where['page'], (int)$where['limit'])->select();
            $data = count($data) ? $data->toArray() : [];
            $count = self::setWhere($where)->count();
        }
        return compact('data', 'count');
    }
    /**
     * 删除任务
     * @param $id
     * @return bool|int
     * @throws \think\exception\DbException
     */
    public static function delTask($id)
    {
        $task = self::get($id);
        if (!$task) return self::setErrorInfo('删除的数据不存在');
        return $task->delete();
    }

    /**
     * 设置直播关联查询条件
     * @param $where
     * @return $this
     */
    public static function setLiveWhereTask($where)
    {
        $model = self::where('live_id', $where['live_id']);
        if ($where['title']) $model = $model->where('title', 'like', "%$where[title]%");
        if ($where['start_time'] && $where['end_time']) $model = $model->where('add_time', 'between', [strtotime($where['start_time']), strtotime($where['end_time'])]);
        return $model;
    }

    /**
     * 获取直播关联的任务
     * @param $where
     * @return array
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function getRelationTask($where)
    {
        $data = self::setLiveWhereTask($where)->page((int)$where['page'], (int)$where['limit'])->order('sort desc,id desc')->select();
        $data = count($data) ? $data->toArray() : [];
        foreach ($data as &$item) {
            $special = SpecialCourse::where('a.id', $item['coures_id'])->alias('a')->join('special s', 's.id=a.special_id')->field('s.id,s.title')->find();
            if ($special)
                $item['special_title'] = $special['title'] . '&nbsp/&nbsp' . $special['id'];
            else
                $item['special_title'] = '';
        }
        $count = self::setLiveWhereTask($where)->count();
        return compact('data', 'count');
    }
}
