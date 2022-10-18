<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2021/4/12
 * Time: 15:45
 */

namespace app\frontend\modules\cart\manager;

use app\common\models\Member;
use app\common\services\Plugin;
use app\framework\Http\Request;
use app\common\exceptions\AppException;
use app\framework\Database\Eloquent\Collection;
use app\frontend\models\MemberCart;
use app\frontend\modules\cart\models\CartGoods;
use app\frontend\modules\cart\models\ShopCart;

class MemberCartCollection extends Collection
{

    /**
     * 将购物车集合按groupId分组
     * @return static
     */
    public function groupByGroupId()
    {
        $groups = $this->groupBy(function (MemberCart $memberCart) {
            return $memberCart->getGroupId();
        });

        return $groups;
    }

    /**
     * 根据自身创建plugin_id对应类型的订单,当member已经实例化时传入member避免重复查询
     * @param Member|null $member
     * @param Plugin|null $plugin
     * @param Request $request
     * @throws AppException
     * @throws \Exception
     */
    public function getGroup(Plugin $plugin = null, Member $member = null, $request = null)
    {
        $request = $request ?: request();
        if ($this->isEmpty()) {
            return false;
        }
        if (!isset($member)) {
            $member = $this->getMember();
        }

        $app = $plugin && $plugin->app()->bound('CartContainer') ? $plugin->app() : app();


        $cartGoods = $this->getCartGoods($this);

        /**
         * @var ShopCart  $shopCart
         */
        $shopCart = $app->make('CartContainer')->make('ShopCart');

        $shopCart->init($cartGoods,$member, $request);

        if (empty($this->first()->id)) {
            $cartGiftGoods = $this->getCartGiftGoods($this);
            $shopCart->setGiftCarts($cartGiftGoods);
        }else{
            $shopCart->setGiftCarts($shopCart->getCartGiftGoods());
        }
        $shopCart->giftCartValidate();

        return $shopCart;
    }

    /**
     * 获取购物车商品对象组
     * @param Collection $memberCarts
     * @throws \Exception
     */
    public static function getCartGoods(Collection $memberCarts)
    {
        if ($memberCarts->isEmpty()) {
            throw new AppException("购物车记录为空");
        }
        $result = $memberCarts->filter(function(MemberCart $memberCart){
            return !$memberCart->is_gift;
        })->map(function (MemberCart $memberCart) {

            /**
             * @var $memberCart MemberCart
             */
            $data = [
                'cart_id' => $memberCart->id,
                'goods_id' => (int)$memberCart->goods_id,
                'goods_option_id' => (int)$memberCart->option_id,
                'total' => (int)$memberCart->total,
            ];


            /**
             * @var $cartGoodsManager CartGoodsManager
             */
            $cartGoodsManager = app('CartContainer')->make('CartGoodsManager');
            /**
             * 根据商品获取不同的 CartGoods模型
             * @var $cartGoods CartGoods
             */
            $cartGoods = $cartGoodsManager->getCartGoods($memberCart->goods);
            $cartGoods->setRelation('goodsOption', $memberCart->goodsOption);
            $cartGoods->initialAttributes($data);
            $cartGoods->setRelation('memberCart', $memberCart);
//            $cartGoods->setRelation('goods', $memberCart->goods);
            return $cartGoods;
        });

        return new CartGoodsCollection($result->values());
    }
/**
     * 获取购物车商品对象组
     * @param Collection $memberCarts
     * @throws \Exception
     */
    public static function getCartGiftGoods(Collection $memberCarts)
    {
        if ($memberCarts->isEmpty()) {
            throw new AppException("购物车记录为空");
        }
        $result = $memberCarts->filter(function(MemberCart $memberCart){
            return $memberCart->is_gift;
        })->map(function (MemberCart $memberCart) {

            /**
             * @var $memberCart MemberCart
             */
            $data = [
                'cart_id' => $memberCart->id,
                'goods_id' => (int)$memberCart->goods_id,
                'goods_option_id' => (int)$memberCart->option_id,
                'total' => (int)$memberCart->total,
            ];


            /**
             * @var $cartGoodsManager CartGoodsManager
             */
            $cartGoodsManager = app('CartContainer')->make('CartGoodsManager');
            /**
             * 根据商品获取不同的 CartGoods模型
             * @var $cartGoods CartGoods
             */
            $cartGoods = $cartGoodsManager->getCartGiftGoods($memberCart->goods);
            $cartGoods->setRelation('goodsOption', $memberCart->goodsOption);
            $cartGoods->initialAttributes($data);
            $cartGoods->setRelation('memberCart', $memberCart);
            return $cartGoods;
        });
        return new CartGiftGoodsCollection($result->values());
    }

    /**
     * 所属用户对象
     * @return Member
     */
    public function getMember()
    {
        return $this->first()->member;
    }

    /**
     * @return mixed
     */
    public function getPlugin()
    {
        return $this->first()->getPluginApp();
    }
}