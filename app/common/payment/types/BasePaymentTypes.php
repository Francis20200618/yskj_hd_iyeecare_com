<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2021/8/26
 * Time: 13:59
 */

namespace app\common\payment\types;


use app\common\models\PayType;

abstract class BasePaymentTypes
{
	public $filterCode;

	public $availableCode;

	public $listPayType = [];

	public function __construct()
	{
		$this->listPayType = PayType::get();
	}

	public function canUse(string $code)
	{
		//需要过滤掉的支付方式
		if (in_array($code,$this->filterCode)) {
			return false;
		}
		//设置了可用的支付方式验证
		if (!empty($this->availableCode) && !in_array($code,$this->availableCode)) {
			return false;
		}
		return true;
	}

	public function setFilterCode(array $filter_code)
	{
		$this->filterCode = $filter_code;
	}
}