<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2022/1/5
 * Time: 15:10
 */

namespace app\outside\controllers;


use app\common\components\BaseController;
use app\common\exceptions\AppException;
use app\common\models\AccountWechats;
use app\outside\services\ClientService;
use Illuminate\Support\Facades\DB;

class IndexController extends OutsideController
{
    public function index()
    {

        dd('测试');

        $client = new ClientService();
        $client->setRoute('index.index');
        $client->setData('sign_type', 'SHA256');
        $client->setData('uid', 2455);
        $client->setData('order_sn', 'RW3346346346');
        $client->setData('desc', '测试接口');
        $result = $client->post();
        dd($result);

        dd('测试');
    }

}