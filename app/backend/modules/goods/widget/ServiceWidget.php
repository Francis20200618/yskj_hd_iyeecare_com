<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2021/9/16
 * Time: 14:53
 */

namespace app\backend\modules\goods\widget;

use app\common\models\goods\GoodsService;

class ServiceWidget extends BaseGoodsWidget
{
    public $group = 'tool';

    public $widget_key = 'service';

    public $code = 'service';

    public function pluginFileName()
    {
        return 'goods';
    }

    public function getData()
    {

        $data['is_automatic'] = 0;
        $data['starttime'] = time();
        $data['endtime'] = strtotime('1 month');

        if (is_null($this->goods)) {
            return $data;
        }

        $service = GoodsService::select()->ofGoodsId($this->goods->id)->first();

        $data['is_automatic'] = $service->is_automatic;
        if ($service->on_shelf_time && $service->lower_shelf_time) {
            $data['starttime'] = $service->on_shelf_time;
            $data['endtime'] = $service->lower_shelf_time;
        }

        return $data;
    }


    public function pagePath()
    {
        return $this->getPath('resources/views/goods/assets/js/components/');
    }
}