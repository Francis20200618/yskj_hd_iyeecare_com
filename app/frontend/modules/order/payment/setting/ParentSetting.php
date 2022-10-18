<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2021/9/3
 * Time: 18:49
 */

namespace app\frontend\modules\order\payment\setting;

use app\common\payment\setting\other\ParentSetting as BaseParentSetting;
use Yunshop\ParentPayment\common\services\PaymentService;

class ParentSetting extends BaseParentSetting
{
	public function canUse()
	{
		return  app('plugins')->isEnabled('parent-payment')
			&& \Setting::get('plugin.parent_payment.plugin_state')
			&& (!request()->input('pid') || request()->input('pid') == \YunShop::app()->getMemberId())
			&& (new PaymentService())->canUse(\YunShop::app()->getMemberId(), $this->paymentTypes->getOrder()->id)
			&& $this->paymentTypes->getOrders()->contains(function ($order) {
				return $order->plugin_id == 0;
			})
			&& $this->paymentTypes->getOrders()->count() == 1;
	}
}