<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2021/8/26
 * Time: 15:47
 */

namespace app\common\payment\setting;


use app\common\models\PayType;
use app\common\payment\types\BasePaymentTypes;

abstract class BasePaymentSetting
{
	public $paymentTypes;
	public $payType;

	public function __construct(BasePaymentTypes $basePaymentTypes)
	{
		$this->paymentTypes = $basePaymentTypes;
	}

	public function setPayType(PayType $payType)
	{
		$this->payType = $payType;
	}

	abstract public function canUse();

	public function getCode()
	{
		return $this->payType->code;
	}

	 public function getName()
	 {
		 if (app('plugins')->isEnabled('pay-manage')) {
			 return \Yunshop\PayManage\models\PayType::currentPayAlias($this->payType->id);
		 }
		 return $this->payType->name;
	 }

	 public function getId()
	 {
		 if (!miniVersionCompare('1.1.132')) {
             if ($this->payType->code == 'wechatMinPay') {
				 return 1;
			 }
		 }
	 	return $this->payType->id;
	 }

	 public function getWeight()
	 {
	 	return 10;
	 }

	 public function needPassword()
	 {
	 	return false;
	 }


}