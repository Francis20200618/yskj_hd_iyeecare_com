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

use app\common\payment\setting\wechat\WechatCpsAppSetting as BaseWechatCpsAppSetting;

class WechatCpsAppSetting extends BaseWechatCpsAppSetting
{
	public function canUse()
	{
		return request()->wechat_app_pay_type == 'cps' && \Setting::get('plugin.aggregation-cps.pay_info')['weixin_pay'];
	}
}