<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2021/4/6
 * Time: 17:12
 */

namespace app\frontend\modules\cart\models;


use app\common\exceptions\AppException;
use app\common\models\BaseModel;
use app\common\models\GoodsOption;
use app\frontend\models\Goods;
use app\frontend\modules\cart\deduction\BaseCartDeduction;
use app\frontend\modules\cart\deduction\models\PreCartGoodsDeduction;
use app\frontend\modules\cart\discount\BaseCartDiscount;
use app\frontend\modules\cart\discount\BaseCartGiftDiscount;
use app\frontend\modules\cart\discount\EnoughReduceDiscount;
use app\frontend\modules\cart\discount\GiftDiscount;
use app\frontend\modules\cart\discount\GiftEnoughDiscount;
use app\frontend\modules\cart\discount\GiftPlusDiscount;
use app\frontend\modules\cart\manager\GoodsAdapter;
use app\frontend\modules\cart\manager\GoodsOptionAdapter;
use app\frontend\modules\cart\node\CartGiftGoodsDiscountPriceNode;
use app\frontend\modules\cart\node\CartGoodsPriceNodeBase;
use app\frontend\modules\order\PriceNode;
use Yunshop\Marketing\models\Marketing;
use Yunshop\Marketing\service\MarketingService;

/**
 * Class CartGoods
 * @package app\frontend\modules\cart\models
 * @property Goods goods
 * @property GoodsOption goodsOption
 * @property \app\common\models\MemberCart memberCart
 *
 */
class CartGiftGoods extends CartGoods
{


    /**
     * 加价购或赠品价格
     * @return int|mixed
     * @throws AppException
     */
    public function getGiftPrice()
    {
        return $this->getPriceAfter($this->getPriceNodes()->last()->getKey());
    }

    //节点法
    public function _getPriceNodes()
    {
        // 商品价格节点
        $nodes = collect([
            new CartGoodsPriceNodeBase($this, 1000)
        ]);

        //作为赠品折扣的金额
        $discountNodes = $this->getDiscounts()->map(function (BaseCartGiftDiscount $discount) {
            return new CartGiftGoodsDiscountPriceNode($this, $discount, 2000);
        });

        // 按照weight排序
        return $nodes->merge($discountNodes)
            ->sortBy(function (PriceNode $priceNode) {
                return $priceNode->getWeight();
            })->values();
    }

    /**
     * 优惠集合
     * @return \Illuminate\Support\Collection
     */
    public function getDiscounts()
    {
        if ($this->memberCart->marketingService->giftType() == Marketing::GIFT_TYPE_GOODS) {
            $default = collect([
                new GiftDiscount($this),
            ]);
        } elseif ($this->memberCart->marketingService->giftType() == Marketing::GIFT_TYPE_PLUS_GOODS) {
            $default = collect([
                new GiftPlusDiscount($this),
            ]);
        }
//        elseif ($this->memberCart->marketingService->giftType() == Marketing::GIFT_TYPE_DISCOUNT) {
//            $default = collect([
//                new GiftDiscountDiscount($this),
//            ]);
//        }
        else{
            throw new AppException('不支持的礼品类型');
        }
        $aggregate = $default->merge($this->setDiscounts());

        return $aggregate;
    }

    public function setDiscounts()
    {
       return collect([]);
    }

    /**
     * 抵扣集合
     * @return \Illuminate\Support\Collection
     */
    public function getDeductions()
    {
        $default = collect([]);

        $aggregate = $default->merge($this->setDeductions());

        return $aggregate;
    }

    public function setDeductions()
    {
        return collect([]);
    }

    /**
     * 附加费用
     * @return \Illuminate\Support\Collection
     */
    public function getExtraCharges()
    {
        $default = collect([]);

        $aggregate = $default->merge($this->setExtraCharges());

        return $aggregate;
    }

    public function setExtraCharges()
    {
        return collect([]);
    }


    /*
     * 加载购物车参数
     */
    public function initialAttributes($data)
    {
        $this->setRawAttributes($data);

        $this->beforeCreating();
    }

    public function beforeCreating()
    {

    }

    /**
     * @throws AppException
     */
    public function goodsValidate()
    {
        //未勾选不验证
        if (!$this->isChecked()) {
            return true;
        }

        if (!isset($this->goods)) {
            throw new AppException('(ID:' . $this->goods_id . ')未找到商品或已经删除');
        }

        //todo 验证商品是否启用规格
        $this->goods->verifyOption($this->goods_option_id);

        if (empty($this->goods->status)) {
            throw new AppException($this->goods->title.'(ID:' . $this->goods->id . ')商品已下架');
        }

        if ($this->isOption()) {
            $this->goodsOptionValidate();
        }
    }
    /**
     * 规格验证
     * @throws AppException
     */
    public function goodsOptionValidate()
    {
        if (!$this->goods->has_option) {
            throw new AppException($this->goods->title.'(ID:' . $this->goods_id . ')商品未启用规格');
        }
        if (!isset($this->goodsOption)) {
            throw new AppException($this->goods->title.'(ID:' . $this->goods_id . ')未找到规格或已经删除');
        }

        if ($this->goods_id != $this->goodsOption->goods_id) {
            throw new AppException('规格('.$this->option_id.')'.$this->goodsOption->title.'不属于商品('.$this->goods_id.')'.$this->goods->title);
        }
    }

    /**
     * 注入分组类
     * @param $shop
     */
    public function setShop($shop)
    {
        $this->shop = $shop;
    }



    public function setDisable($bool)
    {
        $this->disable = $bool;
    }

    /**
     * @return bool
     */
    public function getDisableAttribute()
    {
        return $this->disable;
    }

    /**
     * @return bool
     * @throws AppException
     */
    public function getCheckedAttribute()
    {
        return $this->isChecked();
    }

    /**
     * 选择了此购物车
     * @return bool
     * @throws AppException
     */
    public function isChecked()
    {
        if (!isset($this->isChecked)) {

            if ($this->noBeChecked()) {
                // 不能选中
                $this->isChecked = false;
            } else {
                // 用户选中
                $this->isChecked = $this->memberCart->checked ? true : false;
            }
        }

        return $this->isChecked;
    }


    /**
     * todo 这里暂时没用，因 isChecked 在 disable 设置之前调用
     * 不能选中
     * @return bool
     */
    protected function noBeChecked()
    {

       return false;
    }

    public function getUnit()
    {
        return '元';
    }

    public function getStyleType()
    {
        return 'shop';
    }


    /**
     * 商品金额
     * @return int
     */
//    public function getGoodsPrice()
//    {
//        return $this->getAdapter()->getPrice();
//    }

    /**
     * 商品支付金额
     * @return mixed
     */
//    public function getPrice()
//    {
//        return $this->price;
//    }
    /**
     * 设置商品支付金额
     * @return mixed
     */
//    public function setPrice($price)
//    {
//        return $this->price = $price;
//    }

    /**
     * 商品预估金额
     * @return mixed
     * @throws AppException
     */
//    public function getEstimatedPrice()
//    {
//
//        if (isset($this->estimated_price)) {
//            return $this->estimated_price;
//        }
//
////        //未选中不计算金额
//        if (!$this->isChecked()) {
//            return 0;
//        }
//
//        ///商品支付金额 - 等级优惠金额 - 单品满减 - 全场满减
//        if($this->memberCart->is_gift){
//            $this->estimated_price = 0;
//        }else{
//            $this->estimated_price = $this->getPriceAfter($this->getPriceNodes()->last()->getKey());
//        }
//        //优惠劵
//
//        return  $value = sprintf('%.2f', $this->estimated_price);
//    }


    /**
     * 商品的会员等级折扣金额
     * @return float
     * @throws AppException
     */
    public function getVipDiscountAmount()
    {
//        $amount = $this->getAdapter()->_getVipDiscountAmount();
//        $preCartGoodsDiscount = new PreCartGoodsDiscount([
//            'code' => 'memberLevel',
//            'amount' => $amount ?: 0,
//            'name' => '会员等级优惠',
//        ]);
//        $preCartGoodsDiscount->setCartGoods($this);
//
//        return $amount;
        return $this->getAdapter()->_getVipDiscountAmount() * $this->total;
    }


    /**
     * 关联优惠抵扣
     * @return mixed
     */
    public function getCartGoodsDiscounts()
    {
        if (!$this->getRelation('cartGoodsDiscounts')) {
            $this->setRelation('cartGoodsDiscounts', $this->newCollection());


        }
        return $this->cartGoodsDiscounts;
    }

    /**
     * 抵扣
     * @return mixed
     */
    public function getCartGoodsDeductions()
    {
        if (!$this->getRelation('cartGoodsDeductions')) {
            $this->setRelation('cartGoodsDeductions', $this->newCollection());


        }
        return $this->cartGoodsDeductions;
    }

    /**
     * 额外费用
     * @return mixed
     */
    public function getCartGoodsExtraCharges()
    {
        if (!$this->getRelation('cartGoodsExtraCharges')) {
            $this->setRelation('cartGoodsExtraCharges', $this->newCollection());


        }
        return $this->cartGoodsExtraCharges;
    }


    protected $isCoinExchange;

    /**
     * 是否满足全额抵扣判断
     * @return bool
     */
    protected function isCoinExchange()
    {

        //获取商城设置: 判断 积分、余额 是否有自定义名称
        $shopSet = \Setting::get('shop.shop');

        if (!isset($this->isCoinExchange)) {

            if (!$this->goods()->hasOneSale->has_all_point_deduct) {
                $this->isCoinExchange = false;
            } else {
                $this->isCoinExchange = true;
                // 全额抵扣记录

                $preModel = new PreCartGoodsDeduction([
                    'code' => 'pointAll',
                    'amount' => ($this->getGoodsPrice() * $this->total) ?: 0,
                    'name' => $shopSet['credit1'] ? $shopSet['credit1'] . '全额抵扣' : '积分全额抵扣',
                ]);
                $preModel->setCartGoods($this);

            }
        }
        return $this->isCoinExchange;
    }


    /**
     * @return array
     * @throws AppException
     */
    public function toArray()
    {
        $this->setRawAttributes($this->getExtraField());

        return parent::toArray();
    }

    //店铺商品活动优惠满减
    public function getDiscountActivity()
    {
        //todo 这样可能要做成动态的
        $data = [];

        $sale =  $this->goods()->hasOneSale;
        if ($sale->ed_num || $sale->ed_money) {

            $str = '';
            if ($sale->ed_money) {
                $str .= '满' . $sale->ed_money . '包邮';
            }
            if ($sale->ed_num) {

                if (!empty($str)) {
                    $str .= ',';
                }

                $str .= '满' . $sale->ed_num . '件包邮';
            }

            $data[] = [
                'name' => '包邮',
                'code'=> 'freeSend',
                'type'=> 'string',
                'desc'=> $str,
            ];
        }

        if ((bccomp($sale->ed_full, 0.00, 2) == 1) && (bccomp($sale->ed_reduction, 0.00, 2) == 1)) {
            $data[] = [
                'name'=> '满减',
                'code'=> 'goodsReduce',
                'type'=> 'string',
                'desc'=>  '满'.$sale->ed_full.'减'.$sale->ed_reduction,
            ];
        }

        if ($this->memberCart->marketingService->giftType() == Marketing::GIFT_TYPE_GOODS) {
            $data[] = [
                'name'=> '赠品',
                'code'=> 'gift',
                'type'=> 'string',
                'desc'=>  '赠品折扣'.$this->getGoodsPrice().'元',
            ];
        } elseif ($this->memberCart->marketingService->giftType() == Marketing::GIFT_TYPE_PLUS_GOODS) {
            $data[] = [
                'name'=> '加价购',
                'code'=> 'giftPlus',
                'type'=> 'string',
                'desc'=>  '加价购折扣'.($this->getGoodsPrice() - $this->getGiftPrice()).'元',
            ];
        }

        return $data;
    }

    /**
     * 设置价格计算者
     */
    public function _getAdapter()
    {
        if ($this->isOption()) {
            $adapter = new GoodsOptionAdapter($this);
        } else {
            $adapter = new GoodsAdapter($this);
        }
        return $adapter;
    }

    /**
     * 获取价格计算者
     */
    public function getAdapter()
    {
        if (!isset($this->goodsAdapter)) {
            $this->goodsAdapter = $this->_getAdapter();
        }
        return $this->goodsAdapter;
    }


    /**
     * 是否为规格商品
     * @return bool
     */
    public function isOption()
    {
        return !empty($this->goods_option_id);
    }

    /**
     * 商品模型
     * @return Goods
     */
    public function goods()
    {
        return $this->goods;
    }

    /**
     * 插件类判断
     * @param \app\common\models\Goods $goods
     * @return bool
     */
    public function verify()
    {
        return false;
    }

    public function getVipPrice()
    {
        if($this->isOption()){
           return $this->goodsOption->vip_price;
        }else{
            return $this->goods()->vip_price;
        }
    }
}