<?php


namespace app\common\services\easyWechat\providers;

use app\common\services\easyWechat\Client;
use app\common\services\easyWechat\ContactWayClient;
use app\common\services\easyWechat\Material;
use Pimple\Container;
use Pimple\ServiceProviderInterface;

class ExternalClientProvider implements ServiceProviderInterface
{
    /**
     * {@inheritdoc}.
     */
    public function register(Container $app)
    {
        $app['external_contact'] = function ($app) {
            return new Client($app);
        };
        $app['contact_way'] = function ($app) {
            return new ContactWayClient($app);
        };
    }
}