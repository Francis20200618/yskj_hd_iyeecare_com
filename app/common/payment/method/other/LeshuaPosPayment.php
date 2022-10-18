<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2022/4/2
 * Time: 18:47
 */

namespace app\common\payment\method\other;

use app\common\payment\method\BasePayment;
use app\common\payment\setting\other\LeshuaPosSetting;

class LeshuaPosPayment extends BasePayment
{
    public $code = 'leshuaPos';

    public function __construct(LeshuaPosSetting $paymentSetting)
    {
        $this->setSetting($paymentSetting);
    }
}