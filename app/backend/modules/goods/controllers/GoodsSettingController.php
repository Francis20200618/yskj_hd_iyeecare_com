<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2021/12/28
 * Time: 11:43
 */

namespace app\backend\modules\goods\controllers;

use app\common\components\BaseController;
use app\backend\modules\goods\models\GoodsSetting;

class GoodsSettingController extends BaseController
{
    public function index()
    {
        $data = request()->data;
        $config_data = GoodsSetting::getSet();
        if ($data) {
            if ($config_data) {
                GoodsSetting::find($config_data['id'])->delete();
            }

            GoodsSetting::saveSet($data);
            return $this->successJson('设置保存成功');
        }
        return view('goods.setting.index', [
            'set' => json_encode($config_data)
        ])->render();

    }
}