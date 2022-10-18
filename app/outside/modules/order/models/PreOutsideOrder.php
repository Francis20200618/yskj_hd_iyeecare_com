<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2022/1/13
 * Time: 15:18
 */

namespace app\outside\modules\order\models;


use app\common\exceptions\ApiException;
use app\frontend\modules\order\models\PreOrder;
use app\common\modules\order\OrderCollection;
use app\frontend\modules\order\services\OrderService;
use app\outside\modes\OutsideOrder;

/**
 * Class PreOutsideOrder
 * @property OrderCollection orders
 * @package app\outside\modules\order\models
 */
class PreOutsideOrder extends OutsideOrder
{
    /**
     * @var OrderCollection
     */
    public $orders;

    public function setOrders(OrderCollection $orders)
    {
        $this->orders = $orders;

        $this->initAttributes();
    }

    protected function initAttributes()
    {
        $this->fill([
            'uniacid' => \YunShop::app()->uniacid,
            'total_price' => $this->orders->sum('price'),
            'outside_sn' => request()->input('outside_sn'),
            'order_ids' => $this->orders->pluck('id'),
            'trade_sn' => self::createSn(),
        ]);
    }

    /**
     * @throws ApiException
     */
    public function store()
    {
        $this->save();
        if ($this->id === null) {
            throw new ApiException('第三方订单请求记录保存失败');

        }
        $this->orders()->attach($this->order_ids);

    }
}