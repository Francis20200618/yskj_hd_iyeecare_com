<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2021/8/26
 * Time: 14:01
 */

namespace app\common\payment\method;


use app\common\models\PayType;
use app\common\payment\setting\BasePaymentSetting;
use app\common\payment\types\BasePaymentTypes;

abstract class BasePayment
{
	public $BasePaymentTypes;
	public $BasePaymentSetting;

	public function canUse()
	{
		return $this->BasePaymentSetting->canUse() && $this->BasePaymentTypes->canUse($this->code);
	}

	public function setTypes(BasePaymentTypes $BasePaymentTypes)
	{
		$this->BasePaymentTypes = $BasePaymentTypes;
	}

	public function setPayType()
	{
		$pay_type = $this->BasePaymentTypes->listPayType->where('code',$this->code)->first()?:new PayType();
		$this->BasePaymentSetting->setPayType($pay_type);
	}

	protected function setSetting(BasePaymentSetting $BasePaymentSetting)
	{
		$this->BasePaymentSetting = $BasePaymentSetting;
	}

	public function __call($method , $parameters)
	{
		return $this->BasePaymentSetting->$method(...$parameters);
	}



}