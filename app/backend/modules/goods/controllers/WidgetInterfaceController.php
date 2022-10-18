<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2021/9/6
 * Time: 9:24
 */

namespace app\backend\modules\goods\controllers;


use app\common\components\BaseController;

class WidgetInterfaceController extends BaseController
{
    //goods.widget-interface.index
    public function index()
    {

        $data = app('GoodsWidgetContainer')->make('Manager')->handle();
        return $this->successJson('w', $data);
    }

    /**
     * @return mixed
     */
    public function getWidgetColumn()
    {
        $data = app('GoodsWidgetContainer')->make('Manager')->handle();
        return $data;
    }
}