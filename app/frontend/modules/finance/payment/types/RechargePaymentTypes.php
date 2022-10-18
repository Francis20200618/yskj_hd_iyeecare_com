<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2021/8/26
 * Time: 14:00
 */

namespace app\frontend\modules\finance\payment\types;


use app\common\models\OrderPay;
use app\common\payment\setting\other\CODSetting;
use app\common\payment\types\BasePaymentTypes;
use app\frontend\modules\finance\services\BalanceRechargeSetService;

class RechargePaymentTypes extends BasePaymentTypes
{
	public $filterCode = ['balance','MemberCard'];

    public function canUse(string $code)
    {
        $service = new BalanceRechargeSetService();
        if ($service->getAppointPay() && !in_array($code,$service->getCanUsePayment())) {
            return false;
        }
        return parent::canUse($code);
    }
}