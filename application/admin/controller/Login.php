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

namespace app\admin\controller;


use app\admin\model\system\SystemAdmin;
use app\admin\model\system\SystemConfig;
use basic\SystemBasic;
use service\CacheService;
use service\UtilService;
use think\Request;
use think\Response;
use think\Session;
use think\Url;

/**
 * 登录验证控制器
 * Class Login
 * @package app\admin\controller
 */
class Login extends SystemBasic
{
    public function index()
    {
        $this->assign('login_logo',SystemConfig::getValue('login_logo'));
        return $this->fetch();
    }

    /**
     * 登录验证 + 验证码验证
     */
    public function verify(Request $request)
    {
        if (!$request->isPost()) return ['code'=>4];
        list($account, $pwd, $verify) = UtilService::postMore([
            'account', 'pwd', 'verify'
        ], $request, true);
        //检验验证码
        if (!captcha_check($verify)) return ['code'=>2];
        $error = Session::get('login_error') ?: ['num' => 0, 'time' => time()];
        if ($error['num'] >= 5 && $error['time'] < strtotime('+ 5 minutes')){
            return ['code'=>3];
        }
        //检验帐号密码
        $res = SystemAdmin::login($account, $pwd);
        if ($res) {
            Session::set('login_error', null);
            return ['code'=>1];
        } else {
            $error['num'] += 1;
            $error['time'] = time();
            Session::set('login_error', $error);
            return ['code'=>0];
        }
    }

    public function captcha()
    {
        ob_clean();
        $captcha = new \think\captcha\Captcha([
            'codeSet' => '0123456789',
            'length' => 4,
            'fontSize' => 30
        ]);
        return $captcha->entry();
    }

    /**
     * 退出登陆
     */
    public function logout()
    {
        SystemAdmin::clearLoginInfo();
        $this->redirect('Login/index');
    }
}
