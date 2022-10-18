<?php


namespace app\common\services\easyWechat\providers;

use app\common\services\easyWechat\Client;
use app\common\services\easyWechat\ContactWayClient;
use Pimple\Container;
use Pimple\ServiceProviderInterface;
use app\common\services\easyWechat\Order;

class OrderProvider implements ServiceProviderInterface
{
    /**
     * {@inheritdoc}.
     */
    public function register(Container $app)
    {
        $app['order'] = function ($app) {
            return new Order($app);
        };
    }
}