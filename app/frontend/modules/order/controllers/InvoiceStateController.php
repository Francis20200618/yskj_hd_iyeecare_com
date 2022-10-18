<?php
/**
 * Created by PhpStorm.
 * Author: 芸众商城 www.yunzshop.com
 * Date: 2017/3/9
 * Time: 上午9:38
 */

namespace app\frontend\modules\order\controllers;

use app\common\components\BaseController;
use app\common\facades\Setting;
use app\common\models\Order;
use app\common\services\PayFactory;
use app\frontend\modules\order\services\VerifyPayService;
use Illuminate\Support\Facades\DB;

class InvoiceStateController extends BaseController
{
    /**
     * 同步CRM开票状态以及相关信息
     * @return \Illuminate\Http\JsonResponse
     * */
    public function crmInvoice()
    {
        //获取同步的消息
        //这里有一个问题，给出什么路径，能让CRM直接调用我们的该路径的接口？也得绕过登录
        $result = \YunShop::request();
        //print_r($result);exit();
        //error_log(date("[Y-m-d H:i:s]")."result:\n".json_encode($result)."\n", 3, "/log/Crm_Invoice_".date("[Y-m-d]").".txt");
        $code = $result['Code'];//开票状态  0未开票、1开票成功、2开票中、3开票失败 0000：开票成功；6666：未开票；7777：开票中；9999：开票失败
        $msg = $result['Msg'];//错误消息
        $tradeNo = $result['TradeNo'];//订单编号
        $invoiceDate = $result['InvoiceDate'];//开票日期
        $downloadUrl = $result['DownLoadUrl'];//下载地址
        $previewUrl = $result['VatPlatformInvPreviewUrl'];//预览地址


        //组装同步消息
        $status = 0;
        if($code == '0000'){$status = 1;}
        elseif($code == '6666'){$status = 0;}
        elseif($code == '7777'){$status = 2;}
        elseif($code == '9999'){$status = 3;}
        $array_invoice['state'] = $status;
        $array_invoice['invoice_fail_msg'] = $msg;
        $array_invoice['invoice_date'] = strtotime($invoiceDate);
        $array_invoice['invoice'] = $downloadUrl;
        $array_invoice['preview_url'] = $previewUrl;
        //error_log(date("[Y-m-d H:i:s]")."result:\n".json_encode($array_invoice)."\n", 3, "/log/Crm_Invoice_".date("[Y-m-d]").".txt");
        //print_r($array_invoice);exit();

        //保存数据信息
        $orderId = DB::table('yz_order')->where('order_sn', $tradeNo)->value('id');//print_r($tradeNo);print_r($orderId);exit();
        //error_log(date("[Y-m-d H:i:s]")."result:\n".json_encode($orderId)."\n", 3, "/log/Crm_Invoice_".date("[Y-m-d]").".txt");
        $res = DB::table('yz_order_invoice')->where('order_id', $orderId)->update($array_invoice);//print_r($orderId);print_r("br/");print_r($res);exit();
        //error_log(date("[Y-m-d H:i:s]")."result:\n".json_encode($res)."\n", 3, "/log/Crm_Invoice_".date("[Y-m-d]").".txt");

        if($res)
        {
            return $this->successJson('成功');
        }
        else
        {
            return $this->errorJson('失败');
        }

        //收集反馈消息
        //return $this->successJson('成功', $res);
        //{"result":1,"msg":"成功","data":1}
    }

    //https://hd.iyeecare.com/addons/yun_shop/api.php?i=2&type=5&route=order.rise.gettest&id=4
    public function getTest()
    {
        $res = json_decode($this->curlGet("http://10.20.81.18:16061/api/client/test1"),true);
        print_r($res);
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