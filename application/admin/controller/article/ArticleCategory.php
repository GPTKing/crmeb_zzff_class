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

namespace app\admin\controller\article;

use app\admin\controller\AuthController;
use service\FormBuilder as Form;
use service\JsonService as Json;
use service\UploadService as Upload;
use think\Request;
use think\Url;
use app\admin\model\article\ArticleCategory as ArticleCategoryModel;
use app\admin\model\article\Article as ArticleModel;

/**
 * 文章分类管理  控制器
 * */
class ArticleCategory extends AuthController
{
    /**
     * 分类管理
     **/
     public function index(){
         $where = parent::getMore([
             ['status',''],
             ['title',''],
         ],$this->request);
         $this->assign('where',$where);
         $this->assign(ArticleCategoryModel::systemPage($where));
         return $this->fetch();
     }

    /**
     * 添加分类管理
     * */
    public function create(){
        $f = array();
        $f[] = Form::input('title','分类名称');
        $f[] = Form::input('intr','分类简介')->type('textarea');
        $f[] = Form::number('sort','排序',0);
        $f[] = Form::radio('status','状态',1)->options([['value'=>1,'label'=>'显示'],['value'=>0,'label'=>'隐藏']]);
        $form = Form::make_post_form('添加分类',$f,Url::build('save'),2);
        $this->assign(compact('form'));
        return $this->fetch('public/form-builder');
    }

    /**
     * s上传图片
     * */
    public function upload(){
        $res = Upload::image('file','article');
        $thumbPath = Upload::thumb($res->dir);
        if($res->status == 200)
            return Json::successful('图片上传成功!',['name'=>$res->fileInfo->getSaveName(),'url'=>Upload::pathToUrl($thumbPath)]);
        else
            return Json::fail($res->error);
    }

    /**
     * 保存分类管理
     * */
    public function save(Request $request){
        $data = parent::postMore([
            'title',
            'intr',
            ['sort',0],
            'status',],$request);
        if(!$data['title']) return Json::fail('请输入分类名称');
        if($data['sort'] < 0) return Json::fail('排序不能是负数');
        $data['add_time'] = time();
        if(ArticleCategoryModel::be(['title'=>$data['title'],'is_del'=>0])){
            return Json::fail('分类名称已存在！');
        }
        ArticleCategoryModel::set($data);
        return Json::successful('添加分类成功!');
    }

    /**
     * 修改分类
     * */
    public function edit($id){
        if(!$id) return $this->failed('参数错误');
        $article = ArticleCategoryModel::get($id)->getData();
        if(!$article) return Json::fail('数据不存在!');
        $f = array();
        $f[] = Form::input('title','分类名称',$article['title']);
        $f[] = Form::input('intr','分类简介',$article['intr'])->type('textarea');
        $f[] = Form::number('sort','排序',$article['sort']);
        $f[] = Form::radio('status','状态',$article['status'])->options([['value'=>1,'label'=>'显示'],['value'=>0,'label'=>'隐藏']]);
        $form = Form::make_post_form('编辑分类',$f,Url::build('update',array('id'=>$id)),2);
        $this->assign(compact('form'));
        return $this->fetch('public/form-builder');
    }

    /**保存修改
     * @param Request $request
     * @param $id
     * @throws \think\exception\DbException
     */
    public function update(Request $request, $id)
    {
        $data = parent::postMore([
            'title',
            'intr',
            ['image',[]],
            ['sort',0],
            'status',],$request);
        if(!$data['title']) return Json::fail('请输入分类名称');
        if($data['sort'] < 0) return Json::fail('排序不能是负数');
        if(!ArticleCategoryModel::get($id)) return Json::fail('编辑的记录不存在!');
        ArticleCategoryModel::edit($data,$id);
        return Json::successful('修改成功!');
    }

    /**
     * 删除分类
     * */
    public function delete($id)
    {
        $res = ArticleCategoryModel::delArticleCategory($id);
        if(!$res)
            return Json::fail(ArticleCategoryModel::getErrorInfo('删除失败,请稍候再试!'));
        else
            return Json::successful('删除成功!');
    }


}

