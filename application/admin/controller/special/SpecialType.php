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

namespace app\admin\controller\special;

use app\admin\controller\AuthController;
use app\admin\model\live\LiveGoods;
use app\admin\model\special\SpecialBarrage;
use app\admin\model\system\SystemConfig;
use app\admin\model\live\LiveStudio;
use app\admin\model\store\StoreCategory;
use app\admin\model\special\Special as SpecialModel;
use app\admin\model\special\Special;
use app\wap\model\special\SpecialBuy;
use app\admin\model\special\SpecialContent;
use app\admin\model\special\SpecialCourse;
use app\admin\model\special\SpecialSource;
use app\admin\model\special\SpecialSubject;
use app\admin\model\special\SpecialTask;
use app\admin\model\system\Recommend;
use app\admin\model\system\RecommendRelation;
use service\JsonService as Json;
use service\SystemConfigService;
use service\VodService;
use think\Db;
use think\Exception;
use service\FormBuilder as Form;
use Api\AliyunLive as ApiAliyunLive;
use think\Url;
use app\admin\model\special\SpecialTaskCategory as SpecialTaskCategoryModel;

/**课程管理-图文专题控制器
 * Class Special
 * @package app\admin\controller\special
 */
class SpecialType extends AuthController
{

    /** 图文专题列表模板渲染
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function index($subject_id = 0)
    {
        $special_type = $this->request->param('special_type');
        $subjectlist =SpecialSubject::specialCategoryAll();
        $this->assign([
            'activity_type' => $this->request->param('activity_type', 1),
            'subject_id' => $subject_id,
            'special_title' => SPECIAL_TYPE[$special_type],
            'special_type' => $special_type,
            'subject_list' => $subjectlist
        ]);
        $template = $this->switch_template($special_type, request()->action());
        if (!$template) $template = "";
        return $this->fetch($template);
    }

    public function groupList(){
        $subjectlist =SpecialSubject::specialCategoryAll();
        $this->assign([
            'subject_list' => $subjectlist
        ]);
        return $this->fetch('special/group_list/index');
    }

    /**
     * 专题拼团列表
     */
    public function pink_list(){
        $where = parent::getMore([
            ['page', 1],
            ['limit', 20],
            ['store_name', ''],
            ['start_time', ''],
            ['end_time', ''],
            ['order', ''],
            ['is_show', ''],
        ]);
        return Json::successlayui(SpecialModel::getPinkList($where));
    }
    /**
     * 获取图文专题列表数据
     */
    public function list($special_type = 6)
    {
        $where = parent::getMore([
            ['subject_id', 0],
            ['page', 1],
            ['limit', 20],
            ['store_name', ''],
            ['start_time', ''],
            ['end_time', ''],
            ['order', ''],
            ['is_show', ''],
        ]);
        $where['type'] = $special_type;
        return Json::successlayui(SpecialModel::getSpecialList($where));
    }
    /**
     * 添加页面
     * @param int $id
     * @param int $is_live
     * @return mixed|void
     */
    public function add($id = 0)
    {
        $special_type = $this->request->param('special_type');
        if ($id) {
            $special = SpecialModel::getOne($id, $special_type == SPECIAL_LIVE ? $special_type : 0);
            if ($special === false) {
                return $this->failed(SpecialModel::getErrorInfo('您修改的专题不存在'));
            }
            if($special_type!=SPECIAL_LIVE){
                $specialSourceId = SpecialSource::getSpecialSource($id)->toArray();
                $sourceCheckList = array();
                if ($specialSourceId) {
                    foreach ($specialSourceId as $k => $v) {
                        if ($special_type == SPECIAL_COLUMN) {
                            $task_list = SpecialModel::where(['id' => $v['source_id'],'is_del'=>0,'is_show'=>1])->find();
                        }else{
                            $task_list = SpecialTask::where(['id' => $v['source_id'],'is_del'=>0,'is_show'=>1])->find();
                        }
                        if($task_list){
                            $task_list['is_check'] = 1;
                            $task_list['sort'] = $v['sort'];
                            $task_list['pay_status'] = $v['pay_status'];
                            array_push($sourceCheckList,$task_list);
                        }else{
                            array_splice($specialSourceId,$k,1);
                            continue;
                        }
                    }
                }
                $storeCheckList=[];
            }else{
                $live_id=LiveStudio::where('special_id',$id)->value('id');
                $sourceCheckList=LiveGoods::getLiveGoodsLists($live_id,0);
                $storeCheckList=LiveGoods::getLiveProductLists($live_id,1);
            }
            list($specialInfo, $liveInfo) = $special;
            $this->assign('liveInfo', json_encode($liveInfo));
            $this->assign('special', json_encode($specialInfo));
            $this->assign('sourceCheckList', json_encode($sourceCheckList));
            $this->assign('storeCheckList', json_encode($storeCheckList));
        }
        $this->assign('special_type', $special_type);
        $this->assign('id', $id);
        $template = $this->switch_template($special_type, request()->action());
        if (!$template) $template = "";
        return $this->fetch($template);
    }

    /**
     * 素材页面渲染
     * @return
     * */
    public function source_index($coures_id = 0)
    {
        $special_type = $this->request->param('special_type');
        $this->assign('coures_id', $coures_id);
        $this->assign('special_title', SPECIAL_TYPE[$special_type]);
        $this->assign('special_type', $special_type);//图文专题
        $this->assign('activity_type', $this->request->param('activity_type', 1));
        $this->assign('special_id', SpecialCourse::where('id', $coures_id)->value('special_id'));
        $this->assign('specialList', SpecialModel::PreWhere()->field(['id', 'title'])->select());
        $template = $this->switch_template($special_type, request()->action());
        if (!$template) $template = "";
        return $this->fetch($template);
    }

    /**
     * 素材管理
     */
    public function sources_index(){
        $this->assign(['category'=>SpecialTaskCategoryModel::taskCategoryAll()]);
        return $this->fetch('special/task/source_index');
    }

    /**收费专题
     * @param int $id
     */
    public function is_pay_status_c($id=0)
    {
        $this->assign('source_id',$id);
        return $this->fetch('special/task/special_pay');
    }
    public function is_pay_source_list($source_id=0)
    {
        $special_id=SpecialSource::where(['source_id' => $source_id,'pay_status' =>1])->column('special_id');
        $special=SpecialModel::where('id','in',$special_id)->field('id,title,image')->select();
        $special=count($special)>0 ? $special->toArray() : [];
        return Json::successlayui(count($special),$special);
    }

    /**
     * 后台素材列表
     */
    public function get_source_list(){
        $where = parent::getMore([
            ['page', 1],
            ['is_show', ''],
            ['limit', 20],
            ['title', ''],
            ['pid', ''],
            ['type', ''],
            ['order', ''],
        ]);
        $special_task = SpecialTask::getTaskList($where);
        if (isset($special_task['data']) && $special_task['data']) {
            foreach ($special_task['data'] as $k => $v) {
                $special_task['data'][$k]['use'] =SpecialSource::where(['source_id' => $v['id']])->count();
                $special_task['data'][$k]['is_pay_status'] =SpecialSource::where(['source_id' => $v['id'],'pay_status' =>1])->count();
                $special_task['data'][$k]['recommend'] = RecommendRelation::where('a.link_id', $v['id'])->where('a.type', 'in', [10])->alias('a')
                    ->join('__RECOMMEND__ r', 'a.recommend_id=r.id')->column('a.id,r.title');
                switch ($v['type']){
                    case 1:
                        $special_task['data'][$k]['types'] = '图文';
                        break;
                    case 2:
                        $special_task['data'][$k]['types'] = '音频';
                        break;
                    case 3:
                        $special_task['data'][$k]['types'] = '视频';
                        break;
                }
            }
        }
        return Json::successlayui($special_task);
    }
    /**
     * 图文、音频、视频、专栏专题素材列表获取
     * @return json
     * */
    public function source_list()
    {
        $where = parent::getMore([
            ['page', 1],
            ['is_show', 1],
            ['limit', 20],
            ['title', ''],
            ['pid', ''],
            ['type', ''],
            ['order', ''],
            ['special_id', 0],
            ['special_type', 0],
            ['check_source_sure', '']
        ]);
        $special_source = array();
        if (isset($where['special_id']) && $where['special_id'] && $where['special_type']!=SPECIAL_LIVE) {
            $special_source = SpecialSource::where(['special_id' => $where['special_id']])->select()->toArray();
            $special_source = array_column($special_source, 'pay_status', 'source_id');
        }else if(isset($where['special_id']) && $where['special_id'] && $where['special_type']==SPECIAL_LIVE){
            $live_id=LiveStudio::where('special_id',$where['special_id'])->value('id');
            $special_source = LiveGoods::where(['live_id' => $live_id,'is_delete'=>0,'type'=>0])->select()->toArray();
            $special_source = array_column($special_source, 'id', 'special_id');
        }

        $special_task = SpecialTask::getTaskList2($where);
        if (isset($special_task['data']) && $special_task['data']) {
            foreach ($special_task['data'] as $k => $v) {
                if (array_key_exists($v['id'], $special_source)) {
                    $special_task['data'][$k]['is_check'] = 1;
                    $special_task['data'][$k]['LAY_CHECKED'] = true;
                    if ($special_source[$v['id']] && $special_source[$v['id']] == PAY_MONEY) {
                        $special_task['data'][$k]['pay_status'] = PAY_MONEY;
                    } else {
                        $special_task['data'][$k]['pay_status'] = PAY_NO_MONEY;
                    }
                } else {
                    $special_task['data'][$k]['is_check'] = 0;
                    $special_task['data'][$k]['pay_status'] = PAY_MONEY;
                }
                switch ($v['type']){
                        case 1:
                            $special_task['data'][$k]['types'] = '图文';
                        break;
                        case 2:
                            $special_task['data'][$k]['types'] = '音频';
                        break;
                        case 3:
                            $special_task['data'][$k]['types'] = '视频';
                        break;
                        case 4:
                            $special_task['data'][$k]['types'] = '直播';
                        break;
                        case 5:
                            $special_task['data'][$k]['types'] = '专栏';
                        break;
                        case 6:
                            $special_task['data'][$k]['types'] = '其他';
                        break;
                }
            }
        }
        $special_task['source'] = $special_source;
        return Json::successlayui($special_task);
    }
    /**
     * 添加和修改素材
     * @param int $id 修改
     * @return
     * */
    public function add_source($id = 0)
    {
        $special_type = $this->request->param("special_type");
        $this->assign('id', $id);
        if ($id) {
            $task = SpecialTask::get($id);
            $task->detail = htmlspecialchars_decode($task->detail);
            $task->content = htmlspecialchars_decode($task->content);
            $task->image = get_key_attr($task->image);
            $this->assign('special', $task);
        }
        $alicloud_account_id=SystemConfigService::get('alicloud_account_id');//阿里云账号ID
        $configuration_item_region=SystemConfigService::get('configuration_item_region');//配置项region
        $demand_switch=SystemConfigService::get('demand_switch');//视频点播开关
        $this->assign('alicloud_account_id', $alicloud_account_id);
        $this->assign('configuration_item_region', $configuration_item_region);
        $this->assign('demand_switch', $demand_switch);
        $this->assign('special_type', $special_type);
        $template = $this->switch_template($special_type, request()->action());
        if (!$template) $template = "";
        return $this->fetch($template);
    }

    /**
     * 添加和修改素材
     * @param int $id 修改
     * @return json
     * */
    public function save_source($id = 0)
    {
        $special_type = $this->request->param('special_type');
        if (!$special_type) return Json::fail('专题类型参数缺失');
        $data = parent::postMore([
            ['title', ''],
            ['image', ''],
            ['content', ''],
            ['detail', ''],
            ['image', ''],
            ['link', ''],
            ['videoId', ''],
            ['file_type', ''],
            ['file_name', ''],
            ['sort', 0],
            ['pid', 0],
            ['is_show', 1],
        ]);
        $data['type'] = $special_type;
        if (!$data['title']) return Json::fail('请输入课程标题');
        if (!$data['image']) return Json::fail('请上传封面图');
        if ($id) {
            unset($data['is_show']);
            SpecialTask::update($data, ['id' => $id]);
            return Json::successful('修改成功');
        } else {
            $data['add_time'] = time();
            if (SpecialTask::set($data))
                return Json::successful('添加成功');
            else
                return Json::fail('添加失败');
        }
    }

    /**
     * 统一添加素材
     */
    public function addSources($id=0)
    {
        if ($id) {
            $task = SpecialTask::get($id);
            $task->detail = htmlspecialchars_decode($task->detail);
            if($task['type']!=1){
                $task->content =$task->link ? ($task->content ? htmlspecialchars_decode($task->content) : '') : '';
            }else{
                $task->content = htmlspecialchars_decode($task->content);
            }
            $task->image = get_key_attr($task->image);
            $this->assign('special', $task);
        }
        $alicloud_account_id=SystemConfigService::get('alicloud_account_id');//阿里云账号ID
        $configuration_item_region=SystemConfigService::get('configuration_item_region');//配置项region
        $demand_switch=SystemConfigService::get('demand_switch');//视频点播开关
        $this->assign('alicloud_account_id', $alicloud_account_id);
        $this->assign('configuration_item_region', $configuration_item_region);
        $this->assign('demand_switch', $demand_switch);
        $this->assign('id', $id);
        return $this->fetch('special/task/add_source');
    }
    /**
     * 快速编辑
     * @param string $field 字段名
     * @param int $id 修改的主键
     * @param string value 修改后的值
     * @return json
     */
    public function set_value($field = '', $id = '', $value = '', $model_type)
    {
        if(!$field || !$id || $value == '' || !$model_type) Json::fail('缺少参数3');

        if (!$model_type) Json::fail('缺少参数2');
        if ($model_type == "special") {//需要执行事件触发器，db写法无法触发。
            if($field=='sort' && bcsub($value,0,0)<0)return Json::fail('排序不能为负数');
            $res =  SpecialModel::update([$field => $value], ['id' => $id]);
        }else{
            $model_type = $this->switch_model($model_type);
            $res = $model_type::saveFieldByWhere(['id' => $id],[$field => $value]);
        }
        if ($res)
            return Json::successful('保存成功');
        else
            return Json::fail('保存失败');
    }

    /**根据标识选着模型对象
     * @param $model_type 表名
     * @return Special|SpecialTask|bool
     */
    protected function switch_model($model_type)
    {
        if (!$model_type) {
            return false;
        }
        switch ($model_type) {
            case 'task':
                return new SpecialTask();
                break;
            case 'special':
                return new Special();
                break;
            case 'source':
                return new SpecialSource();
                break;
            case 'live_goods':
                return new LiveGoods();
                break;
            default:
                return false;
        }
    }

    /**
     * 编辑详情
     * @return mixed
     */
    public function update_content($id = 0)
    {
        $field = $this->request->param('field');
        $special_type = $this->request->param('special_type');
        if (!$special_type) {
            return $this->failed('专题类型丢失 ');
        }
        if (!$id) {
            return $this->failed('缺少id ');
        }
        if (!$field) {
            return $this->failed('缺少要修改的字段参数 ');
        }
        try {
            $this->assign([
                'action' => Url::build('save_content', ['id' => $id, 'field' => $field]),
                'field' => $field,
                'contentOrDetail' => htmlspecialchars_decode(SpecialTask::where('id', $id)->value($field))
            ]);
            $template = $this->switch_template($special_type, request()->action());
            if (!$template) $this->failed('模板查询异常 ');
            return $this->fetch($template);
        } catch (\Exception $e) {
            return $this->failed('异常错误 ');
        }
    }

    /**
     * @param $id
     * @throws \think\exception\DbException
     */
    public function save_content($id, $field)
    {
        $content = $this->request->post($field, '');
        $task = SpecialTask::get($id);
        if (!$field) return Json::fail('修改项缺失');
        if (!$task) {
            return Json::fail('修改得素材不存在');
        }
        $task->$field = htmlspecialchars($content);
        if ($task->save()) {
            return Json::successful('保存成功');
        } else {
            return Json::fail('保存失败或者您没有修改什么');
        }
    }


    /**获取分类
     * @param int $grade_id
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function get_subject_list($grade_id = 0)
    {
        $subjectlist =SpecialSubject::specialCategoryAll();
        return Json::successful($subjectlist);
    }
    /**获取素材列表
     * @param bool $type
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function get_special_source_list()
    {
        $special_type = $this->request->param('special_type');
        $where['is_show'] = 1;
        if ($special_type && is_numeric($special_type) && $special_type != SPECIAL_COLUMN) {
            $where['type'] = $special_type;
        }

        if ($special_type == SPECIAL_COLUMN) {//专栏
            $sourceList = SpecialModel::where($where)->whereIn('type', [SPECIAL_IMAGE_TEXT, SPECIAL_AUDIO, SPECIAL_VIDEO])->field('id, title, type')->order('type desc, sort desc')->select();
            if ($sourceList) {
                foreach ($sourceList as $k => $v) {
                    $sourceList[$k]['title'] = SPECIAL_TYPE[$v['type']] . "--" . $v['title'];
                }
            }
        } else {
            $sourceList = SpecialTask::where($where)->field('id, title')->order('sort desc')->select();
        }
        return Json::successful($sourceList->toArray());
    }

    /**获取视频上传地址和凭证
     * @param string $videoId
     * @param string $FileName
     * @param int $type
     */
    public function video_upload_address_voucher()
    {
        $data = parent::postMore([
            ['FileName',''],
            ['type',1],
            ['image',''],
            ['videoId',''],
        ]);
        $url=VodService::videoUploadAddressVoucher($data['FileName'],$data['type'],$data['videoId'],$data['image']);
        return Json::successful($url);
    }
    /**
     * 编辑和新增
     *
     * @return json
     */
    public function save_special($id = 0)
    {
        $special_type = $this->request->param('special_type');
        if (!$special_type || !is_numeric($special_type)) return Json::fail('专题类型参数缺失');
        $data = parent::postMore([
            ['title', ''],
            ['abstract', ''],
            ['subject_id', 0],
            ['lecturer_id', 0],
            ['fake_sales', 0],
            ['browse_count', 0],
            ['label', []],
            ['image', ''],
            ['banner', []],
            ['poster_image', ''],
            ['service_code', ''],
            ['money', 0],
            ['content', ''],
            ['is_pink', 0],
            ['pink_money', 0],
            ['pink_number', 0],
            ['pink_time', 0],
            ['pink_strar_time', ''],
            ['pink_end_time', ''],
            ['subjectIds',''],
            ['storeIds',''],
            ['phrase', ''],
            ['is_fake_pink', 0],
            ['sort', 0],
            ['fake_pink_number', 0],
            ['member_money', 0],
            ['member_pay_type', 0],
            ['pay_type', 0],//支付方式：免费、付费、密码
        ]);
        $data['check_source_sure']=json_decode($data['subjectIds']);
        $data['type'] = $special_type;
        if ($special_type == SPECIAL_LIVE) {
            $liveInfo = parent::postMore([
                ['is_remind', 1],//开播提醒
                ['remind_time', 0],//开播提醒时间
                ['live_time', ''],//直播开始时间
                ['live_duration', 0],//直播时长 单位：分钟
                ['auto_phrase', ''],//首次进入直播间欢迎词
                ['password', ''],//密码（密码访问模式）
                ['is_recording', ''],//是否录制视频
            ]);
        }
        if (!$data['subject_id']) return Json::fail('请选择分类');
        if ($special_type != SPECIAL_LIVE) {
            if (!$data['check_source_sure']) return Json::fail('请选择素材');
        }
        if (!$data['title']) return Json::fail('请输入专题标题');
        if (!$data['abstract']) return Json::fail('请输入专题简介');
        if (!count($data['label'])) return Json::fail('请输填写标签');
        if (!count($data['banner'])) return Json::fail('请上传banner图');
        if (!$data['image']) return Json::fail('请上传专题封面图');
        if (!$data['poster_image']) return Json::fail('请上传推广海报');
        if (!$data['service_code']) return Json::fail('请上传客服二维码');
        if (!$data['phrase']) return Json::fail('请填写短语！');
        if ($data['pay_type'] == PAY_MONEY && ($data['money'] == '' || $data['money'] == 0.00 || $data['money'] < 0)) return Json::fail('购买金额未填写或者金额非法');
        if ($data['member_pay_type'] == MEMBER_PAY_MONEY && ($data['member_money'] == '' || $data['member_money'] == 0.00 || $data['member_money'] < 0)) return Json::fail('会员购买金额未填写或金额非法');
        if ($data['pay_type'] != PAY_MONEY) {
            $data['money'] = 0;
        }
        if ($data['member_pay_type'] != MEMBER_PAY_MONEY) {
            $data['member_money'] = 0;
        }
        $content = htmlspecialchars($data['content']);
        $data['label'] = json_encode($data['label']);
        if ($special_type == SPECIAL_LIVE) {
            $liveInfo['live_title'] = $data['title'];
            $liveInfo['studio_pwd'] = $liveInfo['password'];
            if (strlen($liveInfo['studio_pwd']) > 32) return Json::fail('密码长度不能超过32位');
            $liveInfo['start_play_time'] = $liveInfo['live_time'];
            $liveInfo['stop_play_time'] = date('Y-m-d H:i:s', bcadd(strtotime($liveInfo['live_time']), bcmul($liveInfo['live_duration'], 60)));
            $liveInfo['live_introduction'] = $data['abstract'];
            unset($liveInfo['live_time'], $liveInfo['password']);
        }
        $banner = [];
        SpecialModel::beginTrans();
        try {
            foreach ($data['banner'] as $item) {
                $banner[] = $item['pic'];
            }
            $sourceCheckList = $data['check_source_sure'];
            unset($data['check_source_sure']);
            $data['banner'] = json_encode($banner);
            unset($data['content']);
            if ($id) {
                SpecialModel::update($data, ['id' => $id]);
                SpecialContent::update(['content' => $content], ['special_id' => $id]);
                if ($special_type == SPECIAL_LIVE) {
                    LiveStudio::update($liveInfo, ['special_id' => $id]);
                }
                if ($special_type == SPECIAL_LIVE) {
                    $save_source = LiveGoods::saveLiveGoods($sourceCheckList, $id,0);
                }else{
                    $save_source = SpecialSource::saveSpecialSource($sourceCheckList,$id,$special_type,$data);
                }
                if (!$save_source) return Json::fail('添加失败');
                if ($special_type == SPECIAL_COLUMN) {
                    SpecialBuy::columnUpdate($id);
                }
                SpecialModel::commitTrans();
                return Json::successful('修改成功');
            } else {
                $data['add_time'] = time();
                $data['is_show'] = 1;
                $data['is_fake_pink'] = $data['is_pink'] ? $data['is_fake_pink'] : 0;
                $res1 = SpecialModel::insertGetId($data);
                $res2 = SpecialContent::set(['special_id' => $res1, 'content' => $content, 'add_time' => time()]);
                $res5=true;
                if ($special_type == SPECIAL_LIVE) {
                    $liveInfo['special_id'] = $res1;
                    $liveInfo['stream_name'] = LiveStudio::getliveStreamName();
                    $liveInfo['live_image'] = $data['image'];
                    $res5 = LiveStudio::set($liveInfo);
                }
                if ($special_type == SPECIAL_LIVE) {
                    $res3 = LiveGoods::saveLiveGoods($sourceCheckList, $res1,0);
                }else{
                    $res3 = SpecialSource::saveSpecialSource($sourceCheckList,$res1,$special_type,$data);
                }
                if ($res1 && $res2 && $res3 && $res5) {
                    SpecialModel::commitTrans();
                    return Json::successful('添加成功');
                } else {
                    SpecialModel::rollbackTrans();
                    return Json::fail('添加失败');
                }
            }
        } catch (\Exception $e) {
            SpecialModel::rollbackTrans();
            return Json::fail($e->getMessage());
        }
    }

    /**删除指定专题和素材
     * @param int $id修改的主键
     * @param $model_type要修改的表
     * @throws \think\exception\DbException
     */
    public function delete($id = 0, $model_type = false)
    {
        if (!$id || !isset($model_type) || !$model_type) return Json::fail('缺少参数');
        $model_table = $this->switch_model($model_type);
        if (!$model_table) return Json::fail('缺少参数');
        try {
            $res_get = $model_table::get($id);
            $model_table::startTrans();
            if (!$res_get) return Json::fail('删除的数据不存在');
            $res_del = $res_get->where('id',$id)->update(['is_del'=>1]);
            if ($model_type == 'special' && $res_del) {
                $model_source = $this->switch_model('source');
                $res = $model_source::where('special_id', $id)->delete();
            }else if($model_type == 'task' && $res_del){
                $model_source = $this->switch_model('source');
                $res= $model_source::where('source_id', $id)->delete();
            }
            $model_table::commit();
            return Json::successful('删除成功');
        } catch (\Exception $e) {
            $model_table::rollback();
            return Json::fail(SpecialTask::getErrorInfo('删除失败' . $e->getMessage()));
        }
    }

    /**转换专题
     * @param int $id修改的主键
     * @param $model_type要修改的表
     * @throws \think\exception\DbException
     */

    public function turnTo($id = 0, $model_type = false,$type=1)
    {
        if (!$id || !isset($model_type) || !$model_type) return Json::fail('缺少参数');
        $model_table = $this->switch_model($model_type);
        if (!$model_table) return Json::fail('缺少参数');
        try {
            $res_get = $model_table::get($id);
            $model_table::startTrans();
            if (!$res_get) return Json::fail('转换的数据不存在');
            $res= $model_table::where('id',$id)->update(['type'=>$type]);
            $model_table::commit();
            return Json::successful('转换成功');
        } catch (\Exception $e) {
            $model_table::rollback();
            return Json::fail(SpecialTask::getErrorInfo('转换失败' . $e->getMessage()));
        }
    }

    /**
     * 添加推荐
     * @param int $special_id
     * @return mixed
     * @throws \think\exception\DbException
     */
    public function recommend($special_id = 0)
    {
        if (!$special_id) $this->failed('缺少参数');
        $special = SpecialModel::get($special_id);
        if (!$special) $this->failed('没有查到此专题');
        if ($special->is_del) $this->failed('此专题已删除');
        $form = Form::create(Url::build('save_recommend', ['special_id' => $special_id]), [
            Form::select('recommend_id', '推荐')->setOptions(function (){
                $model=Recommend::where(['is_show' => 1,'is_fixed'=>0]);
                $model=$model->where('type',0);
                $list = $model->field('title,id')->order('sort desc,add_time desc')->select();
                $menus = [];
                foreach ($list as $menu) {
                    $menus[] = ['value' => $menu['id'], 'label' => $menu['title']];
                }
                return $menus;
            })->filterable(1),
            Form::number('sort', '排序'),
        ]);
        $form->setMethod('post')->setTitle('推荐设置')->setSuccessScript('parent.$(".J_iframe:visible")[0].contentWindow.location.reload(); setTimeout(function(){parent.layer.close(parent.layer.getFrameIndex(window.name));},800);');
        $this->assign(compact('form'));
        return $this->fetch('public/form-builder');
    }

    /**
     * 保存推荐
     * @param int $special_id
     * @throws \think\exception\DbException
     */
    public function save_recommend($special_id = 0)
    {
        if (!$special_id) $this->failed('缺少参数');
        $data = parent::postMore([
            ['recommend_id', 0],
            ['sort', 0],
        ]);
        if (!$data['recommend_id']) return Json::fail('请选择推荐');
        $recommend = Recommend::get($data['recommend_id']);
        if (!$recommend) return Json::fail('导航菜单不存在');
        $data['add_time'] = time();
        $data['type'] = $recommend->type;
        $data['link_id'] = $special_id;
        if (RecommendRelation::be(['type' => $recommend->type, 'link_id' => $special_id, 'recommend_id' => $data['recommend_id']])) return Json::fail('已推荐,请勿重复推荐');
        if (RecommendRelation::set($data))
            return Json::successful('推荐成功');
        else
            return Json::fail('推荐失败');
    }

    /**取消推荐
     * @param int $id
     */
    public function cancel_recommendation($id=0,$special_id=0)
    {
        if (!$id || !$special_id) $this->failed('缺少参数');
        if (RecommendRelation::be(['id' => $id, 'link_id' => $special_id])){
            $res=RecommendRelation::where(['id'=>$id,'link_id'=>$special_id])->delete();
            if ($res)
                return Json::successful('取消推荐成功');
            else
                return Json::fail('取消推荐失败');
        }else{
            return Json::fail('推荐不存在');
        }
    }

    /**素材推荐
     * @param int $source_id
     */
    public function sourceRecommend($source_id = 0)
    {
        if (!$source_id) $this->failed('缺少参数');
        $source = SpecialTask::get($source_id);
        if (!$source) $this->failed('没有查到此素材');
        if ($source->is_del) $this->failed('此素材已删除');
        $form = Form::create(Url::build('save_recommend', ['special_id' => $source_id]), [
            Form::select('recommend_id', '推荐')->setOptions(function () use ($source_id) {
                $model=Recommend::where(['is_show' => 1,'is_fixed'=>0,'type'=>10]);
                $list = $model->field('title,id')->order('sort desc,add_time desc')->select();
                $menus = [];
                foreach ($list as $menu) {
                    $menus[] = ['value' => $menu['id'], 'label' => $menu['title']];
                }
                return $menus;
            })->filterable(1),
            Form::number('sort', '排序'),
        ]);
        $form->setMethod('post')->setTitle('推荐设置')->setSuccessScript('parent.$(".J_iframe:visible")[0].contentWindow.location.reload(); setTimeout(function(){parent.layer.close(parent.layer.getFrameIndex(window.name));},800);');
        $this->assign(compact('form'));
        return $this->fetch('public/form-builder');
    }

    /**专题编辑内素材列表
     * @param int $coures_id
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function search_task($coures_id = 0)
    {
        $special_type = $this->request->param('special_type');
        $special_id = $this->request->param('special_id');
        $this->assign('coures_id', $coures_id);
        $this->assign('special_title', SPECIAL_TYPE[$special_type]);
        $this->assign('special_type', $special_type);//图文专题
        $this->assign('activity_type', $this->request->param('activity_type', 1));
        $this->assign('special_id', $special_id);
        $this->assign('specialList', SpecialModel::PreWhere()->field(['id', 'title'])->select());
        return $this->fetch('special/task/search_task');
    }

    public function searchs_task($coures_id=0)
    {
        $special_type = $this->request->param('special_type');
        $special_id = $this->request->param('special_id');
        $this->assign('coures_id', $coures_id);
        $this->assign('special_title', SPECIAL_TYPE[$special_type]);
        $this->assign('special_type', $special_type);//图文专题
        $this->assign('special_id', $special_id);
        $this->assign('cateList', SpecialTaskCategoryModel::taskCategoryAll());
        return $this->fetch('special/task/searchs_task');
    }

    /**专题编辑内素材列表
     * @param int $coures_id
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function special_task($coures_id = 0)
    {
        $special_type = $this->request->param('special_type');
        $special_id = $this->request->param('special_id');
        $this->assign('coures_id', $coures_id);
        $this->assign('special_title', SPECIAL_TYPE[$special_type]);
        $this->assign('special_type', $special_type);//图文专题
        $this->assign('activity_type', $this->request->param('activity_type', 1));
        $this->assign('special_id', $special_id);
        $this->assign('specialList', SpecialModel::PreWhere()->field(['id', 'title'])->select());
        return $this->fetch('special/task/special_task');
    }

    /**
     * @param int $coures_id
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function create($coures_id = 0){
        $special_type = $this->request->param('special_type');
        $special_id = $this->request->param('special_id');
        $this->assign('coures_id', $coures_id);
        $this->assign('special_title', SPECIAL_TYPE[$special_type]);
        $this->assign('special_type', $special_type);//图文专题
        $this->assign('activity_type', $this->request->param('activity_type', 1));
        $this->assign('special_id', $special_id);
        $this->assign('specialList', SpecialModel::PreWhere()->field(['id', 'title'])->select());
        return $this->fetch('special/task/create');
    }

    /**
     * 专题弹幕列表和添加
     * */
    public function special_barrage()
    {
        $this->assign([
            'type' => $this->request->param('type', 1),
            'is_layui' => true,
            'open_barrage' => SystemConfig::getValue('open_barrage'),
        ]);
        return $this->fetch('special/barrage/special_barrage');
    }

    /**
     * 获取专题弹幕列表
     * */
    public function get_barrage_list($page = 1, $limit = 22)
    {
        $list = SpecialBarrage::where('is_show', 1)->order('sort desc,id desc')->page((int)$page, (int)$limit)->select();
        $list = count($list) ? $list->toArray() : [];
        $count = SpecialBarrage::where('is_show', 1)->count();
        return Json::successful(compact('list', 'count'));
    }

    /**
     * 删除某个弹幕
     * @param int $id 弹幕id
     * */
    public function del_barrage($id = 0)
    {
        if (SpecialBarrage::del($id))
            return Json::successful('删除成功');
        else
            return Json::fail('删除失败');
    }

    /**
     * 保存专题弹幕
     * */
    public function save_barrage($id = 0)
    {
        $data = parent::postMore([
            ['nickname', ''],
            ['avatar', ''],
            ['action', 0],
            ['sort', 0],
        ]);
        if (!$data['nickname']) return Json::fail('请填写用户昵称');
        if (!$data['avatar']) return Json::fail('请上传用户图像');
        if (!$data['action']) return Json::fail('请勾选动作类型');
        if ($id) {
            SpecialBarrage::edit($data, $id);
            return Json::successful('修改成功');
        } else {
            $data['add_time'] = time();
            if (SpecialBarrage::set($data))
                return Json::successful('添加成功');
            else
                return Json::fail('添加失败');
        }
    }

    /**
     * 设置虚拟用户弹幕是否开启
     * */
    public function set_barrage_show($value = 0, $key_nime = '')
    {
        if (!$key_nime) return Json::fail('缺少参数');
        $confing = SystemConfig::where(['menu_name' => $key_nime])->find();
        if ($confing) {
            SystemConfig::edit(['value' => json_encode($value)], $confing->id);
            return Json::successful('操作成功');
        } else {
            $res = SystemConfig::set([
                'menu_name' => $key_nime,
                'type' => 'radio',
                'parameter' => "1=开启\n0=关闭",
                'value' => '1',
                'config_tab_id' => 1,
                'upload_type' => 0,
                'width' => '100%',
                'info' => '虚拟用户专题弹幕开关',
                'desc' => '虚拟用户专题弹幕开关',
                'sort' => 0,
                'status' => 1
            ]);
            if ($res)
                return Json::successful('操作成功');
            else
                return Json::fail('操作失败');
        }
    }

    /**渲染模板
     * @param $special_type
     * @param $template_type
     * @return bool|string|void
     */
    protected function switch_template($special_type, $template_type)
    {
        if (!$special_type || !$template_type) {
            return false;
        }
        switch ($special_type) {
            case 1:
                return 'special/image_text/' . $template_type;
                break;
            case 2:
                return 'special/audio_video/' . $template_type;
                break;
            case 3:
                return 'special/audio_video/' . $template_type;
                break;
            case 4:
                return 'special/live/' . $template_type;
                break;
            case 5:
                return 'special/column/' . $template_type;
                break;
            default:
                return $this->failed('没有对应模板 ');
        }
    }

}
