<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2022/2/15
 * Time: 16:44
 */

namespace app\backend\modules\finance\controllers;

use app\backend\modules\balance\services\BalanceRechargeService;
use app\backend\modules\upload\services\FileService;
use app\common\components\BaseController;
use app\common\models\finance\BalanceRechargeCheck;

class BalanceRechargeCheckController extends BaseController
{
    public function index()
    {
        return view('finance.balance.check-list',['is_can_check' => can('balanceRechargeCheckUpdate') ? 1 : 0]);
    }

    public function getList()
    {
        $search = request()->search;
        $pageSize = 20;
        $list = BalanceRechargeCheck::uniacid()->search($search)
            ->with([
                'member' => function ($member) {
                    $member->select('uid','nickname','avatar','nickname','realname','mobile');
                },
                'adminUser' => function ($adminUser) {
                    $adminUser->select('uid','username');
                },
            ])
            ->orderBy('id','desc')
            ->paginate($pageSize);
        return $this->successJson('ok',$list);
    }

    public function check()
    {
        try {
            $service = new BalanceRechargeService();
            $service->verifyChargeLog(request()->id,request()->status);
            return $this->successJson('审核成功');
        } catch (\Exception $e) {
            return $this->errorJson($e->getMessage());
        }
    }

    public function uploadFile()
    {
        try {
            $service = new FileService();
            $service->setUploadPath('balance_enclosure/'.\YunShop::app()->uniacid);
            $file = $service->upload();
            return $this->successJson('上传附件成功',[
                'file' => $file,
                'file_src' => yz_tomedia($file)
            ]);
        } catch (\Exception $e) {
            return $this->errorJson($e->getMessage());
        }
    }
}