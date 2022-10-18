<?php


namespace app\common\services\easyWechat\container;

use EasyWeChat\Payment\Application;
use app\common\services\easyWechat\providers\OrderProvider;

class PaymentContainer extends Application
{
    public function getProviders()
    {
        $providers = parent::getProviders();

        $providers[] = OrderProvider::class;

        return $providers;
    }
}