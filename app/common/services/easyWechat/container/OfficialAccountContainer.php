<?php


namespace app\common\services\easyWechat\container;

use app\common\services\easyWechat\providers\ExternalClientProvider;
use app\common\services\easyWechat\providers\OfficialAccountProvider;
use EasyWeChat\OfficialAccount\Application;

class OfficialAccountContainer extends Application
{
    public function getProviders()
    {
        $providers = parent::getProviders();

        $providers[] = OfficialAccountProvider::class;

        return $providers;
    }
}