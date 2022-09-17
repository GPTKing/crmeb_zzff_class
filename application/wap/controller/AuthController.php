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


namespace app\wap\controller;

use app\admin\model\wechat\WechatQrcode;
use app\wap\model\store\StoreOrder;
use app\wap\model\user\User;
use app\wap\model\user\WechatUser;
use basic\WapBasic;
use service\JsonService;
use service\SystemConfigService;
use service\UtilService;
use think\Cache;
use think\cache\driver\Redis;
use think\Cookie;
use think\Session;
use think\Url;
use service\GroupDataService;

class AuthController extends WapBasic
{
    /**
     * 用户ID
     * @var int
     */
    protected $uid = 0;
    /**
     * 用户信息
     * @var
     */
    protected $userInfo;

    protected $phone;

    protected $force_binding;

    protected $isWechat = false;

    protected $redisModel;

    protected $subjectUrl = '';

    protected function _initialize()
    {
        parent::_initialize();
        try {
            $this->redisModel = new Redis();
        } catch (\Exception $e) {
            parent::serRedisPwd($e->getMessage());
        }
        $this->isWechat = UtilService::isWechatBrowser();
        $spread_uid = $this->request->get('spread_uid', 0);
        $NoWechantVisitWhite = $this->NoWechantVisitWhite();
        $subscribe = false;
        $this->subjectUrl = getUrlToDomain();
        try {
            $uid = User::getActiveUid();
            if (!empty($uid)) {
                $this->userInfo = User::getUserInfo($uid);
                if ($spread_uid) $spreadUserInfo = User::getUserInfo($spread_uid);
                $this->uid = $this->userInfo['uid'];
                $this->phone = User::getLogPhone($uid);
                //绑定临时推广人
                if ($spread_uid && $spreadUserInfo && $this->uid != $spread_uid && $spreadUserInfo['spread_uid'] != $this->uid && $this->userInfo['spread_uid'] != $spread_uid && !$this->userInfo['spread_uid']) {
                    $storeBrokerageStatu = SystemConfigService::get('store_brokerage_statu') ?: 1;//获取后台分销类型
                    if ($storeBrokerageStatu == 1) {
                        if ($spreadUserInfo['is_promoter']) User::edit(['spread_uid' => $spread_uid], $this->uid, 'uid');
                    } else {
                        User::edit(['spread_uid' => $spread_uid], $this->uid, 'uid');
                    }
                }
                if (!isset($this->userInfo['uid'])) $this->userInfo['uid'] = 0;
                if (!isset($this->userInfo['is_promoter'])) $this->userInfo['is_promoter'] = 0;
                if (!isset($this->userInfo['avatar'])) $this->userInfo['avatar'] = '';
                if (!isset($this->userInfo['nickname'])) $this->userInfo['nickname'] = '';
                //是否关注公众号
                $subscribe = WechatUser::where('uid', $this->uid)->value('subscribe');
                if (!$NoWechantVisitWhite) {
                    if (!$this->userInfo || !isset($this->userInfo['uid'])) return $this->failed('读取用户信息失败!');
                    if (!$this->userInfo['status']) return $this->failed('已被禁止登陆!');
                }
            }
        } catch (\Exception $e) {
            Cookie::delete('is_login');
            Cookie::delete('__login_phone');
            Session::delete(['loginUid', 'loginOpenid']);
            if (!$NoWechantVisitWhite) {
                if ($this->request->isAjax()) {
                    return JsonService::fail('请登录再进行访问');
                } else {
                    return $this->redirect(Url::build('wap/index/index'));
                }
            }
        }
        if (Cache::has('__SYSTEM__')) {
            $overallShareWechat = Cache::get('__SYSTEM__');
        } else {
            $overallShareWechat = SystemConfigService::more(['wechat_share_img', 'wechat_share_title', 'wechat_share_synopsis']);
            Cache::set('__SYSTEM__', $overallShareWechat, 800);
        }

        $codeUrl = SystemConfigService::get('wechat_qrcode');
        $balance_switch = SystemConfigService::get('balance_switch');//余额开关
        $alipay_switch = SystemConfigService::get('alipay_switch');//支付宝开关
        $this->force_binding = SystemConfigService::get('force_binding');//微信端是否强制绑定手机号
        $this->assign([
            'code_url' => $codeUrl,
            'is_yue' => $balance_switch,
            'is_alipay' => $alipay_switch,
            'subscribe' => $subscribe,
            'subscribeQrcode' => SystemConfigService::get('wechat_qrcode'),
            'userInfo' => $this->userInfo,
            'now_money' => $this->userInfo['now_money'] ? $this->userInfo['now_money'] : 0,
            'phone' => $this->phone,
            'isWechat' => $this->isWechat,
            'overallShareWechat' => json_encode($overallShareWechat),
            'Auth_site_name' => SystemConfigService::get('site_name'),
            'menus' => GroupDataService::getData('bottom_navigation')
        ]);
    }

    /**
     * 检查白名单控制器方法 存在带名单返回 true 不存在则进行登录
     * @return bool
     */
    protected function NoWechantVisitWhite()
    {
        if ($this->isWechat) return false;
        list($module, $controller, $action, $className) = $this->getCurrentController();
        if (method_exists($className, 'WhiteList')) {
            $whitelist = $className::WhiteList();
            if (!is_array($whitelist)) return false;
            foreach ($whitelist as $item) {
                if (strtolower($module . '\\' . $controller . '\\' . $item) == strtolower($module . '\\' . $controller . '\\' . $action)) {
                    return true;
                }
            }
        }
        return false;
    }

    /**
     * 获取当前的控制器名,模块名,方法名,类名并返回
     * @return array
     */
    protected function getCurrentController()
    {
        $module = $this->request->module();
        $controller = $this->request->controller();
        $action = $this->request->action();
        if (strstr($controller, '.'))
            $controllerv1 = str_replace('.', '\\', $controller);
        else
            $controllerv1 = $controller;
        $className = 'app\\' . $module . '\\controller\\' . $controllerv1;
        return [$module, $controller, $action, $className];
    }

}
