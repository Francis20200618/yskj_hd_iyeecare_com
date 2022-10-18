<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2021/9/14
 * Time: 17:45
 */

namespace app\backend\modules\goods\widget;
use app\backend\modules\goods\models\DivFrom;

//表单
class DivFromWidget extends BaseGoodsWidget
{
    public $group = 'tool';

    public $widget_key = 'div_from';

    public $code = 'forms';

    public function pluginFileName()
    {
        return 'goods';
    }

    public function getData()
    {
        $div_from = DivFrom::ofGoodsId($this->goods->id)->first();

        return $div_from?$div_from:["status"=>0];
    }


    public function pagePath()
    {
        return $this->getPath('resources/views/goods/assets/js/components/');
    }
}