<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2021/9/9
 * Time: 17:39
 */

namespace app\backend\modules\goods\widget;

use app\backend\modules\goods\models\Sale;
use app\common\facades\Setting;
use app\common\models\Area;

class SaleWidget extends BaseGoodsWidget
{
    public $group = 'marketing';

    public $widget_key = 'sale';

    public $code = 'promotion';

    public function pluginFileName()
    {
        return 'goods';
    }


    public function getData()
    {
        $set = Setting::get('shop');
        $shop['credit'] = $set['credit']?$set['credit']:'余额';
        $shop['credit1'] = $set['credit1']?$set['credit1']:'积分';
        $saleModel = new Sale();

        $sale = Sale::getList($this->goods->id);

        if ($sale) {
            $saleModel->setRawAttributes($sale->toArray());
        }

        $saleModel->is_store = $this->goods->plugin_id == 32 ? 1 : 0;

        $data = [
            'sale' => $saleModel,
            'set' => $shop
        ];
        
        return $data;
    }


    public function pagePath()
    {
        return $this->getPath('resources/views/goods/assets/js/components/');
    }
}