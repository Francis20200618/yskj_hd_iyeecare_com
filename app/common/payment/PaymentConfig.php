<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2021/8/27
 * Time: 16:59
 */

namespace app\common\payment;


use app\common\payment\method\alipay\AlipayAppPayment;
use app\common\payment\method\alipay\AlipayFacePayment;
use app\common\payment\method\alipay\AlipayJsapiPayment;
use app\common\payment\method\alipay\AlipayPayment;
use app\common\payment\method\alipay\AlipayScanPayment;
use app\common\payment\method\converge\ConvergeAlipayPayment;
use app\common\payment\method\converge\ConvergeQuickPayment;
use app\common\payment\method\converge\ConvergeSeparateAlipayPayment;
use app\common\payment\method\converge\ConvergeSeparatePayment;
use app\common\payment\method\converge\ConvergeWechatPayment;
use app\common\payment\method\other\AnotherPayment;
use app\common\payment\method\other\BalancePayment;
use app\common\payment\method\other\CashPayment;
use app\common\payment\method\other\CODPayment;
use app\common\payment\method\other\ConfirmPayment;
use app\common\payment\method\other\DcmScanPayment;
use app\common\payment\method\other\DianBangScanPayment;
use app\common\payment\method\other\HkScanAlipayPayment;
use app\common\payment\method\other\HkScanPayment;
use app\common\payment\method\other\JueQiPayment;
use app\common\payment\method\other\LaKaLaAlipayPayment;
use app\common\payment\method\other\LaKaLaWechatPayment;
use app\common\payment\method\other\LeshuaAlipayPayment;
use app\common\payment\method\other\LeshuaPosPayment;
use app\common\payment\method\other\LeshuaWechatPayment;
use app\common\payment\method\other\MemberCardPayment;
use app\common\payment\method\other\ParentPayment;
use app\common\payment\method\other\PayPalPayment;
use app\common\payment\method\other\RemittancePayment;
use app\common\payment\method\other\SandpayAlipayPayment;
use app\common\payment\method\other\SandpayWechatPayment;
use app\common\payment\method\other\StoreBalancePayment;
use app\common\payment\method\other\StorePayment;
use app\common\payment\method\other\TouTiaoAlipayPayment;
use app\common\payment\method\other\TouTiaoWechatPayment;
use app\common\payment\method\other\XfAlipayPayment;
use app\common\payment\method\other\XfWechatPayment;
use app\common\payment\method\other\YopAlipayPayment;
use app\common\payment\method\other\YopWechatPayment;
use app\common\payment\method\wechat\WechatAppPayment;
use app\common\payment\method\wechat\WechatCpsAppPayment;
use app\common\payment\method\wechat\WechatFacePayment;
use app\common\payment\method\wechat\WechatH5Payment;
use app\common\payment\method\wechat\WechatJsapiPayment;
use app\common\payment\method\wechat\WechatMicroPayment;
use app\common\payment\method\wechat\WechatMinPayment;
use app\common\payment\method\wechat\WechatNativePayment;
use app\common\payment\method\wechat\WechatPayment;
use app\common\payment\method\wechat\WechatScanPayment;
use app\frontend\modules\order\payment\types\OrderPaymentTypes;


class PaymentConfig
{
	public static $orderPaymentTypes = [];

	public static function get()
	{
		return [
			AlipayAppPayment::class,
			AlipayFacePayment::class,
			AlipayJsapiPayment::class,
			AlipayPayment::class,
			AlipayScanPayment::class,
			ConvergeAlipayPayment::class,
			ConvergeQuickPayment::class,
			ConvergeSeparateAlipayPayment::class,
			ConvergeSeparatePayment::class,
			ConvergeWechatPayment::class,
			WechatAppPayment::class,
			WechatCpsAppPayment::class,
			WechatFacePayment::class,
			WechatH5Payment::class,
			WechatJsapiPayment::class,
			WechatMinPayment::class,
			WechatNativePayment::class,
			WechatPayment::class,
			WechatScanPayment::class,
            WechatMicroPayment::class,
			AnotherPayment::class,
			BalancePayment::class,
			CashPayment::class,
			CODPayment::class,
			ConfirmPayment::class,
			DcmScanPayment::class,
			DianBangScanPayment::class,
			HkScanAlipayPayment::class,
			HkScanPayment::class,
			JueQiPayment::class,
			MemberCardPayment::class,
			PayPalPayment::class,
			ParentPayment::class,
			RemittancePayment::class,
			StorePayment::class,
			TouTiaoAlipayPayment::class,
			TouTiaoWechatPayment::class,
			YopAlipayPayment::class,
			YopWechatPayment::class,
			StoreBalancePayment::class,
			XfAlipayPayment::class,
            XfWechatPayment::class,
            SandpayAlipayPayment::class,
            SandpayWechatPayment::class,
            LaKaLaWechatPayment::class,
            LaKaLaAlipayPayment::class,
            LeshuaAlipayPayment::class,
            LeshuaWechatPayment::class,
            LeshuaPosPayment::class,
		];
	}

	public static function getOrderPayment($order_plugin_id)
	{
		return static::$orderPaymentTypes[$order_plugin_id]?:OrderPaymentTypes::class;
	}

	public static function attachOrderPayment($order_plugin_id,$order_payment_types)
	{
		static::$orderPaymentTypes[$order_plugin_id] = $order_payment_types;
	}


}