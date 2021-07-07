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


namespace app\wap\controller;


use app\wap\model\user\SmsCode;
use app\wap\model\store\StoreService;
use app\wap\model\store\StoreServiceLog;
use app\wap\model\store\StoreOrder;
use app\wap\model\user\User;
use app\wap\model\user\UserAddress;
use app\wap\model\user\UserBill;
use app\wap\model\user\UserExtract;
use app\wap\model\user\UserRecharge;
use app\wap\model\user\UserNotice;
use app\wap\model\user\UserSign;
use app\wap\model\user\SignPoster;
use app\wap\model\user\WechatUser;
use behavior\wap\StoreProductBehavior;
use service\AliMessageService;
use service\WechatTemplateService;
use service\CacheService;
use service\HookService;
use service\JsonService;
use service\SystemConfigService;
use service\GroupDataService;
use service\UtilService;
use service\WechatService;
use think\Cache;
use think\Request;
use think\Session;
use think\Url;
use service\sms\storage\Sms;

class AuthApi extends AuthController
{

    public static function WhiteList()
    {
        return [
            'code',
            'suspensionButton'
        ];
    }

    public function upload()
    {
        $aliyunOss = \Api\AliyunOss::instance([
            'AccessKey' => SystemConfigService::get('accessKeyId'),
            'AccessKeySecret' => SystemConfigService::get('accessKeySecret'),
            'OssEndpoint' => SystemConfigService::get('end_point'),
            'OssBucket' => SystemConfigService::get('OssBucket'),
            'uploadUrl' => SystemConfigService::get('uploadUrl'),
        ]);
        $res = $aliyunOss->upload('file');
        if ($res) {
            return JsonService::successful('上传成功', ['url' => $res['url']]);
        } else {
            return JsonService::fail('上传失败');
        }
    }

    /**
     * 发送短信验证码
     * @param string $phone
     */
    public function code($phone = '')
    {
        $name = "is_phone_code" . $phone;
        if ($phone == '') return JsonService::fail('请输入手机号码!');
        $time = Session::get($name, 'wap');
        if ($time < time() + 60) Session::delete($name, 'wap');
        if (Session::has($name, 'wap') && $time < time()) return JsonService::fail('您发送验证码的频率过高,请稍后再试!');
        $code = AliMessageService::getVerificationCode();
        SmsCode::set(['tel' => $phone, 'code' => md5('is_phone_code'.$code), 'last_time' => time() + 300, 'uid' => $this->uid]);
        Session::set($name, time() + 60, 'wap');
        $smsHandle = new Sms();
        $sms_platform_selection=SystemConfigService::get('sms_platform_selection');
        $smsSignName=SystemConfigService::get('smsSignName');//短信模板ID
        $smsTemplateCode=SystemConfigService::get('smsTemplateCode');//短信模板ID
        if($sms_platform_selection==1){
            if(!$smsSignName || !$smsTemplateCode) return JsonService::fail('系统后台短信没有配置，请稍后在试!');
            $res = AliMessageService::sendmsg($phone, $code);
        }else{
            $res=$smsHandle->send($phone,$smsTemplateCode,['code'=>$code]);
        }
        if($res){
            return JsonService::successful('发送成功',$res);
        } else {
            return JsonService::fail('发送失败!');
        }
    }

    /**
     * 悬浮按钮
     */
    public function suspensionButton()
    {
        $suspension=GroupDataService::getData('suspension_button');
        return JsonService::successful($suspension);
    }
    /**
     * 用户签到信息
     */
    public function getUserList(){
        $signList = UserSign::userSignInlist($this->userInfo['uid'],1,3);
        return JsonService::successful($signList);
    }

    /**
     * 签到明细
     */
    public function getUserSignList($page,$limit){
        $signList = UserSign::userSignInlist($this->userInfo['uid'],$page,$limit);
        return JsonService::successful($signList);
    }
    /**
     * 签到
     */
    public function user_sign()
    {
        $gold_name=SystemConfigService::get('gold_name');//虚拟币名称
        $signed = UserSign::checkUserSigned($this->userInfo['uid']);
        if ($signed) return JsonService::fail('已签到');
        if (false !== $gold_coin = UserSign::sign($this->userInfo,$gold_name)){
            $poster=SignPoster::todaySignPoster($this->userInfo['uid']);
            if($poster){
                return JsonService::successful('签到获得' . floatval($gold_coin).$gold_name,$poster);
            }else{
                return JsonService::fail('生成海报失败!');
            }
        }else
            return JsonService::fail('签到失败!');
    }

    /**
     * 用户信息
     */
    public function userInfo(){
        $user=$this->userInfo;
        $surplus=0; //会员剩余天数
        $time=bcsub($user['overdue_time'],time(),0);
        if($user['level']>0 && $time>0) $surplus=bcdiv($time,86400,2);
        $user['surplus']=ceil($surplus);
        return JsonService::successful($user);
    }

    /**
     * 商品退款原因
     */
    public function refund_reason()
    {
        $goods_order_refund_reason=GroupDataService::getData('goods_order_refund_reason') ?:[];
        return JsonService::successful($goods_order_refund_reason);
    }
    /**设置默认地址
     * @param string $addressId
     */
    public function set_user_default_address($addressId = '')
    {
        if (!$addressId || !is_numeric($addressId)) return JsonService::fail('参数错误!');
        if (!UserAddress::be(['is_del' => 0, 'id' => $addressId, 'uid' => $this->userInfo['uid']]))
            return JsonService::fail('地址不存在!');
        $res = UserAddress::setDefaultAddress($addressId, $this->userInfo['uid']);
        if (!$res)
            return JsonService::fail('地址不存在!');
        else
            return JsonService::successful();
    }

    /**
     * 添加和修改地址
     */
    public function edit_user_address()
    {
        $request = Request::instance();
        if (!$request->isPost()) return JsonService::fail('参数错误!');
        $addressInfo = UtilService::postMore([
            ['address', []],
            ['is_default', false],
            ['real_name', ''],
            ['post_code', ''],
            ['phone', ''],
            ['detail', ''],
            ['id', 0]
        ], $request);
        $addressInfo['province'] = $addressInfo['address']['province'];
        $addressInfo['city'] = $addressInfo['address']['city'];
        $addressInfo['district'] = $addressInfo['address']['district'];
        $addressInfo['is_default'] = $addressInfo['is_default'] == true ? 1 : 0;
        $addressInfo['uid'] = $this->userInfo['uid'];
        unset($addressInfo['address']);

        if ($addressInfo['id'] && UserAddress::be(['id' => $addressInfo['id'], 'uid' => $this->userInfo['uid'], 'is_del' => 0])) {
            $id = $addressInfo['id'];
            unset($addressInfo['id']);
            if (UserAddress::edit($addressInfo, $id, 'id')) {
                if ($addressInfo['is_default'])
                    UserAddress::setDefaultAddress($id, $this->userInfo['uid']);
                return JsonService::successful();
            } else
                return JsonService::fail('编辑收货地址失败!');
        } else {
            if ($address = UserAddress::set($addressInfo)) {
                if ($addressInfo['is_default'])
                    UserAddress::setDefaultAddress($address->id, $this->userInfo['uid']);
                return JsonService::successful();
            } else
                return JsonService::fail('添加收货地址失败!');
        }


    }
    /**
     * 获取用户所有地址
     */
    public function user_address_list()
    {
        $list=UserAddress::getUserValidAddressList($this->userInfo['uid'], 'id,real_name,phone,province,city,district,detail,is_default');
        if ($list)
            return JsonService::successful('ok', $list);
        else
            return JsonService::successful('empty', []);
    }
    /**
     * 获取默认地址
     */
    public function user_default_address()
    {
        $defaultAddress = UserAddress::getUserDefaultAddress($this->userInfo['uid'], 'id,real_name,phone,province,city,district,detail,is_default');
        if ($defaultAddress)
            return JsonService::successful('ok', $defaultAddress);
        else
            return JsonService::successful('empty', []);
    }

    /**删除地址
     * @param string $addressId
     */
    public function remove_user_address($addressId = '')
    {
        if (!$addressId || !is_numeric($addressId)) return JsonService::fail('参数错误!');
        if (!UserAddress::be(['is_del' => 0, 'id' => $addressId, 'uid' => $this->userInfo['uid']]))
            return JsonService::fail('地址不存在!');
        if (UserAddress::edit(['is_del' => '1'], $addressId, 'id'))
            return JsonService::successful();
        else
            return JsonService::fail('删除地址失败!');
    }


    /**获取用户的商品订单列表
     * @param string $type
     * @param int $first
     * @param int $limit
     */
    public function get_user_order_list($type = 0, $first = 0, $limit = 8)
    {
        $list = StoreOrder::getUserOrderList($this->userInfo['uid'], $type, $first, $limit);
        return JsonService::successful($list);
    }

    /**
     * 用户订单数据
     */
    public function userOrderDate()
    {
        $data=StoreOrder::getOrderStatusNum($this->userInfo['uid']);
        return JsonService::successful($data);
    }


    /**提交商品退款
     * @param string $uni
     * @param string $text
     */
    public function apply_order_refund($uni = '')
    {
        if (!$uni) return JsonService::fail('参数错误!');
        $request = Request::instance();
        if (!$request->isPost()) return JsonService::fail('参数错误!');
        $data = UtilService::postMore([
            ['pics', []],
            ['refund_reason', ''],
            ['remarks', ''],
        ], $request);
        $res = StoreOrder::orderApplyRefund($uni, $this->userInfo['uid'],$data);
        if ($res)
            return JsonService::successful();
        else
            return JsonService::fail(StoreOrder::getErrorInfo());
    }
    /**虚拟币充值
     * @param int $price
     * @param int $payType
     */
    public function user_wechat_recharge($price = 0,$payType = 0)
    {
        if (!$price || $price <= 0 || !is_numeric($price)) return JsonService::fail('参数错误');
        if (!isset($this->userInfo['uid']) || !$this->userInfo['uid']) return JsonService::fail('用户不存在');
        try {
        //充值记录
        $rechargeOrder = UserRecharge::addRecharge($this->userInfo['uid'], $price, $payType);
        if (!$rechargeOrder) return JsonService::fail('充值订单生成失败!');
        $orderId = $rechargeOrder['order_id'];
        $goldName = SystemConfigService::get("gold_name");
        switch ($payType) {
            case 'weixin':
                try {
                    $jsConfig = UserRecharge::jsRechargePay($orderId);
                } catch (\Exception $e) {
                    return JsonService::status('pay_error', $e->getMessage(), $rechargeOrder);
                }
                $rechargeOrder['jsConfig'] = $jsConfig;
                return JsonService::status('wechat_pay', '订单创建成功', $rechargeOrder);
                break;
            case 'yue':
                if (UserRecharge::yuePay($orderId, $this->userInfo))
                    return JsonService::status('success', '余额支付成功', $rechargeOrder);
                else
                    return JsonService::status('pay_error', StoreOrder::getErrorInfo());
                break;
            case 'zhifubao':
                $rechargeOrder['orderName'] = $goldName."充值";
                $rechargeOrder['orderId'] = $orderId;
                $rechargeOrder['pay_price'] = $price;
                return JsonService::status('zhifubao_pay','订单创建成功', base64_encode(json_encode($rechargeOrder)));
                break;
            }
        } catch (\Exception $e) {
            return JsonService::fail($e->getMessage());
        }
    }

    /**余额明细
     * @param int $index
     * @param int $first
     * @param int $limit
     */
    public function user_balance_list($index = 0,$first = 0, $limit = 8)
    {
        $model = UserBill::where('uid', $this->userInfo['uid'])->where('category', 'now_money')
            ->where('type','in', 'pay_goods,system_add,pay_product_refund,pay_product,recharge,system_sub,pay_sign_up')
            ->field('title,mark,pm,number,add_time')
            ->where('status', 1)->where('number','>',0);
        switch ($index){
            case 1:
                $model=$model->where('pm',0);
            break;
            case 2:
                $model=$model->where('pm',1);
            break;
        }
        $list=$model->order('add_time DESC')->page((int)$first, (int)$limit)->select();
        $list=count($list) >0 ? $list->toArray() : [];
        foreach ($list as &$v) {
            $v['add_time'] = date('Y/m/d H:i', $v['add_time']);
        }
        return JsonService::successful($list);
    }
    /**金币明细
     * @param int $index
     * @param int $first
     * @param int $limit
     */
    public function user_gold_num_list($index = 0,$first = 0, $limit = 8)
    {
        $model = UserBill::where('uid', $this->userInfo['uid'])->where('category', 'gold_num')
            ->field('title,mark,pm,number,add_time')
            ->where('status', 1)->where('number','>',0);
        switch ($index){
            case 1:
                $model=$model->where('pm',0);
            break;
            case 2:
                $model=$model->where('pm',1);
            break;
        }
        $list=$model->order('add_time DESC')->page((int)$first, (int)$limit)->select();
        $list=count($list) >0 ? $list->toArray() : [];
        foreach ($list as &$v) {
            $v['add_time'] = date('Y/m/d H:i', $v['add_time']);
        }
        return JsonService::successful($list);
    }

    public function get_spread_list($first = 0, $limit = 20)
    {
        $list = User::where('spread_uid', $this->userInfo['uid'])->field('uid,nickname,avatar,add_time')->limit($first, $limit)->order('add_time DESC')->select()->toArray();
        foreach ($list as $k => $user) {
            $list[$k]['add_time'] = date('Y/m/d', $user['add_time']);
        }
        return JsonService::successful($list);
    }

    public function refresh_msn(Request $request)
    {
        $params = $request->post();
        $remind_where = "mer_id = " . $params["mer_id"] . " AND uid = " . $params["uid"] . " AND to_uid = " . $params["to_uid"] . " AND type = 0 AND remind = 0";
        $remind_list = StoreServiceLog::where($remind_where)->order("add_time asc")->select();
        foreach ($remind_list as $key => $value) {
            if (time() - $value["add_time"] > 3) {
                StoreServiceLog::edit(array("remind" => 1), $value["id"]);
                $now_user = StoreService::field("uid,nickname")->where(array("uid" => $params["uid"]))->find();
                if (!$now_user) $now_user = User::field("uid,nickname")->where(array("uid" => $params["uid"]))->find();
                if ($params["to_uid"]) {
                    $userInfo = WechatUser::where('uid', $params["to_uid"])->field(['openid', 'subscribe'])->find();
                    if($userInfo && $userInfo['openid'] && $userInfo['subscribe']) {
                        $head = '客服提醒';
                        $description = '您有新的消息，请注意查收！';
                        $url = SystemConfigService::get('site_url').'/wap/service/service_ing/to_uid/'.$this->uid.'/mer_id/0';
                        $message = WechatService::newsMessage($head, $description, $url, $this->userInfo['avatar']);
                        try {
                            WechatService::staffService()->message($message)->to($userInfo['openid'])->send();
                        } catch (\Exception $e) {
                            \think\Log::error($userInfo['nickname'] . '发送失败' . $e->getMessage());
                        }
                    }
                }
            }
        }
        $where = "mer_id = " . $params["mer_id"] . " AND uid = " . $params["to_uid"] . " AND to_uid = " . $params["uid"] . " AND type = 0";
        $list = StoreServiceLog::where($where)->order("add_time asc")->select()->toArray();
        $ids = [];
        foreach ($list as $key => $value) {
            //设置发送人与接收人区别
            if ($value["uid"] == $params["uid"])
                $list[$key]['my'] = "my";
            else
                $list[$key]['my'] = "to";

            array_push($ids, $value["id"]);
        }

        //设置这些消息为已读
        StoreServiceLog::where(array("id" => array("in", $ids)))->update(array("type" => 1, "remind" => 1));
        return JsonService::successful($list);
    }

    public function add_msn(Request $request)
    {
        $params = $request->post();
        if ($params["type"] == "html")
            $data["msn"] = htmlspecialchars_decode($params["msn"]);
        else
            $data["msn"] = $params["msn"];
        $data["uid"] = $params["uid"];
        $data["to_uid"] = $params["to_uid"];
        $data["mer_id"] = $params["mer_id"] > 0 ? $params["mer_id"] : 0;
        $data["add_time"] = time();
        StoreServiceLog::set($data);
        return JsonService::successful();
    }

    public function get_msn(Request $request)
    {
        $params = $request->post();
        $size = 10;
        $page = $params["page"] >= 0 ? $params["page"] : 1;
        $where = "(mer_id = " . $params["mer_id"] . " AND uid = " . $params["uid"] . " AND to_uid = " . $params["to_uid"] . ") OR (mer_id = " . $params["mer_id"] . " AND uid = " . $params["to_uid"] . " AND to_uid = " . $params["uid"] . ")";
        $list = StoreServiceLog::where($where)->limit(($page - 1) * $size, $size)->order("add_time desc")->select()->toArray();
        foreach ($list as $key => $value) {
            //设置发送人与接收人区别
            if ($value["uid"] == $params["uid"])
                $list[$key]['my'] = "my";
            else
                $list[$key]['my'] = "to";

            //设置这些消息为已读
            if ($value["uid"] == $params["to_uid"] && $value["to_uid"] == $params["uid"]) StoreServiceLog::edit(array("type" => 1, "remind" => 1), $value["id"]);
        }
        $list = array_reverse($list);
        return JsonService::successful($list);
    }

    public function refresh_msn_new(Request $request)
    {
        $params = $request->post();
        $now_user = User::getUserInfo($this->userInfo['uid']);
        if ($params["last_time"] > 0)
            $where = "(uid = " . $now_user["uid"] . " OR to_uid = " . $now_user["uid"] . ") AND add_time>" . $params["last_time"];
        else
            $where = "uid = " . $now_user["uid"] . " OR to_uid = " . $now_user["uid"];

        $msn_list = StoreServiceLog::where($where)->order("add_time desc")->select()->toArray();
        $info_array = $list = [];
        foreach ($msn_list as $key => $value) {
            $to_uid = $value["uid"] == $now_user["uid"] ? $value["to_uid"] : $value["uid"];
            if (!in_array(["to_uid" => $to_uid, "mer_id" => $value["mer_id"]], $info_array)) {
                $info_array[count($info_array)] = ["to_uid" => $to_uid, "mer_id" => $value["mer_id"]];

                $to_user = StoreService::field("uid,nickname,avatar")->where(array("uid" => $to_uid))->find();
                if (!$to_user) $to_user = User::field("uid,nickname,avatar")->where(array("uid" => $to_uid))->find();
                $to_user["mer_id"] = $value["mer_id"];
                $to_user["mer_name"] = '';
                $value["to_info"] = $to_user;
                $value["count"] = StoreServiceLog::where(array("mer_id" => $value["mer_id"], "uid" => $to_uid, "to_uid" => $now_user["uid"], "type" => 0))->count();
                $list[count($list)] = $value;
            }
        }
        return JsonService::successful($list);
    }

    public function get_user_brokerage_list($uid, $first = 0, $limit = 8)
    {
        if (!$uid)
            return $this->failed('用户不存在');
        $list = UserBill::field('A.mark,A.add_time,A.number,A.pm')->alias('A')->limit($first, $limit)
            ->where('A.category', 'now_money')->where('A.type', 'brokerage')
            ->where('A.uid', $this->userInfo['uid'])
            ->join('__STORE_ORDER__ B', 'A.link_id = B.id AND B.uid = ' . $uid)->select()->toArray();
        return JsonService::successful($list);
    }

    public function user_extract()
    {
        if (UserExtract::userExtract($this->userInfo, UtilService::postMore([
            ['type', '', '', 'extract_type'], 'real_name', 'alipay_code', 'bank_code', 'bank_address', ['price', '', '', 'extract_price']
        ])))
            return JsonService::successful('申请提现成功!');
        else
            return JsonService::fail(Extract::getErrorInfo());
    }

    public function clear_cache($uni = '')
    {
        if ($uni) CacheService::clear();
    }

}
