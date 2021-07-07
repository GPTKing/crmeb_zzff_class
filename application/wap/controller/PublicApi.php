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
use app\admin\model\system\SystemGroup;
use app\admin\model\system\SystemGroupData;
use app\wap\model\wap\ArticleCategory;
use service\AliMessageService;
use service\JsonService;
use service\sms\storage\Sms;
use service\SystemConfigService;
use think\Session;

class PublicApi
{
    public function get_cid_article($cid = 0, $first = 0, $limit = 8)
    {
        $list = ArticleCategory::cidByArticleList($cid, $first, $limit, 'id,title,image_input,visit,add_time,synopsis,url') ?: [];
        foreach ($list as &$article) {
            $article['add_time'] = date('Y-m-d H:i', $article['add_time']);
        }
        return JsonService::successful('ok', $list);
    }

    public function get_video_list($key = '', $first = 0, $limit = 8)
    {
        $gid = SystemGroup::where('config_name', $key)->value('id');
        if (!$gid) {
            $list = [];
        } else {
            $video = SystemGroupData::where('gid', $gid)->where('status', 1)->order('sort DESC,add_time DESC')->limit($first, $limit)->select();
            $list = SystemGroupData::tidyList($video);
        }
        return JsonService::successful('ok', $list);
    }

    public function wechat_media_id_by_image($mediaIds = '')
    {
        if (!$mediaIds) return JsonService::fail('参数错误');
        try {
            $mediaIds = explode(',', $mediaIds);
            $temporary = \service\WechatService::materialTemporaryService();
            $pathList = [];
            foreach ($mediaIds as $mediaId) {
                if (!$mediaId) continue;
                try {
                    $content = $temporary->getStream($mediaId);
                } catch (\Exception $e) {
                    continue;
                }
                $name = substr(md5($mediaId), 12, 20) . '.jpg';
                $res = \Api\AliyunOss::instance([
                    'AccessKey' => SystemConfigService::get('accessKeyId'),
                    'AccessKeySecret' => SystemConfigService::get('accessKeySecret'),
                    'OssEndpoint' => SystemConfigService::get('end_point'),
                    'OssBucket' => SystemConfigService::get('OssBucket'),
                    'uploadUrl' => SystemConfigService::get('uploadUrl'),
                ])->stream($content, $name);
                if ($res !== false) {
                    $pathList[] = $res['url'];
                }
            }
            return JsonService::successful($pathList);
        } catch (\Exception $e) {
            return JsonService::fail('上传失败', ['msg' => $e->getMessage(), 'line' => $e->getLine(), 'file' => $e->getFile()]);
        }
    }
}
