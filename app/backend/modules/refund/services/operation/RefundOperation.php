<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2021/12/22
 * Time: 13:58
 */

namespace app\backend\modules\refund\services\operation;

use app\common\events\Event;
use app\common\models\OrderGoods;
use app\common\models\refund\RefundGoodsLog;
use app\framework\Http\Request;
use app\frontend\modules\refund\services\RefundBackWayService;
use Illuminate\Support\Facades\DB;
use app\common\exceptions\AppException;
use app\common\models\refund\RefundApply;

abstract class RefundOperation  extends RefundApply
{

    protected $transaction = false;

    protected $statusBeforeChange = [];
    //改变后状态
    protected $statusAfterChanged;
    protected $name = ''; //操作名称
    protected $timeField = ''; //操作时间

    public $params;

    protected $backWay;

    /**
     * 表更新后
     */
    abstract protected function updateAfter();


    /**
     * 操作日志记录
     */
    abstract protected function writeLog();

    /**
     * 表更新前
     */
    abstract protected function updateBefore();

    /**
     * 发送通知
     */
    protected function sendMessage() {}

    /**
     * 退款操作事件
     * @return Event|array|null
     */
    protected function afterEventClass()
    {
        return null;
    }

    /**
     * 必须要在触发完退款操作事件，才能去操作订单。
     * 因为订单状态改变会触发订单事件
     */
    protected function triggerEventAfter()
    {

    }

    /**
     * 更新申请表
     * @return bool
     */
    protected function updateTable() {
        if (isset($this->statusAfterChanged)) {
            $this->status = $this->statusAfterChanged;
        }
        if(!empty($this->timeField)){
            $timeFields = $this->timeField;
            $this->$timeFields = time();
        }
        return $this->save();
    }

    /**
     * 操作验证
     * @throws AppException
     */
    protected function operationValidate()
    {
        if (!empty($this->statusBeforeChange) && !in_array($this->status, $this->statusBeforeChange)) {
            throw new AppException($this->status_name . '的退款申请,无法执行' . $this->name . '操作');
        }
    }

    protected function backWay()
    {
        if (!isset($this->backWay)) {
            $this->backWay = RefundBackWayService::getBackWayClass($this->refund_way_type);
            $this->backWay->setRefundApply($this);
        }
        return $this->backWay;
    }

    protected function setBackWay()
    {
        $this->backWay()->saveRelation();
    }

    /***
     * 执行操作操作
     * @return bool
     * @throws AppException
     */
    final public function execute()
    {
        $this->operationValidate(); //验证

        $this->updateBefore(); //更新表之前

        $result = $this->updateTable();//更新表
        if (!$result) {
            throw new AppException('信息更新失败');
        }

        $this->updateAfter();//更新表之后

        $this->writeLog(); //写入售后协商记录表

        $this->triggerRefundEvent(); //售后事件触发

        $this->triggerEventAfter();//事件触发后

        $this->sendMessage(); //发送通知

        return $result;
    }

    /**
     * 发布监听
     */
    final protected function triggerRefundEvent()
    {
        $eventClass =  $this->afterEventClass();

        if (is_array($eventClass)) {
            foreach ($eventClass as $itemEvent) {
                if (!is_null($itemEvent) && ($itemEvent instanceof Event)) {
                    event($itemEvent);
                }
            }

        } else {
            if (!is_null($eventClass) && ($eventClass instanceof Event)) {
                event($eventClass);
            }
        }

    }

    final public function setParams($request)
    {
        $this->params = $request;
    }

    final public function getParam($key)
    {
        return array_get($this->params, $key, '');
    }

    final public function getParams()
    {
        return $this->params;
    }

    final public function getRequest()
    {
//        if (!isset($this->request)) {
//            $this->request = request();
//        }
        return request();
    }

    /**
     * 更新订单商品表状态
     */
    protected function updateOrderGoodsRefundStatus()
    {
        $order_goods_ids = $this->refundOrderGoods->pluck('order_goods_id')->all();
        $refundGoodsLogCollection = RefundGoodsLog::where('order_id', $this->order->id)
            ->whereIn('order_goods_id', $order_goods_ids)
            ->get()
            ->groupBy('order_goods_id');
        //订单中某个商品数量退费完，才标记此商品已退费完成
        $refundGoodsLogCollection->each(function ($collection, $order_goods_id){
            $orderGoods = OrderGoods::find($order_goods_id);
            if($orderGoods->total == RefundGoodsLog::filterExchangeType($collection)->sum('refund_total')){
                $orderGoods->is_refund = 1;
                $orderGoods->save();
            }
        });
//        if ($order_goods_ids) {
//            OrderGoods::whereIn('id', $order_goods_ids)->update(['is_refund' => 1]);
//        }
    }

    protected function delRefundOrderGoodsLog()
    {
        //取消申请删除记录
        RefundGoodsLog::where('refund_id', $this->id)->delete();
    }

    protected function cancelRefund()
    {
        return $this->order->cancelRefund();
    }

    protected function closeOrder()
    {
        return $this->order->close();
    }

    /**
     * @param $eventClass
     * @param mixed ...$parameter
     */
    protected function afterEvent($eventClass, ...$parameter)
    {
        event(new $eventClass(...$parameter));
    }

}