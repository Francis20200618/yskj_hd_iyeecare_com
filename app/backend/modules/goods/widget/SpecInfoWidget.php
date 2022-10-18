<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2021/12/10
 * Time: 14:09
 */

namespace app\backend\modules\goods\widget;


use app\backend\modules\goods\models\GoodsOption;
use app\common\models\goods\GoodsSpecInfo;

class SpecInfoWidget extends BaseGoodsWidget
{
    public $group = 'base';

    public $widget_key = 'spec_info';

    public $code = 'spec_info';

    public function pluginFileName()
    {
        return 'spec_info';
    }

    /**
     * 权限判断
     * @return boolean
     */
    public function usable()
    {
        if (in_array($this->goods->plugin_id,[0,92])) {
            return true;
        }
        return false;
    }

    public function getData()
    {
        $specs_info = [];
        $options = [];
        if (!is_null($this->goods)) {
            if ($this->goods->has_option) {
                $options = GoodsOption::uniacid()
                    ->select('id','title')
                    ->where('goods_id',$this->goods->id)
                    ->get()->toArray();
            }
            $specs_info = GoodsSpecInfo::uniacid()
                ->where('goods_id',$this->goods->id)
                ->get()->toArray();
        }

        return [
            'options'=> $options,
            'specs_info'=> $specs_info,
        ];
    }


    public function pagePath()
    {
        return $this->getPath('resources/views/goods/assets/js/components/');
    }
}