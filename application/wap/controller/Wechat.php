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

use app\admin\model\wechat\WechatReply;
use service\WechatService;
use think\Request;


/**
 * 微信服务器  验证控制器
 * Class Wechat
 * @package app\wap\controller
 */
class Wechat
{

    /**
     * 微信服务器  验证
     */
    public function serve()
    {
        ob_clean();
        WechatService::serve();
    }

    /**
     *   支付  异步回调
     */
    public function notify()
    {
        WechatService::handleNotify();
    }
}


