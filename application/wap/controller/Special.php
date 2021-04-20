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

namespace app\wap\controller;

use app\admin\model\special\SpecialBarrage;
use app\wap\model\live\LiveStudio;
use app\wap\model\special\Special as SpecialModel;
use app\wap\model\live\LivePlayback;
use app\wap\model\special\SpecialBuy;
use app\wap\model\special\SpecialContent;
use app\wap\model\special\SpecialCourse;
use app\wap\model\special\SpecialRecord;
use app\wap\model\special\SpecialRelation;
use app\wap\model\special\SpecialSource;
use app\wap\model\special\SpecialSubject;
use app\wap\model\special\SpecialTask;
use app\wap\model\special\SpecialWatch;
use app\wap\model\store\StoreOrder;
use app\wap\model\user\User;
use service\CanvasService;
use service\JsonService;
use service\SystemConfigService;
use service\UtilService;
use think\cache\driver\Redis;
use think\Cookie;
use think\exception\HttpException;
use think\response\Json;
use think\Session;
use think\Url;
use think\Db;
use think\Request;
use service\VodService;
use app\wap\model\routine\RoutineTemplate;

class Special extends AuthController
{
    /*
     * 白名单
     * */
    public static function WhiteList()
    {
        return [
            'details',
            'get_course_list',
            'play',
            'play_num',
            'grade_list',
            'set_barrage_index',
            'special_cate',
            'get_grade_cate',
            'get_subject_cate',
            'get_special_list',
            'lecturerList',
            'lecturerSpecial',
            'teacher_detail',
            'teacher_list',
            'get_cloumn_task',
            'activity_details',
            'isMember',
            'activityType',
            'learningRecords',
            'numberCourses',
            'addLearningRecords',
            'source_detail',
            'getSourceDetail',
            'relatedCourses',
            'getTemplateIds'
        ];
    }
    /**获取视频上传地址和凭证
     * @param string $videoId
     * @param int $type
     */
    public function get_video_playback_credentials($type=1,$videoId='')
    {
        $url=VodService::videoUploadAddressVoucher('',$type,$videoId);
        return JsonService::successful($url);
    }

    /**获取用户相关的订阅消息模版ID
     * @param $pay_type_num
     * @param $special_id
     */
    public function getTemplateIds($pay_type_num,$special_id)
    {
        $wechat_notification_message = SystemConfigService::get('wechat_notification_message');
        if($wechat_notification_message==1) {
            $templateIds='';
        }else{
            $templateIds = RoutineTemplate::getTemplateIdList($pay_type_num, $special_id);
        }
        return JsonService::successful($templateIds);
    }
    /**
     * 专题详情
     * @param $id int 专题id
     * @param $pinkId int 拼团id
     * @param $gift_uid int 赠送礼物用户
     * @param $gift_order_id string 礼物订单号
     * @return
     */
    public function details($id = 0, $pinkId = 0, $gift_uid = 0, $gift_order_id = null, $link_pay_uid = 0, $partake = 0, $gift = 0, $link_pay = 0)
    {
        if (!$id) $this->failed('缺少参数,无法访问', Url::build('index/index'));
        if ($gift_uid && $gift_order_id) {
            if ($gift_uid == $this->uid) $this->failed('您不能领取自己的礼物', Url::build('special/grade_list'));
            if (!User::get($gift_uid)) $this->failed('赠送礼物的用户不存在', Url::build('my/my_gift'));
            $order = StoreOrder::where(['is_del' => 0, 'order_id' => $gift_order_id])->find();
            if (!$order) $this->failed('赠送的礼物订单不存在', Url::build('my/my_gift'));
            if ($order->total_num == $order->gift_count) $this->failed('礼物已被领取完',Url::build('special/grade_list'));
        }
        $special = SpecialModel::getOneSpecial($this->uid, $id);
        if ($special === false) $this->failed(SpecialModel::getErrorInfo('无法访问'), Url::build('index/index'));
        $special_money = SpecialModel::where('id', $id)->field('money, pay_type')->find();
        if (in_array($special_money['money'], [0, 0.00]) || in_array($special_money['pay_type'], [PAY_NO_MONEY, PAY_PASSWORD])) {
            $isPay = 1;
        }else{
            $isPay = (!$this->uid || $this->uid == 0) ? false : SpecialBuy::PaySpecial($id, $this->uid);
        }
        $site_name = SystemConfigService::get('site_name');
        $seo_title = SystemConfigService::get('seo_title');
        $site_logo = SystemConfigService::get('home_logo');
        $isPink = false;
        $liveInfo = [];
        if (isset($special['special'])) {
            $specialinfo = $special['special'];
            $specialinfo = is_string($specialinfo) ? json_decode($specialinfo, true) : $specialinfo;
            if ((float)$specialinfo['money'] < 0) {
                $isPink = true;
            }
            if ($specialinfo['type'] == SPECIAL_LIVE) {
                $liveInfo = LiveStudio::where('special_id', $specialinfo['id'])->find();
                if (!$liveInfo) return $this->failed('直播间尚未查到！', Url::build('index/index'));
                if ($liveInfo->is_del) return $this->failed('直播间已经删除！', Url::build('index/index'));
            }
        }
        $this->assign($special);
        $this->assign('pinkId', $pinkId);
        $this->assign('is_member', 0);
        $this->assign('isPink', $isPink);
        $this->assign('isPay', $isPay);
        $this->assign('liveInfo', json_encode($liveInfo));
        $this->assign('confing', compact('site_name', 'seo_title', 'site_logo'));
        $this->assign('orderId', $gift_order_id);
        $this->assign('link_pay', (int)$link_pay);
        $this->assign('gift', (int)$gift);
        $this->assign('link_pay_uid', $link_pay_uid);
        $this->assign('BarrageShowTime', SystemConfigService::get('barrage_show_time'));
        $this->assign('barrage_index', Cookie::get('barrage_index'));
        return $this->fetch();
    }

    /**专题下课程数量
     * @param $id
     */
    public function numberCourses($id)
    {
        $special = SpecialModel::PreWhere()->find($id);
        $count=SpecialModel::numberChapters($special->type,$id);
        return JsonService::successful($count);
    }
    /**获取浏览人
     * @param $id
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function learningRecords($id){
        $uids=Db::name('learning_records')->where(['special_id'=>$id])->column('uid');
        $record=[];
        $data['recordCoujnt']=count($uids);
        $uids=array_unique($uids);
        $len=bcsub($data['recordCoujnt'],count($uids),0);
        if($data['recordCoujnt']>5){
            $ic=bcsub(5,count($uids),0);
        }else{
            $ic=bcsub($data['recordCoujnt'],count($uids),0);
        }
        if($len && $ic){
            $maxid=User::order('uid desc')->value('uid');
            $minid=User::order('uid asc')->value('uid');
            for($i=0;$i<$ic;$i++){
                $uid=rand($minid,$maxid);
                array_push($uids,$uid);
            }
        }
        foreach ($uids as $key=>$value){
            $user=$this->userdata($value);
            array_push($record,$user);
        }
        $data['record']=$record;
        return JsonService::successful($data);
    }
    public function userdata($uid)
    {
        $user=User::where('uid',$uid)->field('avatar')->find();
        if($user){
            $user=$user->toArray();
        }else{
            $user['avatar']='/system/images/user_log.jpg';
        }
        return $user;
    }
    /**记录专题浏览人
     * @param $id
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function addLearningRecords($id)
    {
        $special = SpecialModel::PreWhere()->find($id);
        SpecialModel::where('id',$id)->setInc('browse_count');
        $uid=$this->uid ? $this->uid : 0;
        if ($this->uid) SpecialRecord::record($id, $this->uid);
        if($this->uid){
            $time=strtotime('today');
            $res=Db::name('learning_records')->where(['uid'=>$uid,'special_id'=>$id,'add_time'=>$time])->find();
            if(!$res){
                Db::name('learning_records')->insert(['uid'=>$uid,'special_id'=>$id,'add_time'=>$time]);
            }
        }
        return JsonService::successful('ok');
    }
    /**
     * 礼物领取
     *
     * */
    public function receive_gift($orderId = '')
    {
        if (!$orderId) return JsonService::fail('缺少参数');
        if (StoreOrder::createReceiveGift($orderId, $this->uid) == false)
            return JsonService::fail(StoreOrder::getErrorInfo('领取失败'));
        else
            return JsonService::successful('领取成功');
    }
    /**
     * 查看单个拼团状态
     * @param $pink_id int 拼团id
     * @return html
     * */
    public function order_pink($pink_id = '', $is_help = 0)
    {
        if (!$pink_id) $this->failed('缺少订单号',Url::build('my/order_list'));
        $this->assign([
            'pink_id' => $pink_id,
            'is_help' => $is_help,
        ]);
        return $this->fetch();
    }

    /**
     * 专题收藏
     * @param $id int 专题id
     * @return json
     */
    public function collect($id = 0)
    {
        if (!$id) return JsonService::fail('缺少参数');
        if (SpecialRelation::SetCollect($this->uid, $id))
            return JsonService::successful('');
        else
            return JsonService::fail();
    }

    /**
     * 获取某个专题的任务视频列表
     * @return json
     * */
    public function get_course_list()
    {
        list($page, $limit, $special_id) = UtilService::getMore([
            ['page', 1],
            ['limit', 10],
            ['special_id', 0],
        ], null, true);
        $uid=$this->uid ? $this->uid : 0;
        //不登录也能查看
        $task_list = SpecialCourse::getSpecialSourceList($special_id, $limit, $page,$uid);
        if(!$task_list['list'])  return JsonService::successful([]);
        foreach ($task_list['list'] as $k => $v) {
            $task_list['list'][$k]['type_name'] = SPECIAL_TYPE[$v['type']];
            $task_list['list'][$k]['taskTrue']=SpecialWatch::whetherWatch($this->uid,$special_id,$v['id']);
        }
        return JsonService::successful($task_list);
    }

    /**
     * 获取专栏套餐
     */
    public function get_cloumn_task()
    {
        list($page, $limit, $special_id, $source_id) = UtilService::getMore([
            ['page', 1],
            ['limit', 10],
            ['special_id', 0],
            ['source_id', 0],
        ], null, true);
        $uid=$this->uid ? $this->uid : 0;
        $task_list = SpecialCourse::get_cloumn_task($special_id, $source_id, $limit, $page,$uid);
        if(!$task_list['list'])  return JsonService::successful([]);
        foreach ($task_list['list'] as $k => $v) {
            $task_list['list'][$k]['taskTrue']=SpecialWatch::whetherWatch($this->uid,$special_id,$v['id']);
            $task_list['list'][$k]['type_name'] = SPECIAL_TYPE[$v['type']];
        }
        return JsonService::successful($task_list);
    }

    /**
     * 播放数量增加
     * @param int $task_id 任务id
     * @return json
     * */
    public function play_num($task_id = 0,$special_id=0)
    {
        if ($task_id == 0 || $special_id == 0) return JsonService::fail('缺少参数');
        try{
            $add_task_play_count = SpecialTask::bcInc($task_id, 'play_count', 1);
            if ($add_task_play_count) {
                $special_source = SpecialSource::getSpecialSource((int)$special_id, [$task_id]);
                if ($special_source) {
                    SpecialSource::where(['special_id' => $special_id, 'source_id' => $task_id])->setInc('play_count',1);
                }
                return JsonService::successful('ok');
            }else {
                return JsonService::fail('err');
            }
        }catch (\Exception $e) {
            return JsonService::fail('err');
        }
    }

    /**
     * 播放任务
     * @param int $task_id 任务id
     * @return string
     * */
    public function play($task_id = 0)
    {
        if (!$task_id) $this->failed('无法访问', Url::build('index/index'));
        Session::set('video_token_' . $task_id, md5(time() . $task_id));
        $tash = SpecialTask::get($task_id);
        if (!$tash) $this->failed('您查看的资源不存在', Url::build('index/index'));
        if ($tash->is_show == 0) $this->failed('您查看的资源已下架', Url::build('index/index'));
        $this->assign('link', Trust($tash->link));
        $this->assign('task_id', $task_id);
        return $this->fetch();
    }

    public function go_video($task_id = 0)
    {
        if (Cookie::has('video_token_count_' . $task_id)) {
            Cookie::set('video_token_count_' . $task_id, Cookie::get('video_token_count_' . $task_id) + 1);
        } else {
            Cookie::set('video_token_count_' . $task_id, 1);
        }
        if (Session::has('video_token_' . $task_id)) {
            $tash = SpecialTask::get($task_id);
            if (Cookie::get('video_token_count_' . $task_id) >= 2) {
                Session::delete('video_token_' . $task_id);
            }
            exit(file_get_contents($tash->link));
        } else {
            throw new HttpException(404, '您查看的链接不存在');
        }
    }

    /**支付接口
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function create_order(){
        list($special_id, $pay_type_num, $payType, $pinkId, $total_num, $link_pay_uid,$key,$mark,$name,$phone,$sex,$age,$company,$remarks) = UtilService::PostMore([
            ['special_id', 0],
            ['pay_type_num', -1],
            ['payType', 'weixin'],
            ['pinkId', 0],
            ['total_num', 1],
            ['link_pay_uid', 0],
            ['key',''],
            ['mark',''],
            ['name',''],
            ['phone',''],
            ['sex',''],
            ['age',''],
            ['company',''],
            ['remarks',''],
        ], $this->request, true);
        switch ($pay_type_num){
            case 30://虚拟币充值
                $auth_api = new AuthApi();
                $auth_api->user_wechat_recharge($special_id, $payType);
            default://专题支付
                $this->create_special_order($special_id, $pay_type_num, $payType, $pinkId, $total_num, $link_pay_uid);
        }
    }
    /**
     * 创建专题支付订单
     * @param int $special_id 专题id
     * @param int $pay_type 购买类型 1=礼物,2=普通购买,3=开团或者拼团
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function create_special_order($special_id, $pay_type_num, $payType, $pinkId, $total_num, $link_pay_uid)
    {

        if (!$special_id) return JsonService::fail('缺少购买参数');
        if ($pay_type_num == -1) return JsonService::fail('选择购买方式');
        $special = SpecialModel::PreWhere()->find($special_id);
        if (!$special) return JsonService::status('ORDER_ERROR', '购买的专题不存在');
        $order = StoreOrder::createSpecialOrder($special, $pinkId, $pay_type_num, $this->uid, $payType, $link_pay_uid, $total_num);
        $orderId = $order['order_id'];
        $info = compact('orderId');
        if ($orderId) {
            $orderInfo = StoreOrder::where('order_id', $orderId)->find();
            if (!$orderInfo || !isset($orderInfo['paid'])) return JsonService::status('pay_error', '支付订单不存在!');
            if ($orderInfo['paid']) return JsonService::status('pay_error', '支付已支付!');
            if (bcsub((float)$orderInfo['pay_price'], 0, 2) <= 0) {
                if (StoreOrder::jsPayPrice($orderId, $this->userInfo['uid']))
                    return JsonService::status('success', '微信支付成功', $info);
                else
                    return JsonService::status('pay_error', StoreOrder::getErrorInfo());
            }
            switch ($payType) {
                case 'weixin':
                    try {
                        $jsConfig = StoreOrder::jsSpecialPay($orderId);
                    } catch (\Exception $e) {
                        return JsonService::status('pay_error', $e->getMessage(), $info);
                    }
                    $info['jsConfig'] = $jsConfig;
                    return JsonService::status('wechat_pay', '订单创建成功', $info);
                    break;
                case 'yue':
                    if (StoreOrder::yuePay($orderId, $this->userInfo['uid']))
                        return JsonService::status('success', '余额支付成功', $info);
                    else
                        return JsonService::status('pay_error', StoreOrder::getErrorInfo());
                    break;
                case 'zhifubao':
                    $info['pay_price'] = $orderInfo['pay_price'];
                    $info['orderName'] = '专题购买';
                    return JsonService::status('zhifubao_pay','订单创建成功', base64_encode(json_encode($info)));
                    break;
            }
        } else {
            return JsonService::fail(StoreOrder::getErrorInfo('订单生成失败!'));
        }
    }

    /**
     * 购买完成后送礼物页面
     * @param string $orderId 订单id
     * @return strign
     * */
    public function gift_special($orderId = null)
    {
        if (is_null($orderId)) $this->failed('缺少订单号,无法进行赠送',Url::build('my/my_gift'));
        $uid=$this->uid;
        if(!$uid)$this->failed('未获取到用户信息！',Url::build('index/index'));
        $special = StoreOrder::getOrderIdToSpecial($orderId,$uid);
        if ($special === false) $this->failed(StoreOrder::getErrorInfo(),Url::build('my/my_gift'));
        $this->assign([
            'orderId'=>$orderId,
            'title'=>'赠送礼物',
            'site_url'=>SystemConfigService::get('site_url') . Url::build('special/details') . '?id=' . $special['id'] . '&gift_uid=' . $this->uid . '&gift_order_id=' . $orderId . '&gift=1&spread_uid=' . $this->uid,
            'special'=>$special
        ]);
        return $this->fetch();
    }

    /**
     * 查看领取记录
     * @param $orderId string 订单id
     * @return html
     * */
    public function gift_receive($orderId = null)
    {
        if (is_null($orderId)) $this->failed('缺少订单号,无法查看领取记录',Url::build('my/my_gift'));
        $special = StoreOrder::getOrderIdGiftReceive($orderId);
        if ($special === false) $this->failed(StoreOrder::getErrorInfo(),Url::build('my/my_gift'));
        $this->assign($special);
        return $this->fetch();
    }

    /**
     * 购买失败删除订单
     * @param string $orderId 订单id
     * @return json
     * */
    public function del_order($orderId = '')
    {
        if (StoreOrder::where('order_id', $orderId)->update(['is_del' => 1]))
            return JsonService::successful();
        else
            return JsonService::fail();
    }

    public function grade_list($type = 0)
    {
        $this->assign(compact('type'));
        return $this->fetch();
    }

    /**
     * 获取我购买的课程
     * @param int $type 课程类型
     * @param int $page 分页
     * @param int $limit 一页显示多少条
     * @return json
     * */
    public function get_grade_list($type = 0, $page = 1, $limit = 10, $search = '')
    {
        return JsonService::successful(SpecialModel::getGradeList($type, (int)$page, (int)$limit, $this->uid, $search));
    }

    /**
     * 拼团成功朋友圈海报展示
     * @param $special_id int 专题id
     * @return html
     * */
    public function poster_show($special_id = 0, $pinkId = 0, $is_help = 0)
    {
        if (!$special_id || !$pinkId) $this->failed('您查看的朋友去圈海报不存在',Url::build('spread/special'));
        $special = SpecialModel::getSpecialInfo($special_id);
        if ($special === false) $this->failed(SpecialModel::getErrorInfo(),Url::build('spread/special'));
        if (!$special['poster_image']) $this->failed('您查看的海报不存在',Url::build('spread/special'));
        $site_url = SystemConfigService::get('site_url') . Url::build('special/pink').'?pink_id='.$pinkId.'&special_id='.$special['id'].'&is_help=1&spread_uid=' . $this->uid;
        try {
            $filename = CanvasService::startPosterSpeclialIng($special, $site_url,$this->uid);
        } catch (\Exception $e) {
            return $this->failed($e->getMessage(),Url::build('spread/special'));
        }
        $this->assign('filename', $filename);
        $this->assign('special', $special);
        $this->assign('is_help', $is_help);
        $this->assign('site_url', $site_url);
        return $this->fetch();
    }
    /**
     * 获取滚动index
     * @param int $index
     */
    public function set_barrage_index($index = 0)
    {
        return JsonService::successful(Cookie::set('barrage_index', $index));
    }

    /**
     * 专题分类
     * @return mixed
     */
    public function special_cate($cate_id = 0,$subject_id=0)
    {
        $this->assign([
            'homeLogo' => SystemConfigService::get('home_logo'),
            'cate_id' => (int)$cate_id,
            'subject_id' => (int)$subject_id
        ]);
        return $this->fetch();
    }

    /**
     * 获取课程分类
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function get_grade_cate()
    {
        $cateogry = SpecialSubject::with('children')->where(['is_show'=>1,'is_del'=>0])->order('sort desc,id desc')->where('grade_id',0)->select();
        return JsonService::successful($cateogry->toArray());
    }

    /**
     * 获取专题
     * @param int $subject_id
     * @param string $search
     * @param int $page
     * @param int $limit
     */
    public function get_special_list($subject_id = 0, $search = '', $page = 1, $limit = 10, $type = 0)
    {
        if (!$subject_id && $type == 0) {
            return JsonService::fail('缺少二级分类id');
        }
        $uid = $this->uid;
        return JsonService::successful(SpecialModel::getSpecialList(compact('subject_id', 'search', 'page', 'limit', 'type', 'uid')));
    }
    /**
     * 学习记录
     * @return mixed
     */
    public function record()
    {
        $this->assign([
            'homeLogo' => SystemConfigService::get('home_logo'),
        ]);
        return $this->fetch();
    }

    /**
     * 是否可以播放
     * @param int $task_id 任务id
     * @return string
     * */
    public function get_task_link($task_id = 0)
    {
        $special_id = $this->request->param('special_id',0);
        if (!$special_id) return JsonService::fail('无法访问');
        if (!$task_id) return JsonService::fail('无法访问');
        $special_source = SpecialSource::getSpecialSource($special_id,[$task_id]);
        $tash = $special_source ? $special_source->toArray() : [];
        if (!$tash) {
            return JsonService::fail('您查看的视频已经下架');
        }else{
            return JsonService::successful($tash);
        }
    }

    /**
     * 课程详情
     * @param $id
     * @return mixed|void
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function task_info($id = 0, $specialId = 0)
    {
        if (!$id) {
            return $this->failed('缺少课程id,无法查看',Url::build('index/index'));
        }
        $taskInfo = SpecialTask::defaultWhere()->where('id', $id)->find();
        $special = SpecialModel::PreWhere()->where('id', $specialId)->find();

        if (!$special) {
            return $this->failed('您查看得专题不存在',Url::build('index/index'));
        }
        if (!$taskInfo) {
            return $this->failed('课程信息不存在无法观看',Url::build('index/index'));
        }
        if ($taskInfo['is_show'] == 0) {
            return $this->failed('该课程已经下架',Url::build('index/index'));
        }
        $isPay = SpecialBuy::PaySpecial($specialId, $this->uid);

        $special_content = SpecialContent::where('special_id',$specialId)->value("content");
        $content = htmlspecialchars_decode($taskInfo->detail ? $taskInfo->detail : $special_content);
        $user_level = !$this->uid ? 0 : User::getUserInfo($this->uid);
        $taskInfo->content =  $content;

        if ($isPay || $special->pay_type == 0 || ($user_level['level'] > 0 && $special->member_pay_type == 0)) {
            $isPay = true;
        }else{
            $special_source = SpecialSource::where(['special_id' => $specialId,'source_id' => $id, 'pay_status' => 0])->find();
            if (!$special_source) {
                return $this->failed('您选择的素材不存在',Url::build('special/details',array('id'=>$specialId)));
            }else{
                $special_source = $special_source->toArray();
                $taskInfo = SpecialTask::defaultWhere()->where('id', $special_source['source_id'])->find();
                if(!$taskInfo){
                    return $this->failed('您选择的素材不存在',Url::build('special/details',array('id'=>$specialId)));
                }
                $taskInfo->content =  $content;
            }
        }
        $this->assign('taskInfo', json_encode($taskInfo ? $taskInfo->toArray() : []));
        $this->assign('is_member', isset($user_level['level']) ? $user_level['level'] : 0);
        $this->assign('specialId', (int)$specialId);
        $this->assign('specialInfo', json_encode($special->toArray()));
        $this->assign('isPay', (int)$isPay);
        return $this->fetch();
    }

    /**检测用户身份
     * @throws \Exception
     */
    public function isMember()
    {
        $user_level = !$this->uid ? 0 : User::getUserInfo($this->uid);
        $data['now_money']=isset($user_level['now_money']) ? $user_level['now_money'] : 0;
        return JsonService::successful($data);
    }
    /**
     * 图文素材详情
     */
    public function task_text_info($id = 0, $specialId = 0)
    {
        if (!$id) {
            return $this->failed('缺少课程id,无法查看',Url::build('index/index'));
        }
        $taskInfo = SpecialTask::defaultWhere()->where('id', $id)->find();
        $special = SpecialModel::PreWhere()->where('id', $specialId)->find();

        if (!$special) {
            return $this->failed('您查看得专题不存在',Url::build('index/index'));
        }
        if (!$taskInfo) {
            return $this->failed('课程信息不存在无法观看',Url::build('index/index'));
        }
        if ($taskInfo['is_show'] == 0) {
            return $this->failed('该课程已经下架',Url::build('index/index'));
        }
        $isPay = SpecialBuy::PaySpecial($specialId, $this->uid);

        $content = htmlspecialchars_decode($taskInfo->content ? $taskInfo->content : "");
        $user_level = !$this->uid ? 0 : User::getUserInfo($this->uid);
        $taskInfo->content =  $content;

        if ($isPay || $special->pay_type == 0 || ($user_level['level'] > 0 && $special->member_pay_type == 0)) {
            $isPay = true;
        }else{
            $special_source = SpecialSource::where(['special_id' => $specialId,'source_id' => $id,'pay_status' => 0])->find();
            if (!$special_source) {
                 return $this->failed('您选择的素材不存在',Url::build('special/details',array('id'=>$specialId)));
            }else{
                $special_source = $special_source->toArray();
                $taskInfo = SpecialTask::defaultWhere()->where('id', $special_source['source_id'])->find();
                if(!$taskInfo){
                    return $this->failed('您选择的素材不存在',Url::build('special/details',array('id'=>$specialId)));
                }
                $taskInfo->content =  $content;
            }
        }
        $this->assign('taskInfo', json_encode($taskInfo ? $taskInfo->toArray() : []));
        $this->assign('is_member', isset($user_level['level']) ? $user_level['level'] : 0);
        $this->assign('specialId', (int)$specialId);
        $this->assign('specialInfo', json_encode($special->toArray()));
        $this->assign('isPay', (int)$isPay);
        return $this->fetch('text_detail');
    }
    /**
     * 充值页面
     */
    public function recharge_index($from='my',$stream_name = "")
    {
        $user_info = $this->userInfo;
        $gold_info = SystemConfigService::more("gold_name,gold_rate,gold_image");
        $recharge_price_list = [60,100,300,500,980,1980,2980,5180,15980];
        $gold_name=SystemConfigService::get('gold_name');//虚拟币名称
        $this->assign(compact('gold_name'));
        $this->assign('from',$from);
        $this->assign('stream_name',$stream_name);
        $this->assign('gold_info',json_encode($gold_info));
        $this->assign('recharge_price_list',json_encode($recharge_price_list));
        $this->assign('user_gold_num',$user_info['gold_num']);
        return $this->fetch('my/gold_coin');
    }
    /**
     * 储存素材观看时间
     */
    public function viewing($special_id=0,$task_id=0,$time=0){
        return JsonService::successful(SpecialWatch::materialViewing($this->userInfo['uid'],$special_id,$task_id,$time));
    }

   /**
    * 讲师详情
     * @return mixed
     */
    public function teacher_detail($id=0)
    {
        $this->assign('id',$id);
        return $this->fetch();
    }
    /**
     * 讲师列表
     * @return mixed
     */
    public function teacher_list()
    {
        return $this->fetch();
    }

    /**
     * 素材详情
     */
    public function source_detail($id=0)
    {
        if (!$id) return JsonService::fail('缺少参数');
        $this->assign('id',$id);
        return $this->fetch();
    }
    /**获取素材详情
     * @param int $source_id
     */
    public function getSourceDetail($source_id=0)
    {
        if (!$source_id) return JsonService::fail('缺少参数');
        $taskInfo = SpecialTask::defaultWhere()->where('id', $source_id)->find();
        SpecialTask::bcInc($source_id, 'play_count', 1);
        return JsonService::successful($taskInfo);
    }

    /**相关课程
     * @param int $source_id
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function relatedCourses($source_id=0)
    {
        if (!$source_id) return JsonService::fail('缺少参数');
        $specialList=SpecialSource::where('source_id',$source_id)->column('special_id');
        $array=[];
        foreach ($specialList as $key=>$value){
            $special = SpecialModel::PreWhere()->where('id', $value)->find();
            $special['count']=0;
            $specialSourceId = SpecialSource::getSpecialSource($value);
            if($specialSourceId) $special['count']=count($specialSourceId);
            $special['record']=Db::name('learning_records')->where(['special_id'=>$value])->count();
            array_push($array,$special);
        }
        return JsonService::successful($array);
    }
}
