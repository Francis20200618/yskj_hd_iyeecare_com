<?php
/**
 * Created by .
 * User: MQZ
 * Date: 2022/1/17
 * Time: 14:42
 */

namespace app\frontend\modules\order\controllers;


use app\common\models\order\Invoice;
use app\common\components\ApiController;
use app\common\facades\Setting;
use app\common\models\Order;
class OrderinvoiceController extends ApiController
{

    /**
     * 获取发票抬头
     * @return \Illuminate\Http\JsonResponse
     */
    public function getOrder()
    {
        $order_list = Order::select('id','finish_time','invoice')->with(['orderInvoice'])->where('id', \YunShop::request()->order_id)->first();
        /*
         * 
         * Array
        (
            [id] => 5
            [finish_time] => 2022-01-18 16:46:49
            [invoice] => 
            [status_name] => 待付款
            [pay_type_name] => 未支付
            [process] => Array
                (
                )

            [has_one_pay_type] => 
            [order_invoice] => Array
                (
                    [id] => 5
                    [uniacid] => 1
                    [order_id] => 5
                    [need_invoice] => 0
                    [invoice_type] => 
                    [rise_type] => 
                    [collect_name] => mtest18
                    [email] => 
                    [company_number] => m1818181818181
                    [invoice] => 
                    [updated_at] => 2022-01-18 15:23:09
                    [created_at] => 2022-01-18 15:23:09
                    [deleted_at] => 
                )

        )
         * 
         * 
         */
        $list = $order_list->toArray();
        //echo '<br>tiem:'.$list['finish_time'];
        //echo '<br>strtotime:'.strtotime($list['finish_time']);
        //echo '<br>y:'.date("Y",strtotime($list['finish_time'])) ;
        //print_r($list);
        if(empty($list['finish_time']) || strtotime($list['finish_time']) == 0 || date("Y",strtotime($list['finish_time'])) == "1970" ){
            return $this->successJson('成功', ['isinvoice'=>0,'msg'=>'请签收后，再申请订单发票！']);//还没签收！
        }else{
            $date=floor((time()-strtotime($list['finish_time']))/86400);
            //echo "相差天数：".$date."天<br/><br/>";
            if($date > 90){
                return $this->successJson('成功', ['isinvoice'=>0,'msg'=>'非常抱歉，订单签收时间超过90天，不能申请发票。目前商城订单仅支持签收90天内申请发票！']);
            }else{
                return $this->successJson('成功', ['isinvoice'=>1,'msg'=>'可以开发票！']);
            }
        }
    }

}