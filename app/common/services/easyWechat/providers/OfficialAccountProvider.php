<?php


namespace app\common\services\easyWechat\providers;

use app\common\services\easyWechat\Client;
use app\common\services\easyWechat\ContactWayClient;
use app\common\services\easyWechat\Material;
use Pimple\Container;
use Pimple\ServiceProviderInterface;

class OfficialAccountProvider implements ServiceProviderInterface
{
    /**
     * {@inheritdoc}.
     */
    public function register(Container $app)
    {
        $app['material'] = function ($app) {
            return new Material($app);
        };
    }
}