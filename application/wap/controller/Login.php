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


use app\wap\model\user\SmsCode;
use app\wap\model\user\PhoneUser;
use app\wap\model\user\User;
use app\wap\model\user\WechatUser;
use basic\WapBasic;
use service\SystemConfigService;
use service\UtilService;
use service\JsonService;
use think\Cookie;
use think\Request;
use think\Session;
use think\Url;

class Login extends WapBasic
{
    public function index($spread_uid = 0)
    {
        $isWechat = UtilService::isWechatBrowser();
        $appid = SystemConfigService::get('wechat_appid');
        $this->assign(['appid' => $appid, 'spread_uid' => $spread_uid,'isWechat' => $isWechat, 'Auth_site_name' => SystemConfigService::get('site_name')]);
        return $this->fetch();
    }

    /**微信登录操作
     * @param $spread_uid
     * @return void
     */
    public function weixin_check($spread_uid = 0, $code = '')
    {
        Cookie::set('is_bg', 1);
        $this->_logout();
        $openid = $this->oauth($spread_uid, $code);
        if ($openid) {
            Cookie::delete('_oen');
            return JsonService::successful('微信登录成功', $openid);
        } else {
            return JsonService::fail(WechatUser::getErrorInfo());
        }
    }

    /**
     * 短信登陆
     * @param Request $request
     */
    public function phone_check(Request $request)
    {
        list($phone, $code) = UtilService::postMore([
            ['phone', ''],
            ['code', ''],
        ], $request, true);
        if (!$phone || !$code) return JsonService::fail('请输入登录账号');
        if (!$code) return JsonService::fail('请输入验证码');
        $code = md5('is_phone_code' . $code);
        if (!SmsCode::CheckCode($phone, $code)) return JsonService::fail('验证码验证失败');
        SmsCode::setCodeInvalid($phone, $code);
        if (($info = PhoneUser::UserLogIn($phone, $request)) !== false)
            return JsonService::successful('登录成功', $info);
        else
            return JsonService::fail(PhoneUser::getErrorInfo('登录失败'));
    }


    public function check(Request $request)
    {
        list($account, $pwd, $ref) = UtilService::postMore(['account', 'pwd', 'ref'], $request, true);
        if (!$account || !$pwd) return JsonService::fail('请输入登录账号');
        if (!$pwd) return JsonService::fail('请输入登录密码');
        if (!User::be(['account' => $account])) return JsonService::fail('登陆账号不存在!');
        $userInfo = User::where('account', $account)->find();
        $errorInfo = Session::get('login_error_info', 'wap') ?: ['num' => 0];
        $now = time();
        if ($errorInfo['num'] > 5 && $errorInfo['time'] < ($now - 900))
            return JsonService::fail('错误次数过多,请稍候再试!');
        if ($userInfo['pwd'] != md5($pwd)) {
            Session::set('login_error_info', ['num' => $errorInfo['num'] + 1, 'time' => $now], 'wap');
            return JsonService::fail('账号或密码输入错误!');
        }
        if (!$userInfo['status']) return JsonService::fail('账号已被锁定,无法登陆!');
        $this->_logout();
        Session::set('loginUid', $userInfo['uid'], 'wap');
        $userInfo['last_time'] = time();
        $userInfo['last_ip'] = $request->ip();
        $userInfo->save();
        Session::delete('login_error_info', 'wap');
        Cookie::set('is_login', 1);
        exit($this->redirect(empty($ref) ? Url::build('Index/index') : $ref));
    }

    public function logout()
    {
        $this->_logout();
        $this->successful('退出登陆成功', Url::build('Index/index'));
    }

    private function _logout()
    {
        Session::clear('wap');
        Cookie::delete('is_bg');
        Cookie::delete('is_login');
        Cookie::delete('__login_phone');
    }

}
