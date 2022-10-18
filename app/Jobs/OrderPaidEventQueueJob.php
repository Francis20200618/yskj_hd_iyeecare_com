<?php
/**
 * Created by PhpStorm.
 * User: shenyang
 * Date: 2017/9/18
 * Time: 下午3:46
 */

namespace app\Jobs;

use app\common\events\order\AfterOrderPaidEvent;
use app\common\exceptions\AppException;
use app\common\facades\Setting;
use app\common\models\OrderCreatedJob;
use app\common\models\OrderPaidJob;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Bus\Queueable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Support\Facades\DB;
use app\common\models\Order;

class OrderPaidEventQueueJob implements ShouldQueue
{
    use InteractsWithQueue, Queueable, SerializesModels;

    /**
     * @var Order
     */
    protected $orderId;

    /**
     * OrderPaidEventQueueJob constructor.
     * @param $orderId
     */
    public function __construct($orderId)
    {
        $queueCount = Order::queueCount();
        if ($queueCount) {
            $this->queue = 'order:' . ($orderId % Order::queueCount());
        }

        $this->orderId = $orderId;
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        \Log::info('订单'.$this->orderId.'paid任务开始执行');
        DB::transaction(function () {
            try {
                $orderId = $this->orderId;
                \YunShop::app()->uniacid = null;
                DB::connection()->enableQueryLog();
                $order = Order::withoutGlobalScopes()->find($orderId);
                if(is_null($order)){
                    \Log::debug('查询订单失败',DB::connection()->getQueryLog());
                }
                \Log::debug('查询订单',DB::connection()->getQueryLog());
                DB::connection()->flushQueryLog();
                DB::connection()->disableQueryLog();
                \YunShop::app()->uniacid = $order->uniacid;
                Setting::$uniqueAccountId = $order->uniacid;
                if (!$order->orderPaidJob) {
                    $order->setRelation('orderPaidJob', new OrderPaidJob(['order_id' => $order->id]));
                    $order->orderPaidJob->save();
                }
                if ($order->orderPaidJob->status == 'finished') {
                    \Log::error('订单付款事件触发失败',"{$orderId}orderCreatedJob记录已存在");
                    return;
                }
                $order->orderPaidJob->status = 'finished';
                $order->orderPaidJob->save();
                $event = new AfterOrderPaidEvent($order);
                app('events')->safeFire($event, $order->id);
            } catch (\Exception $exception) {
                \Log::error('订单付款事件触发失败', $exception->getMessage());
                throw $exception;
            }
            \Log::info('订单' . $this->orderId . 'paid任务执行完成');
        });
    }
}