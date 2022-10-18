<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2022/1/6
 * Time: 17:08
 */

namespace app\backend\modules\setting\controllers;


use app\common\components\BaseController;
use app\outside\modes\OutsideAppSetting;
use app\outside\services\OutsideAppService;

class OutsideAppController extends BaseController
{
    public function index()
    {

        $data['set'] = OutsideAppSetting::current()?OutsideAppSetting::current()->toArray():[];

        return view('setting.outside.application', [
            'data' => json_encode($data),
        ]);
    }

    public function createApp()
    {
        $app = OutsideAppSetting::current()?: new OutsideAppSetting();

        $app_id = OutsideAppSetting::uniqueApp();
        $app_secret = OutsideAppSetting::uniqueSecret($app_id);

        $createData = [
            'uniacid' => \YunShop::app()->uniacid,
            'is_open' => 1,
            'app_id'  => $app_id,
            'app_secret' => $app_secret,
        ];

        $app->fill($createData);

        $bool = $app->save();

        if ($bool) {
            return $this->successJson('成功');
        }

        return $this->errorJson('失败');

    }

    public function updateSecret()
    {
        $app = OutsideAppSetting::current();

        if (!$app) {
            return $this->errorJson('APP应用不存在');
        }

        $bool = $app->fill(['app_secret' => OutsideAppSetting::uniqueSecret($app->app_id)])->save();

        if ($bool) {

            return $this->successJson('密钥更新成功');
        }

        return $this->errorJson('密钥生成失败');
    }

    public function store()
    {
        $data =  request()->input('data');


        $app = OutsideAppSetting::current();

        if (!$app) {
            return $this->errorJson('APP应用不存在');
        }

        $bool = $app->fill($data)->save();

        if ($bool) {

            return $this->successJson('成功');
        }

        return $this->errorJson('操作不存在');
    }
}