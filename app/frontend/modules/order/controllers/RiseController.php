<?php
/**
 * Created by PhpStorm.
 * User: yunzhong
 * Date: 2019/1/18
 * Time: 10:47
 */

namespace app\frontend\modules\order\controllers;


use app\common\models\order\Invoice;
use app\common\components\ApiController;
use app\common\facades\Setting;
use app\common\models\Order;
use Illuminate\Support\Facades\DB;//ShiJian20220505发票模块
class RiseController extends ApiController
{
    /**
     * 获取发票详情
     * @return \Illuminate\Http\JsonResponse
     */
    public function getInvoice()
    {

        $db_remark_model = Order::select('id','invoice')->with(['orderInvoice'])->where('id', \YunShop::request()->order_id)->first();

        if ($db_remark_model->orderInvoice->invoice) {
            //$invoice = yz_tomedia($db_remark_model->orderInvoice->invoice);
            $invoice = $db_remark_model->orderInvoice->invoice;
        } else {
            //$invoice = yz_tomedia($db_remark_model->invoice);
            $invoice = $db_remark_model->invoice;
        }

        //发票状态、订单编号、发票类型、发票下载地址、发票抬头
        $state = $db_remark_model->orderInvoice->state;
        $order_id = $db_remark_model->orderInvoice->order_id;
        $invoice_type = $db_remark_model->orderInvoice->invoice_type;
        if($db_remark_model->orderInvoice->collect_name == "")
        {
            $collect_name = $db_remark_model->orderInvoice->call;
            $call = $db_remark_model->orderInvoice->call;
        }
        else
        {
            $collect_name = $db_remark_model->orderInvoice->collect_name;
            $call = $db_remark_model->orderInvoice->collect_name;
        }      
        $phone = $db_remark_model->orderInvoice->phone;
        $previewUrl = $db_remark_model->orderInvoice->preview_url;
        $apply_time = date('Y-m-d H:i:s', ($db_remark_model->orderInvoice->apply_time));;//申请时间

        return $this->successJson('成功', ['call'=>$call,'apply_time'=>$apply_time,'invoice'=>$invoice,'previewUrl'=>$previewUrl,'state'=>$state,'order_id'=>$order_id,'invoice_type'=>$invoice_type,'collect_name'=>$collect_name,'phone'=>$phone]);
    }

    /**
     * 保存开票信息，推送发票信息到CRM
     * @return \Illuminate\Http\JsonResponse
     * */
    public function sendInvoice()
    {
        //收集数据信息
        $order_id = \YunShop::request()->order_id;//订单id
        $request = \YunShop::request()->invoice_list;
        $phone = $request['phone'];//手机号
        $invoice_type = $request['invoice_type'];//发票类型(0电子1纸质)
        $rise_type = $request['invoice_status'];//发票抬头(1个人0单位)
        $collect_name = $request['call'];//抬头或单位名称
        $company_number = $request['company_number'];//单位识别号

        //组装推送CRM数据消息  发票抬头 纳税人识别号 订单ID
        $order_sn = DB::table('yz_order')->where('id', $order_id)->value('order_sn');
        $crm_invoice['OrderIDs'] = $order_sn;
        $crm_invoice['ReceiptTitle'] = $collect_name;
        $crm_invoice['ReceiptDesc'] = $company_number;

        
        //发送数据信息 推送CRM 等待CRM接口  该怎么写能够直接推过去
        //测试$result = json_decode($this->curlPost("http://10.88.10.217:16061/api/invoice/invoiceapply", json_encode($crm_invoice)),true);
        $result = json_decode($this->curlPost("10.20.81.18:16061/api/invoice/invoiceapply", json_encode($crm_invoice)),true);//正式
        //print_r($result);exit();

        if($result['IsError'] == '0')
        {
            //组装本地需要保存数据信息
            $array_invoice['phone'] = $phone;
            $array_invoice['rise_type'] = $rise_type;
            $array_invoice['collect_name'] = $collect_name;
            $array_invoice['invoice_type'] = $invoice_type;
            $array_invoice['company_number'] = $company_number;
            $array_invoice['apply_time'] = time();
            $array_invoice['state'] = 2;//开票状态改成 2开票中


            //保存数据信息
            DB::table('yz_order_invoice')->where('order_id', $order_id)->update($array_invoice);


            //收集反馈信息
            return $this->successJson('成功');
        }
        else
        {
            //收集反馈信息
            return $this->errorJson('开票失败，请稍后重试，或联系在线客服。',$result['Message']);
        }
    }


    /**
     * @param $url url地址
     * @param $data 数据
     * @return mixed 内容
     */
    public function curlPost($url, $data)
    {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array(
                'Content-Type: application/json')
        );
        $return = curl_exec($ch);
        curl_close($ch);
        return $return;
    }

    /**
     * @param string $url get请求地址
     * @param int $httpCode 返回状态码
     * @return mixed
     */
    public static function curlGet($url, &$httpCode = 0)
    {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        //不做证书校验，部署在linux环境下请改位true
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 10);
        $file_contents = curl_exec($ch);
        $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        curl_close($ch);
        return $file_contents;
    }

}