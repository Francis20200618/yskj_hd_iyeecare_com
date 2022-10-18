<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2022/1/5
 * Time: 15:35
 */

namespace app\outside\controllers;


use app\common\exceptions\ApiException;
use app\common\exceptions\AppException;
use app\common\services\utils\EncryptUtil;
use app\outside\modes\OutsideAppSetting;
use app\outside\services\NotifyService;
use app\outside\services\OutsideAppService;
use Illuminate\Support\Facades\DB;
use app\common\models\AccountWechats;
use app\common\components\BaseController;


class OutsideController extends BaseController
{

    /**
     * @var OutsideAppSetting
     */
    public $outsideApp;



    public $needVerifySign = true;

    /**
     * 前置action
     */

    public function preAction()
    {
        parent::preAction();

//        $this->setCurrentUniacid(6);
        $this->apiVerify();
    }

    protected function apiVerify()
    {

        $appID = trim(request()->input('app_id'));

        if (!is_numeric($appID)) {
            throw new ApiException('不符合标准的appID');
        }

        $appSet = OutsideAppSetting::where('app_id', $appID)->first();

        if (!$appSet) {
            throw new ApiException('应用不存在');
        }

        if (!$appSet->is_open) {
            throw new ApiException('应用已关闭');
        }

        $this->outsideApp = $appSet;

        //$this->setCurrentUniacid($appSet->uniacid);

        //开启签名验证，签名验证失败
        if(!$appSet->sign_required && !$this->appSignVerify()) {
            throw new ApiException('签名验证失败');
        }
    }

    protected function appSignVerify()
    {
        $requestData = request()->input();

        return (new NotifyService($requestData))->verifySign();

    }

    //设置公众号
    protected function setCurrentUniacid($uniacid)
    {
        \Setting::$uniqueAccountId = \YunShop::app()->uniacid = $uniacid;
        AccountWechats::setConfig(AccountWechats::getAccountByUniacid(\YunShop::app()->uniacid));
    }
}