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

namespace app\admin\controller\system;

use app\admin\controller\AuthController;
use app\admin\model\system\SystemAdmin;
use app\admin\model\system\SystemLog as LogModel;

/**
 * 管理员操作记录表控制器
 * Class SystemLog
 * @package app\admin\controller\system
 */
class SystemLog extends AuthController
{
    /**
     * 显示操作记录
     */
    public function index()
    {
        LogModel::deleteLog();
        $where = parent::getMore([
            ['pages', ''],
            ['admin_id', ''],
            ['data', ''],
        ], $this->request);
        $where['level'] = $this->adminInfo['level'];
        $this->assign('where', $where);
        $this->assign('admin', SystemAdmin::getOrdAdmin('id,real_name', $this->adminInfo['level']));
        $this->assign(LogModel::systemPage($where));
        return $this->fetch();
    }

}

