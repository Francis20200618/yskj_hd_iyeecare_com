<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2021/8/26
 * Time: 14:00
 */

namespace app\frontend\modules\order\payment\types;


use app\common\models\OrderPay;
use app\common\payment\setting\alipay\AlipayJsapiSetting;
use app\common\payment\setting\other\AnotherSetting;
use app\common\payment\setting\other\CODSetting;
use app\common\payment\setting\other\ConfirmSetting;
use app\common\payment\setting\other\ParentSetting;
use app\common\payment\setting\other\RemittanceSetting;
use app\common\payment\setting\other\DcmScanSetting;
use app\common\payment\setting\wechat\WechatCpsAppSetting;
use app\common\payment\setting\wechat\WechatJsapiSetting;
use app\common\payment\types\BasePaymentTypes;

class OrderPaymentTypes extends BasePaymentTypes
{
	public $orderPay;
	public function __construct(OrderPay $orderPay)
	{
		parent::__construct();
		$this->orderPay = $orderPay;
		self::rebind();
	}

	public function rebind()
	{
		app()->bind(CODSetting::class,\app\frontend\modules\order\payment\setting\CODSetting::class);
		app()->bind(RemittanceSetting::class,\app\frontend\modules\order\payment\setting\RemittanceSetting::class);
		app()->bind(AnotherSetting::class,\app\frontend\modules\order\payment\setting\AnotherSetting::class);
		app()->bind(ParentSetting::class,\app\frontend\modules\order\payment\setting\ParentSetting::class);
		app()->bind(DcmScanSetting::class,\app\frontend\modules\order\payment\setting\DcmScanSetting::class);
		app()->bind(WechatCpsAppSetting::class,\app\frontend\modules\order\payment\setting\WechatCpsAppSetting::class);
        app()->bind(WechatJsapiSetting::class,\app\frontend\modules\order\payment\setting\WechatJsapiSetting::class);
        app()->bind(AlipayJsapiSetting::class,\app\frontend\modules\order\payment\setting\AlipayJsapiSetting::class);
        app()->bind(ConfirmSetting::class,\app\frontend\modules\order\payment\setting\ConfirmSetting::class);
	}

    /**
     * @return OrderPay
     */
	public function getOrderPay()
    {
        return $this->orderPay;
    }

    /**
     * @return \Illuminate\Database\Eloquent\Collection
     */
	public function getOrders()
	{
		return $this->orderPay->orders;
	}

    /**
     * @return mixed
     */
	public function getOrder()
	{
		return $this->orderPay->orders->first();
	}
}