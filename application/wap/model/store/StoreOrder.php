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

namespace app\wap\model\store;

use app\wap\model\special\Special;
use app\wap\model\special\SpecialBuy;
use app\wap\model\user\User;
use app\wap\model\user\UserAddress;
use app\wap\model\user\UserBill;
use app\wap\model\user\WechatUser;
use basic\ModelBasic;
use behavior\wap\StoreProductBehavior;
use behavior\wechat\PaymentBehavior;
use service\AlipayTradeWapService;
use service\HookService;
use service\SystemConfigService;
use service\WechatService;
use service\WechatTemplateService;
use think\Cache;
use think\Url;
use traits\ModelTrait;
use service\GroupDataService;
use app\wap\model\routine\RoutineTemplate;

class StoreOrder extends ModelBasic
{
    use ModelTrait;

    protected $insert = ['add_time'];

    protected static $payType = ['weixin' => '微信支付', 'yue' => '余额支付', 'offline' => '线下支付', 'zhifubao' => '支付宝'];

    protected static $deliveryType = ['send' => '商家配送', 'express' => '快递配送'];

    protected function setAddTimeAttr()
    {
        return time();
    }

    protected function setCartIdAttr($value)
    {
        return is_array($value) ? json_encode($value) : $value;
    }

    protected function getCartIdAttr($value)
    {
        return json_decode($value, true);
    }


    public static function getOrderTotalPrice($cartInfo)
    {
        $totalPrice = 0;
        foreach ($cartInfo as $cart) {
            $totalPrice = bcadd($totalPrice, bcmul($cart['cart_num'], $cart['truePrice'], 2), 2);
        }
        return $totalPrice;
    }

    public static function getOrderCostPrice($cartInfo)
    {
        $costPrice = 0;
        foreach ($cartInfo as $cart) {
            $costPrice = bcadd($costPrice, bcmul($cart['cart_num'], $cart['costPrice'], 2), 2);
        }
        return $costPrice;
    }

    public static function getPinkOrderId($id)
    {
        return self::where('id', $id)->value('order_id');
    }


    public static function cacheOrderInfo($uid, $cartInfo, $priceGroup, $cacheTime = 600)
    {
        $subjectUrl=getUrlToDomain();
        $key = md5(time());
        Cache::store("redis")->set($subjectUrl.'user_order_' . $uid . $key, compact('cartInfo', 'priceGroup'), $cacheTime);
        return $key;
    }

    public static function getCacheOrderInfo($uid, $key)
    {
        $subjectUrl=getUrlToDomain();
        $cacheName = $subjectUrl.'user_order_' . $uid . $key;
        if (!Cache::store("redis")->has($cacheName)) return null;
        return Cache::store("redis")->get($cacheName);
    }

    public static function clearCacheOrderInfo($uid, $key)
    {
        $subjectUrl=getUrlToDomain();
        Cache::store("redis")->clear($subjectUrl.'user_order_' . $uid . $key);
    }

    public static function getSpecialIds($uid)
    {
        return self::where(['is_del' => 0, 'paid' => 1, 'uid' => $uid, 'is_gift' => 0])->column('cart_id');
    }

    /**
     * 获取专题订单列表
     * @param $type
     * @param $page
     * @param $limit
     * @param $uid
     * @return array
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function getSpecialOrderList($type, $page, $limit, $uid)
    {
        $model = self::where(['a.is_del' => 0, 's.is_del' => 0, 'a.uid' => $uid, 'a.paid' => 1])->order('a.add_time desc')->alias('a')->join('__SPECIAL__ s', 'a.cart_id=s.id');
        switch ($type) {
            case 1:
                $model= $model->where(['a.is_gift' => 1, 'a.combination_id' => 0, 'a.pink_id' => 0,'a.type'=>0]);
                break;
            case 2:
                $model=$model->where(['a.is_gift' => 0, 'a.combination_id' => 0, 'a.pink_id' => 0,'a.type'=>0]);
                break;
            case 3:
                $model= $model->where('a.is_gift', 0)->where('a.type', 0)->where('a.combination_id', 'NEQ', 0)->where('a.pink_id', 'NEQ', 0);
                break;
        }
        $list = $model->field(['a.*', 's.title', 's.image', 's.money', 's.pink_number'])->page($page, $limit)->select();
        $list = count($list) ? $list->toArray() : [];
        foreach ($list as &$item) {
            $item['image'] = get_oss_process($item['image'], 4);
            $item['pink'] = [];
            $item['stop_time'] = 0;
            $item['is_draw'] = false;
            if ($type === 1) {
                if ($uid = self::where(['gift_order_id' => $item['order_id']])->value('uid')) {
                    $item['is_draw'] = true;
                    $userAvatar=User::where('uid', $uid)->field(['nickname', 'avatar'])->find();
                    if($userAvatar){
                        $item['gift_user'] = $userAvatar->toArray();
                    }else{
                        $item['gift_user'] =['nickname'=>'','avatar'=>''];
                    }

                }
            }
        }
        $page++;
        return compact('list', 'page');
    }

    /**
     * 获取礼物领取记录
     * @param $order_id 订单号
     * @return array|bool
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function getOrderIdGiftReceive($order_id)
    {
        $is_gift = false;
        $user = [];
        $order = self::where(['is_del' => 0, 'order_id' => $order_id])->find();
        if (!$order) return self::setErrorInfo('订单不存在');
        if (!$order->cart_id) return self::setErrorInfo('订单专题不存在!');
        $add_time = date('m-d H:i', $order->add_time);
        $image = Special::PreWhere()->where(['id' => $order->cart_id])->value('image');
        $title = Special::PreWhere()->where(['id' => $order->cart_id])->value('title');
        $uid = self::where(['is_del' => 0, 'gift_order_id' => $order->order_id])->value('uid');
        if ($uid) {
            $is_gift = true;
            $user = User::where('uid', $uid)->field(['avatar', 'nickname'])->find();
        }
        return compact('user', 'is_gift', 'image', 'add_time', 'title');
    }

    /**
     * 获取订单的专题详情信息
     * @param $order_id 订单号
     * @return bool
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function getOrderIdToSpecial($order_id,$uid)
    {
        $order = self::where(['is_del' => 0, 'order_id' => $order_id,'uid'=>$uid])->find();
        if (!$order) return self::setErrorInfo('订单不存在或给订单不是您的!');
        if (!$order->cart_id) return self::setErrorInfo('订单专题不存在!');
        $special = Special::PreWhere()->where(['id' => $order->cart_id])->find();
        if (!$special) return self::setErrorInfo('赠送的专题已下架,或已被删除!');
        $special->abstract = self::HtmlToMbStr($special->abstract);
        return $special->toArray();
    }

    /**
     * 创建领取礼物订单
     * @param $orderId 订单号
     * @param $uid
     * @return bool
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function createReceiveGift($orderId, $uid)
    {
        $order = self::where(['is_del' => 0, 'order_id' => $orderId, 'paid' => 1])->find();
        if (!$order) return self::setErrorInfo('赠送的礼物订单不存在');
        if ($order->total_num == $order->gift_count) return self::setErrorInfo('礼物已被领取完');
        if (SpecialBuy::be(['special_id' => $order['cart_id'], 'uid' => $uid])) return self::setErrorInfo('您已拥有此专题无法,进行领取');
        $data = [
            'uid' => $uid,
            'order_id' => self::getNewOrderId(),
            'cart_id' => $order->cart_id,
            'total_num' => 1,
            'total_price' => $order->total_price,
            'gift_count' => 1,
            'pay_price' => 0,
            'paid' => 1,
            'pay_time' => time(),
            'is_receive_gift' => 1,
            'mark' => '礼物领取订单',
            'unique' => md5(time() . '' . $uid . $order->cart_id),
            'cost' => $order->total_price,
            'pay_type' => 'weixin',
            'gift_order_id' => $orderId,
        ];
        $order->gift_count += 1;
        if ($order->save() && ($order = self::set($data))) {
            SpecialBuy::setBuySpecial($order['order_id'], $order['uid'], $order['cart_id'], 2);
            StoreOrderStatus::status($order['id'], 'cache_key_create_order', '订单生成');

            return true;
        } else
            return self::setErrorInfo('领取礼物订单生成失败');
    }


    /**
     * 创建订单专题订单
     * @param $special
     * @param $pinkId
     * @param $pay_type
     * @param $uid
     * @param $payType
     * @param int $link_pay_uid
     * @param int $total_num
     * @return bool|object
     */
    public static function createSpecialOrder($special, $pinkId, $pay_type, $uid, $payType, $link_pay_uid = 0, $total_num = 1)
    {
        if (!array_key_exists($payType, self::$payType)) return self::setErrorInfo('选择支付方式有误!');
        $userInfo = User::getUserInfo($uid);
        if (!$userInfo) return self::setErrorInfo('用户不存在!');
        $total_price = 0;
        $combination_id = 0;
        switch ((int)$pay_type) {
            case 1:
                //送朋友
                $total_price = $special->money;
                if(isset($userInfo['level']) && $userInfo['level'] > 0 && $special->member_pay_type == 1 && $special->member_money > 0){
                    $total_price = $special->member_money;
                }
                break;
            case 2:
                //自己买
                $total_price = $special->money;
                if(isset($userInfo['level']) && $userInfo['level'] > 0 && $special->member_pay_type == 1 && $special->member_money > 0){
                    $total_price = $special->member_money;
                }
                $order=self::where(['uid'=>$uid,'cart_id'=>$special->id,'paid'=>1,'is_gift'=>0,'type'=>0,'status'=>0,'refund_status'=>0,'is_del'=>0])->find();
                if($order) return self::setErrorInfo('您已购买专题，无需再次购买!');
                break;
        }
        $orderInfo = [
            'uid' => $uid,
            'order_id' => self::getNewOrderId(),
            'cart_id' => $special->id,
            'total_num' => $total_num,
            'total_price' => $total_price,
            'pay_price' => $total_price,
            'pay_type' => $payType,
            'combination_id' => $combination_id,
            'is_gift' => $pay_type == 1 ? 1 : 0,
            'pink_time' => 0,
            'paid' => 0,
            'pink_id' => 0,
            'unique' => md5(time() . '' . $uid . $special->id),
            'cost' => $total_price,
            'link_pay_uid' => $userInfo['spread_uid'] ? 0 : $link_pay_uid,
            'spread_uid' => $userInfo['spread_uid'] ? $userInfo['spread_uid'] : 0,
            'is_del' => 0,
        ];
        $order = self::set($orderInfo);
        if (!$order) return self::setErrorInfo('订单生成失败!');
        StoreOrderStatus::status($order['id'], 'cache_key_create_order', '订单生成');
        return $order;
    }


    public static function getNewOrderId()
    {
        $count = (int)self::where('add_time', ['>=', strtotime(date("Y-m-d"))], ['<', strtotime(date("Y-m-d", strtotime('+1 day')))])->count();
        return 'wx' . date('YmdHis', time()) . (10000 + $count + 1);
    }

    public static function changeOrderId($orderId)
    {
        $ymd = substr($orderId, 2, 8);
        $key = substr($orderId, 16);
        return 'wx' . $ymd . date('His') . $key;
    }
    /**商品微信
     * @param $orderId
     * @param string $field
     * @return array|string
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function jsPay($orderId, $field = 'order_id')
    {
        if (is_string($orderId))
            $orderInfo = self::where($field, $orderId)->where('type',2)->find();
        else
            $orderInfo = $orderId;
        if (!$orderInfo || !isset($orderInfo['paid'])) exception('支付订单不存在!');
        if ($orderInfo['paid']) exception('支付已支付!');
        if ($orderInfo['pay_price'] <= 0) exception('该支付无需支付!');
        $openid = WechatUser::uidToOpenid($orderInfo['uid']);
        return WechatService::jsPay($openid, $orderInfo['order_id'], $orderInfo['pay_price'], 'goods', SystemConfigService::get('site_name'));
    }

    /**专题微信支付
     * @param $orderId
     * @param string $field
     * @return array|string
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function jsSpecialPay($orderId, $field = 'order_id')
    {
        if (is_string($orderId))
            $orderInfo = self::where($field, $orderId)->find();
        else
            $orderInfo = $orderId;
        if (!$orderInfo || !isset($orderInfo['paid'])) exception('支付订单不存在!');
        if ($orderInfo['paid']) exception('支付已支付!');
        if ($orderInfo['pay_price'] <= 0) exception('该支付无需支付!');
        $openid = WechatUser::uidToOpenid($orderInfo['uid']);
        return WechatService::jsPay($openid, $orderInfo['order_id'], $orderInfo['pay_price'], 'special', SystemConfigService::get('site_name'));
    }

    /**专题余额支付
     * @param $order_id
     * @param $uid
     * @return bool
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function yuePay($order_id, $uid)
    {
        $orderInfo = self::where('uid', $uid)->where('order_id', $order_id)->where('is_del', 0)->find();
        if (!$orderInfo) return self::setErrorInfo('订单不存在!');
        if ($orderInfo['paid']) return self::setErrorInfo('该订单已支付!');
        if ($orderInfo['pay_type'] != 'yue') return self::setErrorInfo('该订单不能使用余额支付!');
        $userInfo = User::getUserInfo($uid);
        if ($userInfo['now_money'] < $orderInfo['pay_price'])
            return self::setErrorInfo('余额不足' . floatval($orderInfo['pay_price']));
        self::beginTrans();
        $res1 = false !== User::bcDec($uid, 'now_money', $orderInfo['pay_price'], 'uid');
        $res2 = UserBill::expend('购买专题', $uid, 'now_money', 'pay_product', $orderInfo['pay_price'], $orderInfo['id'], $userInfo['now_money'], '余额支付' . floatval($orderInfo['pay_price']) . '元购买专题');
        $res3 = self::paySuccess($order_id);
        try {
            HookService::listen('yue_pay_product', $userInfo, $orderInfo, false, PaymentBehavior::class);
        } catch (\Exception $e) {
            self::rollbackTrans();
            return self::setErrorInfo($e->getMessage());
        }
        $res = $res1 && $res2 && $res3;
        self::checkTrans($res);
        return $res;
    }

    /**
     * 微信支付 为 0元时
     * @param $order_id
     * @param $uid
     * @return bool
     */
    public static function jsPayPrice($order_id, $uid)
    {
        $orderInfo = self::where('uid', $uid)->where('order_id', $order_id)->where('is_del', 0)->find();
        if (!$orderInfo) return self::setErrorInfo('订单不存在!');
        if ($orderInfo['paid']) return self::setErrorInfo('该订单已支付!');
        $userInfo = User::getUserInfo($uid);
        self::beginTrans();
        $res1 = UserBill::expend('购买专题', $uid, 'now_money', 'pay_special', $orderInfo['pay_price'], $orderInfo['id'], $userInfo['now_money'], '微信支付' . floatval($orderInfo['pay_price']) . '元购买专题');
        $res2 = self::paySuccess($order_id);
        $res = $res1 && $res2;
        self::checkTrans($res);
        return $res;
    }

    /**
     * 用户申请退款
     * @param $uni
     * @param $uid
     * @param string $refundReasonWap
     * @return bool
     */
    public static function orderApplyRefund($uni, $uid, $data)
    {
        $order = self::getUserOrderDetail($uid, $uni);
        if (!$order) return self::setErrorInfo('支付订单不存在!');
        if ($order['refund_status'] == 2) return self::setErrorInfo('订单已退款!');
        if ($order['refund_status'] == 1) return self::setErrorInfo('正在申请退款中!');
        if ($order['status'] == 1) return self::setErrorInfo('订单当前无法退款!');
        self::beginTrans();
        $res1 = false !== StoreOrderStatus::status($order['id'], 'apply_refund', '用户申请退款，原因：' . $data['refund_reason']);
        $res2 = false !== self::edit(['refund_status' => 1,'refund_application_time'=> time(),'refund_reason_wap' => $data['refund_reason'],'refund_reason_wap_img'=>json_encode($data['pics']),'mark'=>$data['remarks']], $order['id'], 'id');
        $res = $res1 && $res2;
        self::checkTrans($res);
        if (!$res)
            return self::setErrorInfo('申请退款失败!');
        else {
            return $res;
        }
    }

    /**
     * 自动退款
     * @param array $order
     * */
    public static function autoRefundY($order)
    {
        if (!$order['pink_id']) return true;
        $refund_data = [
            'pay_price' => $order['pay_price'],
            'refund_price' => $order['pay_price'],
        ];
        switch ($order['pay_type']) {
            case 'weixin':
                if ($order['is_channel']) {
                    try {
                        HookService::listen('routine_pay_order_refund', $order['order_id'], $refund_data, true, PaymentBehavior::class);
                    } catch (\Exception $e) {
                        return self::setErrorInfo($e->getMessage());
                    }
                } else {
                    try {
                        HookService::listen('wechat_pay_order_refund', $order['order_id'], $refund_data, true, PaymentBehavior::class);
                    } catch (\Exception $e) {
                        return self::setErrorInfo($e->getMessage());
                    }
                }
                break;
            case 'yue':
                ModelBasic::beginTrans();
                $res1 = User::bcInc($order['uid'], 'now_money', $refund_data['pay_price'], 'uid');
                $res2 = $res2 = UserBill::income('商品退款', $order['uid'], 'now_money', 'pay_product_refund', $refund_data['pay_price'], $order['id'], $order['pay_price'], '订单退款到余额' . floatval($refund_data['pay_price']) . '元');
                try {
                    HookService::listen('store_order_yue_refund', $order, $refund_data, false, StoreProductBehavior::class);
                } catch (\Exception $e) {
                    ModelBasic::rollbackTrans();
                    return self::setErrorInfo($e->getMessage());
                }
                $res = $res1 && $res2;
                ModelBasic::checkTrans($res);
                if (!$res) return self::setErrorInfo('余额退款失败!');
                break;
            case 'zhifubao':
                AlipayTradeWapService::init()->AliPayRefund($order['order_id'], $order['trade_no'], $order['pay_price'], '拼团失败退款', 'refund');
                break;
        }
        $data = [
            'refund_status' => 2,
            'refund_reason_time' => time(),
            'refund_price' => $order['pay_price'],
            'status' => -1,
        ];
        self::edit($data, $order['id'], 'id');
        HookService::afterListen('store_product_order_refund_y', $data, $order['id'], false, StoreProductBehavior::class);
        StoreOrderStatus::status($order['id'], 'refund_price', '自动发起退款,退款给用户' . $order['pay_price'] . '元');
        return true;
    }

    /**
     * //TODO 专题支付成功后
     * @param $orderId
     * @param $notify
     * @return bool
     */
    public static function paySuccess($orderId)
    {
        $order = self::where('order_id', $orderId)->where('type',0)->find();
        if(!$order) return false;
        $resPink = true;
        User::bcInc($order['uid'], 'pay_count', 1, 'uid');
        $res1 = self::where('order_id', $orderId)->where('type',0)->update(['paid' => 1, 'pay_time' => time()]);
        if ($order->combination_id && $res1 && !$order->refund_status) {
            return false;
        } else {
            if (!$order->is_gift) {
                //如果是专栏，记录专栏下所有专题购买。
                SpecialBuy::setAllBuySpecial($orderId, $order->uid, $order->cart_id);
                try {
                    //专题返佣
                    User::backOrderBrokerage($order);
                } catch (\Throwable $e) {
                }
            }
        }
        StoreOrderStatus::status($order->id, 'pay_success', '用户付款成功');
        $site_url = SystemConfigService::get('site_url');
        try{
            $wechat_notification_message = SystemConfigService::get('wechat_notification_message');
            if($wechat_notification_message==1){
                WechatTemplateService::sendTemplate(WechatUser::where('uid', $order['uid'])->value('openid'), WechatTemplateService::ORDER_PAY_SUCCESS, [
                    'first' => '亲，您购买的专题已支付成功',
                    'keyword1' => $orderId,
                    'keyword2' => $order['pay_price'],
                    'remark' => '点击查看订单详情'
                ], $site_url . Url::build('wap/special/grade_list'));
                WechatTemplateService::sendAdminNoticeTemplate([
                    'first' => "亲,您有一个新的课程订单",
                    'keyword1' => $orderId,
                    'keyword2' => $order['pay_price'],
                    'remark' => '请及时查看'
                ]);
            }else{
                $data['character_string1']['value'] =  $orderId;
                $data['amount3']['value'] =  $order['pay_price'];
                $data['time2']['value'] =  date('Y-m-d H:i:s',time());
                $data['thing6']['value'] =  '您购买的专题已支付成功！';
                RoutineTemplate::sendOrderSuccess($data,$order['uid'],$site_url . Url::build('wap/special/grade_list'));
                $dataAdmin['character_string1']['value'] =  $orderId;
                $dataAdmin['amount3']['value'] =  $order['pay_price'];
                $dataAdmin['time2']['value'] =  date('Y-m-d H:i:s',time());
                $dataAdmin['thing6']['value'] =  '您有一个新的课程订单！';
                RoutineTemplate::sendAdminNoticeTemplate($dataAdmin);
            }
        }catch (\Throwable $e){}
        $res = $res1 && $resPink;
        return false !== $res;
    }


    /**
     * 计算普通裂变推广人返佣金额
     * @param int $is_promoter 推广人级别
     * @param float $money 返佣金额
     * @return float
     * */
    public static function getBrokerageMoney($is_promoter, $money)
    {
        $is_promoter = !is_int($is_promoter) ? (int)$is_promoter : $is_promoter;
        $systemName = 'store_brokerage_three_[###]x';
        //配置星级字段和设置如： store_brokerage_three_0x store_brokerage_three_1x
        //后台设置字段从零星开始 $is_promoter 应 -1 才能对应字段
        $store_brokerage_three = $is_promoter ? SystemConfigService::get(str_replace('[###]', $is_promoter - 1, $systemName)) : 100;
        //返佣比例为0则不返佣
        $store_brokerage_three = $store_brokerage_three == 0 ? 0 : bcdiv($store_brokerage_three, 100, 2);
        return bcmul($money, $store_brokerage_three, 2);
    }

    /**获取订单详情
     * @param $uid
     * @param $key
     * @return array|false|\PDOStatement|string|\think\Model
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function getUserOrderDetail($uid, $key)
    {
        return self::where('order_id|unique', $key)->where('uid', $uid)->where('is_del', 0)->find();
    }

    public static function tidyOrder($order, $detail = false,$isPic=false)
    {
        if ($detail == true && isset($order['id'])) {
            $cartInfo = self::getDb('StoreOrderCartInfo')->where('oid', $order['id'])->column('cart_info', 'unique') ?: [];
            foreach ($cartInfo as $k => $cart) {
                $cartInfo[$k] = json_decode($cart, true);
                $cartInfo[$k]['unique'] = $k;
            }
            $order['cartInfo'] = $cartInfo;
        }

        $status = [];
        if (!$order['paid'] && $order['pay_type'] == 'offline' && !$order['status'] >= 2) {
            $status['_type'] = 9;
            $status['_title'] = '线下付款';
            $status['_msg'] = '等待商家处理,请耐心等待';
            $status['_class'] = 'nobuy';
        } else if (!$order['paid']) {
            $status['_type'] = 0;
            $status['_title'] = '未支付';
            $status['_msg'] = '立即支付订单吧';
            $status['_class'] = 'nobuy';
        } else if ($order['refund_status'] == 1) {
            $status['_type'] = -1;
            $status['_title'] = '申请退款中';
            $status['_msg'] = '商家审核中,请耐心等待';
            $status['_class'] = 'state-sqtk';
        } else if ($order['refund_status'] == 2) {
            $status['_type'] = -2;
            $status['_title'] = '已退款';
            $status['_msg'] = '已为您退款,感谢您的支持';
            $status['_class'] = 'state-sqtk';
        } else if (!$order['status']) {
            $status['_type'] = 1;
            $status['_title'] = '未发货';
            $status['_msg'] = '商家未发货,请耐心等待';
            $status['_class'] = 'state-nfh';
        } else if ($order['status'] == 1) {
            $status['_type'] = 2;
            $status['_title'] = '待收货';
            $status['_msg'] = date('m月d日H时i分', StoreOrderStatus::getTime($order['id'], 'delivery_goods')) . '服务商已发货';
            $status['_class'] = 'state-ysh';
        } else if ($order['status'] == 2) {
            $status['_type'] = 3;
            $status['_title'] = '交易完成';
            $status['_msg'] = '交易完成,感谢您的支持';
            $status['_class'] = 'state-ytk';
        }
       if($order['refund_reason_time']) $order['refund_reason_time']=date('Y-m-d H:i:s',$order['refund_reason_time']);
        if($order['refund_application_time']) $order['refund_application_time']=date('Y-m-d H:i:s',$order['refund_application_time']);
        if (isset($order['pay_type']))
            $status['_payType'] = isset(self::$payType[$order['pay_type']]) ? self::$payType[$order['pay_type']] : '其他方式';
        if (isset($order['delivery_type']))
            $status['_deliveryType'] = isset(self::$deliveryType[$order['delivery_type']]) ? self::$deliveryType[$order['delivery_type']] : '其他方式';
        $order['_status'] = $status;
        if ($isPic) {
            $order_details_images = GroupDataService::getData('order_details_images') ?: [];
            foreach ($order_details_images as $image) {
                if (isset($image['order_status']) && $image['order_status'] == $order['_status']['_type']) {
                    $order['status_pic'] = $image['pic'];
                    break;
                }
            }
        }
        return $order;
    }

    public static function statusByWhere($status, $model = null)
    {
        if ($model == null) $model = new self;
        if ('' === $status)
            return $model;
        else if ($status == 0)
            return $model->where('paid', 0)->where('status', 0)->where('refund_status', 0);
        else if ($status == 1)//待发货
            return $model->where('paid', 1)->where('order_id', 'NOT IN', implode(',', $orderId))->where('status', 0)->where('refund_status', 0);
        else if ($status == 2)
            return $model->where('paid', 1)->where('status', 1)->where('refund_status', 0);
        else if ($status == 3)
            return $model->where('paid', 1)->where('status', 2)->where('refund_status', 0);
        else if ($status == 4)
            return $model->where('paid', 1)->where('refund_status','>', 0);
        else if ($status == -1)
            return $model->where('paid', 1)->where('refund_status', 1);
        else if ($status == -2)
            return $model->where('paid', 1)->where('refund_status', 2);
        else
            return $model;
    }

    /**商品订单列表
     * @param $uid
     * @param string $status
     * @param int $first
     * @param int $limit
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function getUserOrderList($uid, $status = '', $first = 0, $limit = 8)
    {
        $list = self::statusByWhere($status)->where('type', 2)->where('is_del', 0)->where('uid', $uid)
            ->field('is_gift,combination_id,id,order_id,pay_price,total_num,total_price,pay_postage,total_postage,paid,status,refund_status,pay_type,coupon_price,deduction_price,pink_id,delivery_type,refund_reason_time,refund_application_time')
            ->order('add_time DESC')->limit($first, $limit)->select()->toArray();
        foreach ($list as $k => $order) {
            $list[$k] = self::tidyOrder($order, true);
        }
        return $list;
    }

    public static function searchUserOrder($uid, $order_id)
    {
        $order = self::where('uid', $uid)->where('order_id', $order_id)->where('is_del', 0)->field('is_gift,combination_id,id,order_id,pay_price,total_num,total_price,pay_postage,total_postage,paid,status,refund_status,pay_type,coupon_price,deduction_price,delivery_type')
            ->order('add_time DESC')->find();
        if (!$order)
            return false;
        else
            return self::tidyOrder($order->toArray(), true);

    }

    public static function orderOver($oid)
    {
        $res = self::edit(['status' => '3'], $oid, 'id');
        if (!$res) exception('评价后置操作失败!');
        StoreOrderStatus::status($oid, 'check_order_over', '用户评价');
    }

    /**
     * 用户订单数据
     */
    public static function getOrderStatusNum($uid)
    {
        $noBuy = self::where('uid', $uid)->where('paid', 0)->where('type', 2)->where('is_del', 0)->where('refund_status', 0)->count();//未支付订单数量
        $noDelivered = self::where('uid', $uid)->where('paid', 1)->where('type', 2)->where('is_del', 0)->where('status', 0)->where('refund_status', 0)->count();//待发货订单数量
        $noTake = self::where('uid', $uid)->where('paid', 1)->where('type', 2)->where('is_del', 0)->where('status', 1)->where('refund_status', 0)->count();//待收货订单数量
        $noReply = self::where('uid', $uid)->where('paid', 1)->where('type', 2)->where('is_del', 0)->where('status', 2)->where('refund_status', 0)->count();//已完成订单数量
        $sum=self::where('uid', $uid)->where('is_del', 0)->where('type', 2)->count();//订单总数
        $sumPrice=self::where('uid', $uid)->where('paid', 1)->where('type', 2)->where('refund_status', 0)->where('is_del', 0)->sum('pay_price');//订单总消费
        $refund = self::where('uid', $uid)->where('paid', 1)->where('type', 2)->where('is_del', 0)->where('refund_status','>',0)->count();//退款订单数量
        return compact('noBuy', 'noDelivered', 'noTake', 'noReply','sum','sumPrice','refund');
    }

    /**购买商品赠送虚拟币
     * @param $order
     * @return bool
     * @throws \Exception
     */
    public static function gainUserGoldNum($order)
    {
        $gold_name=SystemConfigService::get('gold_name');//虚拟币名称
        if ($order['gain_gold_num'] > 0) {
            $userInfo = User::getUserInfo($order['uid']);
            ModelBasic::beginTrans();
            $res1 = false != User::where('uid', $userInfo['uid'])->update(['gold_num' => bcadd($userInfo['gold_num'], $order['gain_gold_num'], 2)]);
            $res2 = false != UserBill::income('购买商品赠送'.$gold_name, $order['uid'], 'gold_num', 'gain', $order['gain_gold_num'], $order['id'], $userInfo['gold_num'], '购买商品赠送' . floatval($order['gain_gold_num']) . $gold_name);
            $res = $res1 && $res2;
            ModelBasic::checkTrans($res);
            return $res;
        }
        return true;
    }

    /**
     * 获取order_id
     * @param $pid
     * @return mixed
     */
    public static function getStoreIdPink($pid)
    {
        $uid = User::getActiveUid();
        return self::where('uid', $uid)->where('pink_id', $pid)->where('is_del', 0)->value('order_id');
    }
}
