<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2021/4/6
 * Time: 18:11
 */

namespace app\frontend\modules\cart\services;


use app\frontend\modules\cart\manager\CartGroupCollection;
use app\frontend\modules\cart\manager\MemberCartCollection;
use app\frontend\modules\cart\models\CartGiftGoods;
use app\frontend\modules\cart\models\ShopCart;
use Illuminate\Database\Eloquent\Collection;
use app\common\models\Member;
use app\common\models\MemberCart;

/**
 * Class GroupManager
 * @package app\frontend\modules\cart\services
 */
class GroupManager extends Collection
{
    /**
     * @var MemberCartCollection
     */
    protected $memberCart;

    /**
     * @var Member
     */
    protected $member;


    /**
     * @var CartGroupCollection
     */
    protected $group;

    public function init($cartList, $member = null)
    {
        $this->setMemberCarts($cartList);

        $this->member = $member;
        //分组
        $this->cartGroup();
        //区分选择
        $this->group->firstCheckedCart();

    }

    /**
     * @return CartGroupCollection
     */
    public function getGroup(){
        return $this->group;
    }

    protected function setMemberCarts($cartList)
    {
        $result = new MemberCartCollection($cartList);

        $this->memberCart = $result;
    }


    public function cartList()
    {

        $data =  $this->attributesToArray();

        $data['list'] = $this->group->toArray();
        return $data;
    }


    public function attributesToArray()
    {
        return [
            'total_goods_price' => sprintf('%.2f', $this->group->sum(function (ShopCart $shop) {
                return $shop->getGoodsPrice();
            })),
            'total_amount' => sprintf('%.2f', $this->group->sum('price')),
            'discount_amount_items' => $this->getDiscountAmountItems(),
            'deduction_amount_items' => $this->getDeductionAmountItems(),
            'extra_charges_amount_items' => $this->getExtraChargesAmountItems(),
            'total_discount_amount' => sprintf('%.2f', $this->group->getSingleCartDiscount()),
            'total_deduction_amount' => sprintf('%.2f', $this->group->getSingleCartDeductions()),
            'total_extra_charges_amount' => sprintf('%.2f', $this->group->getSingleCartExtraCharges()),
            'sharin_is_open' => $this->sharinIsOpen(),
        ];
    }

    /**
     * [sharinIsOpen 分享购物车插件是否开启]
     * @return [type] [description]
     */
    protected function sharinIsOpen()
    {
        $sharin_is_open = 0;
        if (app('plugins')->isEnabled('cart-sharing') && \Setting::get('plugin.cart-sharing.is_open') == "1") {
            $sharin_is_open = 1;
        }

        return $sharin_is_open;
    }

    /**
     * 按商品类型进行购物车分组
     */
    public function cartGroup()
    {
        $groups = $this->memberCart->groupByGroupId()->values();

        $member = $this->member;

        $request = request();

        $this->group = new CartGroupCollection([]);
        $valid_gift_collection = collect([]);
        $groups->each(function (MemberCartCollection $memberCartCollection) use ($member, $request, $valid_gift_collection) {
            $shopCart = $memberCartCollection->getGroup($memberCartCollection->getPlugin(), $member, $request);
            if ($shopCart->carts->isNotEmpty()) {
                $this->group->push($shopCart);
            }
            $shopCart->giftCarts->each(function (CartGiftGoods $cartGiftGoods) use($valid_gift_collection){
                $valid_gift_collection->push($cartGiftGoods->memberCart);
            });
        });
        $this->tryClearUpInvalidGift($valid_gift_collection);
    }

    /**
     * 将不在购物车中的赠品清除
     * @param $valid_gift_collection
     * @return void
     * @throws \Exception
     */
    private function tryClearUpInvalidGift($valid_gift_collection)
    {
        if ($valid_gift_collection->isEmpty()) {
            return;
        }
        MemberCart::where('member_id', $valid_gift_collection->first()->member_id)->where('is_gift', 1)->whereNotIn('id',$valid_gift_collection->pluck('id')->toArray())->delete();
    }

    /**
     * @return mixed
     */
    private function getDiscountAmountItems()
    {
        // 按照code合并
        $itemsAggregate = [];
        foreach ($this->group->getCartDiscounts() as $orderDiscount) {
            if (isset($itemsAggregate[$orderDiscount['code']])) {
                $itemsAggregate[$orderDiscount['code']]['amount'] += $orderDiscount['amount'];
            } else {
                if ($orderDiscount['amount'] > 0) {
                    $itemsAggregate[$orderDiscount['code']] = [
                        'code' => $orderDiscount['code'],
                        'name' => $orderDiscount['name'],
                        'amount' => $orderDiscount['amount'],
                    ];
                }
            }
        }
        foreach ($itemsAggregate as &$item) {
            $item['amount'] = sprintf('%.2f', $item['amount']);
        }
        return array_values($itemsAggregate);
    }

    /**
     * @return mixed
     */
    private function getDeductionAmountItems()
    {
        // 按照code合并
        $itemsAggregate = [];
        foreach ($this->group->getCartDeductions() as $cartItem) {
            if (isset($itemsAggregate[$cartItem['code']])) {
                $itemsAggregate[$cartItem['code']]['amount'] += $cartItem['amount'];
            } else {
                if ($cartItem['amount'] > 0) {
                    $itemsAggregate[$cartItem['code']] = [
                        'code' => $cartItem['code'],
                        'name' => $cartItem['name'],
                        'amount' => $cartItem['amount'],
                    ];
                }
            }
        }
        foreach ($itemsAggregate as &$item) {
            $item['amount'] = sprintf('%.2f', $item['amount']);
        }
        return array_values($itemsAggregate);
    }

    /**
     * @return mixed
     */
    private function getExtraChargesAmountItems()
    {

        // 按照code合并
        $itemsAggregate = [];
        foreach ($this->group->getCartExtraCharges() as $cartItem) {
            if (isset($itemsAggregate[$cartItem['code']])) {
                $itemsAggregate[$cartItem['code']]['amount'] += $cartItem['amount'];
            } else {
                if ($cartItem['amount'] > 0) {
                    $itemsAggregate[$cartItem['code']] = [
                        'code' => $cartItem['code'],
                        'name' => $cartItem['name'],
                        'amount' => $cartItem['amount'],
                    ];
                }
            }
        }
        foreach ($itemsAggregate as &$item) {
            $item['amount'] = sprintf('%.2f', $item['amount']);
        }
        return array_values($itemsAggregate);
    }

}