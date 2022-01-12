<?php
// +----------------------------------------------------------------------
// | CRMEB [ CRMEB赋能开发者，助力企业发展 ]
// +----------------------------------------------------------------------
// | Copyright (c) 2016～2021 https://www.crmeb.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed CRMEB并不是自由软件，未经许可不能去掉CRMEB相关版权
// +----------------------------------------------------------------------
// | Author: CRMEB Team <admin@crmeb.com>
// +----------------------------------------------------------------------


namespace service;


class WechatSubscribe
{
    /**
     * 基础访问接口
     * @var string
     */
    const API_OAUTH_GET = 'https://api.weixin.qq.com/sns/userinfo';

    /**GET请求 获取用户信息
     * @param $access_token
     * @param $openId
     * @param string $lang
     * @return mixed
     */
    public static function baseParseGet($access_token,$openId, $lang = 'zh_CN')
    {
        $url=self::API_OAUTH_GET."?access_token=".$access_token."&openid=".$openId."&lang=".$lang;
        return json_decode(WxpayService::curlGet($url),true);
    }
}
