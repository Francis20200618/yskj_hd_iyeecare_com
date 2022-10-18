<?php


namespace app\common\services\easyWechat\container;

use app\common\services\easyWechat\providers\ExternalClientProvider;
use EasyWeChat\Work\Application;

class WorkContainer extends Application
{
    public function getProviders()
    {
        $providers = parent::getProviders();

        $providers[] = ExternalClientProvider::class;

        return $providers;
    }
}