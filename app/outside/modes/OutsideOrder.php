<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2022/1/13
 * Time: 15:29
 */

namespace app\outside\modes;


use app\common\models\BaseModel;
use app\common\models\Order;
use app\common\modules\order\OrderCollection;
use app\common\services\CreateRandomNumber;

/**
 * Class PreOutsideOrder
 * @property OrderCollection orders
 * @package app\outside\modules\order\models
 */
class OutsideOrder extends BaseModel
{
    protected $table = 'yz_outside_order_trade';

    static protected $needLog = true;


    protected $hidden = ['updated_at','deleted_at'];

    protected $guarded = [];

    public $attributes = [];

    protected $casts = ['order_ids' => 'json'];



    /**
     * 获取订单流水号
     * @return string
     */
    public static function createSn()
    {

        $paySN = CreateRandomNumber::sn('TN');
        while (1) {
            if (!self::where('trade_sn', $paySN)->first()) {
                break;
            }
            $paySN = CreateRandomNumber::sn('TN');
        }
        return $paySN;
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsToMany
     */
    public function orders()
    {
        return $this->belongsToMany(Order::class, (new OutsideOrderHasManyOrder)->getTable(), 'outside_order_id', 'order_id');
    }
}