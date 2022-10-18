<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2021/8/26
 * Time: 16:52
 */

namespace app\common\payment;



use app\common\payment\types\BasePaymentTypes;

class PaymentDirector
{
	public $paymentTypes;

	public function setPaymentTypes(BasePaymentTypes $basePaymentTypes)
	{
		$this->paymentTypes = $basePaymentTypes;
		app()->singleton(BasePaymentTypes::class,function () {
			return $this->paymentTypes;
		});
		return $this;
	}

	public function getPaymentButton()
	{
		$paymentMethodList = collect(app()->tagged('paymentMethod'));
		$paymentMethodList = $paymentMethodList->filter(function ($method) {
			$method->setTypes($this->paymentTypes);
			$method->setPayType();
			return $method->getCode() && $method->canUse();
		});
		$buttonList = $paymentMethodList->map(function ($payment) {
			return  [
				'code' 	    	=> $payment->getCode(),
				'name'   		=> $payment->getName(),
				'value'         => $payment->getId(),
				'need_password' => $payment->needPassword(),
				'weight'    	=> $payment->getWeight(),
			];
		});
		return $buttonList->sortByDesc('weight')->values();


	}
}