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

namespace app\admin\controller\special;

use app\admin\model\special\SpecialSubject;
use think\Url;
use service\FormBuilder as Form;
use service\JsonService as Json;
use app\admin\controller\AuthController;
use app\admin\model\special\Grade as GradeModel;

/**
 * 年级控制器
 * Class Grade
 * @package app\admin\controller\special
 */
class Grade extends AuthController
{
    public function index()
    {
        $this->assign('grade', GradeModel::getAll());
        return $this->fetch();
    }

    public function get_grade_list()
    {
        $where = parent::getMore([
            ['page', 1],
            ['limit', 20],
            ['cate_id', 0],
            ['cate_name', ''],
        ]);
        return Json::successlayui(GradeModel::getAllList($where));
    }

    /**
     * 创建分类
     * @param int $id
     * @return mixed
     * @throws \think\exception\DbException
     */
    public function create($id = 0,$sid=0,$level=1,$pid=0)
    {
        $cate=[];
        if ($id && $sid==0){
            $cate = GradeModel::get($id);
        }else if($id==0 && $sid){
            $cate = SpecialSubject::get($sid);
        }
        $this->assign(['cate'=>json_encode($cate),'id'=>$id,'sid'=>$sid,'level'=>$level,'pid'=>$pid]);
        return $this->fetch();
    }
    /**获取一级分类
     * @param int $sid
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function get_cate_list($level = 0)
    {
        $cate= GradeModel::where('is_del',0)->where('is_show',1)->field('id,name')->order('sort desc,id desc')->select();
        $cate=count($cate) >0 ? $cate->toArray() : [];
        $array=[];
        $oneCate['id']=0;
        $oneCate['name']='顶级分类';
        array_push($array,$oneCate);
        foreach ($cate as $key=>$value){
            array_push($array,$value);
        }
        return Json::successful($array);
    }

    /**
     * 快速编辑
     *
     * @return json
     */
    public function set_value($field = '', $id = '', $value = '')
    {
        $field == '' || $id == '' || $value == '' && Json::fail('缺少参数');
        if (GradeModel::where(['id' => $id])->update([$field => $value]))
            return Json::successful('保存成功');
        else
            return Json::fail('保存失败');
    }

    /**是否显示快捷操作
     * @param string $is_show
     * @param string $id
     * @return mixed
     */
    public function set_show($is_show = '', $id = '')
    {
        ($is_show == '' || $id == '') && Json::fail('缺少参数');
        $res = GradeModel::where(['id' => $id])->update(['is_show' => (int)$is_show]);
        if ($res) {
            return Json::successful($is_show == 1 ? '显示成功' : '隐藏成功');
        } else {
            return Json::fail($is_show == 1 ? '显示失败' : '隐藏失败');
        }
    }
    /**
     * 新增或者修改
     *
     * @return json
     */
    public function save($id = 0,$sid=0)
    {
        $post = parent::postMore([
            ['name', ''],
            ['pic', ''],
            ['grade_id', 0],
            ['sort', 0],
            ['is_show', 0],
        ]);
        if (!$post['name']) return Json::fail('请输入分类名称');
        if($post['grade_id']){
            if (!$post['pic']) return Json::fail('请选择分类图标');
        }
        if ($id || $sid>0) {
            if($id && $sid==0){
                unset($post['pic'],$post['grade_id']);
                $res=GradeModel::edit($post,$id);
            }else if($sid && $id==0){
                $res=SpecialSubject::edit($post,$sid);
            }
            if ($res)
                return Json::successful('修改成功');
            else
                return Json::fail('修改失败');
        } else {
            $post['add_time'] = time();
            if($post['grade_id']){
                if(SpecialSubject::be(['name'=>$post['name'],'is_del'=>0])){
                    return Json::fail('分类名称已存在！');
                }
                $res=SpecialSubject::set($post);
            }else{
                unset($post['pic'],$post['grade_id']);
                if(GradeModel::be(['name'=>$post['name'],'is_del'=>0])){
                    return Json::fail('分类名称已存在！');
                }
                $res=GradeModel::set($post);
            }
            if ($res)
                return Json::successful('添加成功');
            else
                return Json::fail('添加失败');
        }
    }

    /**
     * 删除
     *
     * @return json
     */
    public function delete($id = 0)
    {
        if (!$id) return Json::fail('缺少参数');
        $count=SpecialSubject::where('grade_id',$id)->where('is_del',0)->count();
        if ($count) return Json::fail('请先删除下级分类');
        $data['is_del']=1;
        if (GradeModel::update($data,['id'=>$id]))
            return Json::successful('删除成功');
        else
            return Json::fail('删除失败');
    }
}
