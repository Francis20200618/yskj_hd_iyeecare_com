<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2022/3/1
 * Time: 14:51
 */

namespace app\frontend\modules\deduction;

use app\frontend\models\MemberCoin;
use app\common\exceptions\AppException;
use app\common\modules\orderGoods\models\PreOrderGoods;
use app\framework\Database\Eloquent\Collection;
use app\frontend\models\order\PreOrderDeduction;
use app\frontend\models\order\PreOrderDiscount;
use app\frontend\modules\deduction\models\Deduction;
use app\frontend\modules\order\models\PreOrder;

class EnableDeductionService
{

    protected $deductions;

    protected static $instance = null;

    private function __construct(){}

    /**
     * 单例缓存
     * @return null|self
     */
    public static function getInstance()
    {
        if (!isset(self::$instance)) {
            self::$instance =  new self();

        }
        return self::$instance;
    }

    /**
     * 开启的抵扣项
     * @return Collection
     */
    public function getEnableDeductions(PreOrder $preOrder)
    {
        if (!isset($this->deductions)) {

            //blank not deduction
            if ($preOrder->isDeductionDisable()) {
                trace_log()->deduction('订单关闭的抵扣类型','');
                return collect();
            }

            /**
             * 商城开启的抵扣
             * @var Collection $deductions
             */
            $deductions = Deduction::getEnable();

            trace_log()->deduction('开启的抵扣类型', $deductions->pluck('code')->toJson());
            if ($deductions->isEmpty()) {
                return collect();
            }
            // 过滤调无效的
            $deductions = $deductions->filter(function (Deduction $deduction) use ($preOrder) {

                /**
                 * @var MemberCoin $memberCoin
                 */
                $memberCoin = $deduction->memberCoin($preOrder->belongsToMember);

                /**
                 * @var Deduction $deduction
                 */
                return $deduction->valid() && $memberCoin && $memberCoin->useLimit();
            });
            // 按照用户勾选顺序排序
            $sort = array_flip($preOrder->getParams('deduction_ids'));
            $this->deductions = $deductions->sortBy(function ($deduction) use ($sort) {
                return array_get($sort, $deduction->code, 999);
            });
        }

        return $this->deductions;
    }
}