<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2021/12/20
 * Time: 11:39
 */

namespace app\common\services\plugin\store;

use Yunshop\Integral\Common\Models\IntegralGoodsModel;
use Yunshop\Love\Common\Models\GoodsLove;
use Yunshop\Love\Common\Services\SetService;
use Yunshop\StoreIntegralFees\models\StoreIntegralFeesGoods;

class GoodsDeductionShowService
{
    private $goods_ids;

    protected $integral_sign;
    protected $integral_set;
    protected $integral_deduction_set;

    protected $love_sign;
    protected $love_activation_set;
    protected $love_set;

    protected $store_integral_fees_sign;
    protected $store_integral_fees_goods_set;
    protected $store_integral_fees_set;

    public function __construct($goodsIds = array())
    {
        $this->goods_ids = $goodsIds;

        //消费积分
        $this->integral_sign = false;
        if (app('plugins')->isEnabled('integral')) {
            //获取消费积分抵扣统一设置
            $integralGoods = IntegralGoodsModel::select(['id', 'goods_id', 'deduction_set', 'deduction_set_min', 'deduction_set_max'])->whereIn('goods_id', $goodsIds)->get()->toArray();

            $this->integral_sign = true;
            $this->integral_deduction_set = array_column($integralGoods, null, 'goods_id');
            $this->integral_set = [
                'deduction_set' => \Setting::get('integral.deduction_set'),
                'deduction_set_min' => \Setting::get('integral.deduction_set_min'),
                'deduction_set_max' => \Setting::get('integral.deduction_set_max')
            ];
        }

        //爱心值
        $this->love_sign = false;
        if (app('plugins')->isEnabled('love')) {
            $loveGoods = GoodsLove::select(['id', 'goods_id', 'activation_state', 'love_accelerate'])->whereIn('goods_id', $goodsIds)->get()->toArray();

            $this->love_sign = true;
            $this->love_activation_set = array_column($loveGoods, null, 'goods_id');
            $this->love_set = [
                'activation_state' => SetService::getAcceleratedActivationStatus(),//开关
                'love_accelerate' => SetService::getAcceleratedActivationOfLoveRatio(),//激活比例
            ];
        }

        //手续费
        $this->store_integral_fees_sign = false;
        if (app('plugins')->isEnabled('store-integral-fees')) {
            $store_integral_fees_set = \Setting::get('plugin.store_integral_fees');
            $storeIntegralFees = StoreIntegralFeesGoods::select(['id', 'goods_id', 'is_open', 'fees_rate'])->whereIn('goods_id', $goodsIds)->get()->toArray();

            $this->store_integral_fees_sign = true;
            $this->store_integral_fees_goods_set = array_column($storeIntegralFees, null, 'goods_id');
            $this->store_integral_fees_set = [
                'is_open' => $store_integral_fees_set['is_plugin_open'],//开关
                'store_integral_fees' => $store_integral_fees_set['store_integral_fees'],
            ];
        }
    }

    /**
     * 商品内容显示：消费积分 爱心值 手续费等前端显示
     * @param int $showType 1-首页-装修（不受基础设置控制），2-门店商品内容显示（受门店基础设置控制）
     * @param int $returnType 返回类型，1-key,name,value形式（前端需要的格式），2-商品详情活动需要格式
     * @return array
     */
    public function getDeductionShow($showType = 1, $returnType = 1): array
    {
        $res = $frontendData = [];
        $show_type = [
            'integral' => true,
            'love' => true,
            'store_integral_fees' => true
        ];

        //门店商品内容显示
        if ($showType != 1) {
            $store_set = \Setting::get('plugin.store');
            $show_plugins = [
                'integral' => $store_set['goods_show_integral'],
                'love' => $store_set['goods_show_love'],
                'store_integral_fees' => $store_set['goods_show_store_integral_fees']
            ];

            foreach ($show_plugins as $key => $value) {
                //未开启
                if ($value != 1) {
                    $show_type[$key] = false;//不显示
                }
            }
        }

        foreach ($this->goods_ids as $key => $item) {
            //消费积分抵扣显示
            if ($this->integral_sign && $show_type['integral']) {
                $integral_name = \Yunshop\Integral\Common\CommonService::getPluginName();
                $res[$item]['integral'] = $this->getIntegralData($item);
                if ($res[$item]['integral']['max_deduction'] > 0) {
                    $frontendData[$item][] = $this->getFrontendData('integral', $integral_name.'抵扣', $res[$item]['integral']['max_deduction']);
                }
            }

            //爱心值激活比例显示
            if ($this->love_sign && $show_type['love']) {
                $love_name = \Setting::get('love.name') ?: '爱心值';
                $res[$item]['love'] = $this->getLoveData($item);
                if ($res[$item]['love']['love_accelerate'] > 0) {
                    $frontendData[$item][] = $this->getFrontendData('love', $love_name.'激活', $res[$item]['love']['love_accelerate']);
                }
            }

            //消费积分手续费显示
            if ($this->store_integral_fees_sign && $show_type['store_integral_fees']) {
                $res[$item]['store_integral_fees'] = $this->getStoreIntegralFeesData($item);
                if ($res[$item]['store_integral_fees']['fees_rate'] > 0) {
                    $frontendData[$item][] = $this->getFrontendData('store-integral-fees', '手续费', $res[$item]['store_integral_fees']['fees_rate']);
                }
            }
        }

        if ($returnType == 1) {
            return $frontendData;
        } elseif ($returnType == 2) {
            return $res;
        } else {
            return [];
        }
    }

    //消费积分
    protected function getIntegralData($goodsId): array
    {
        $deduction_set_min = $deduction_set_max = 0;

        //独立商品 -- 开启
        if ($this->integral_set['deduction_set'] && $this->integral_deduction_set[$goodsId]['deduction_set']) {
            $deduction_set_min = $this->integral_deduction_set[$goodsId]['deduction_set_min'] ?: 0;//商品-最低
            $deduction_set_max = $this->integral_deduction_set[$goodsId]['deduction_set_max'] ?: 0;//商品-最高

            if (empty($deduction_set_min)) {
                $deduction_set_min = $this->integral_set['deduction_set_min'] ?: 0;//统一最低
            }
            if (empty($deduction_set_max)) {
                $deduction_set_max = $this->integral_set['deduction_set_max'] ?: 0;//统一最高
            }
        }

        $max_deduction = $deduction_set_max;
        if ($deduction_set_min > $deduction_set_max) {
            $max_deduction = $deduction_set_min;
        }

        return [
            'max_deduction' => (float)$max_deduction,//最高的抵扣
            'deduction_set_min' => (float)$deduction_set_min,
            'deduction_set_max' => (float)$deduction_set_max
        ];
    }

    //爱心值
    protected function getLoveData($goodsId): array
    {
        $love_accelerate = 0;

        //独立商品 -- 开启
        if ($this->love_set['activation_state'] && $this->love_activation_set[$goodsId]['activation_state']) {
            $love_accelerate = $this->love_activation_set[$goodsId]['love_accelerate'] ?: 0;//商品-激活爱心值比例

            if (empty($love_accelerate)) {
                $love_accelerate = $this->love_set['love_accelerate'] ?: 0;//统一激活爱心值比例
            }
        }

        return [
            'love_accelerate' => (float)$love_accelerate
        ];
    }

    //消费积分手续费
    protected function getStoreIntegralFeesData($goodsId): array
    {
        $fees_rate = 0;

        //独立商品 -- 开启
        if ($this->store_integral_fees_set['is_plugin_open'] && $this->store_integral_fees_goods_set[$goodsId]['is_open']) {
            $fees_rate = $this->store_integral_fees_goods_set[$goodsId]['fees_rate'] ?: 0;//商品-抵扣收取手续费比例

            if (empty($fees_rate)) {
                $fees_rate = $this->store_integral_fees_set['fees_rate'] ?: 0;//统一抵扣手续费比例
            }
        }

        return [
            'fees_rate' => (float)$fees_rate
        ];
    }

    private function getFrontendData($key, $name, $value)
    {
        return [
            'key' => $key,
            'name' => $name,
            'value' => $value
        ];
    }
}