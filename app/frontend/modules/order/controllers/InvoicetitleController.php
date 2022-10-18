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
use app\common\models\OrderInvoice;
class InvoicetitleController extends ApiController
{

    /**
     * 获取发票抬头
     * @return \Illuminate\Http\JsonResponse
     */
    public function getInvoicetitle()
    {
        $uid = $_SESSION['yunzshop_member_id']['data'];
        //echo '<br>uid:'.$uid;
        //$uid = \YunShop::app()->getMemberId();
        //echo '<br>uid2:'.$uid;
        //echo '<br>type:'.\YunShop::request()->rise_type;
        $order_list = Order::select('id','invoice')->with(['orderInvoice'])->where('uid', $uid)->orderBy('id','desc')->get();
        
        //print_r($order_list);
        
        //$order_list = Order::select('id','invoice')->with(['orderInvoice'])->where('uid', $uid)->get();
        /*
         * [2] => Array
        (
            [id] => 5
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
         */
        
        
       
         

        
        
        
        $list = $order_list->toArray();
        $list_invoice = array();
        foreach($list AS $k=>$v){
            if(!empty($v['order_invoice']['collect_name']) || !empty($v['order_invoice']['call'])){
                $list_invoice['collect_name']=$v['order_invoice']['collect_name'];
                $list_invoice['phone']=$v['order_invoice']['phone'];
                $list_invoice['company_number']=$v['order_invoice']['company_number'];
                
                $list_invoice['rise_type']=$v['order_invoice']['rise_type'];
                $list_invoice['invoice_type']=$v['order_invoice']['invoice_type'];
                $list_invoice['invoice_content']=$v['order_invoice']['invoice_content'];
                $list_invoice['call']=$v['order_invoice']['call'];
                break;
            }
        }
        //print_r($list);
        //print_r($list_invoice);
        return $this->successJson('成功', ['invoice'=>$list_invoice]);

        exit;


    }
    
    
    /**
     * 获取发票 信息 第一条 个人或单位
     * @return \Illuminate\Http\JsonResponse
     */
    public function getinvoicetitleone()
    {
        $uid = \YunShop::app()->getMemberId();
        //echo '<br>uid:'.$uid;
        $order_list = OrderInvoice::select('id','call','uid','collect_name','email','company_number','updated_at','created_at','deleted_at','phone','rise_type')->where('uid', $uid)->where('rise_type', \YunShop::request()->rise_type)->orderBy('id','desc')->first();
        //$list = $order_list->toArray();
        //print_r($list);
        
  
        /*
         * 
         * Array
            (
                [id] => 18
                [uid] => 2
                [collect_name] => ml3
                [email] => 
                [company_number] => 
                [updated_at] => 2022-01-23 14:36:37
                [created_at] => 2022-01-23 14:36:37
                [deleted_at] => 
                [phone] => 13522932875
            )
         * 
         * 
         */
        //echo '<br>ssssssssss:'.empty($order_list);
        
        if(empty($order_list)){
            return $this->successJson('无数据', ['invoice'=>'']);
        }else{
            $list = $order_list->toArray();
            return $this->successJson('成功', ['invoice'=>$list]);
        }
    }
    
    
    
    /**
     * 获取发票抬头列表
     * @return \Illuminate\Http\JsonResponse
     */
    public function getInvoicetitlelist()
    {
        $uid = \YunShop::app()->getMemberId();
        //echo '<br>uid:'.$uid;
        //echo '<br>type:'.\YunShop::request()->rise_type;
        $order_list = OrderInvoice::select('id','call','uid','collect_name','email','company_number','updated_at','created_at','deleted_at','phone','rise_type')->where('uid', $uid)->where('rise_type', \YunShop::request()->rise_type)->orderBy('id','desc')->get();//where('collect_name', '!=','')->
        $order_list = Order::select('id','invoice')->with(['orderInvoice'])->where('uid', $uid)->orderBy('id','desc')->get();
        //print_r($order_list);
        if(empty($order_list)){
            return $this->successJson('无数据', ['invoice'=>'']);
        }else{
            $list = $order_list->toArray();
            //print_r($list);
            if(empty($list)){
                return $this->successJson('无数据', ['invoice'=>'']);
            }else{
                return $this->successJson('成功', ['invoice'=>$list]);
            }
            
        }
        
    }
    
    
    public function invoicetitlepostget()
    {
        echo 'aaaaaaaaaaaaaa';
        error_log(date("[Y-m-d H:i:s]")."\n\nuid:1111111111111111133333333post\n\n", 3, "/log/invoice_".date("[Y-m-d]").".txt");
    }
    
    /**
     * 获取发票抬头对应 单位识别码
     * @return \Illuminate\Http\JsonResponse
     */
    public function invoicetitlepost()
    {
        //keyword 	是 	string 	公司名称（支持模糊查询）
        //timeStamp 	是 	long 	当前毫秒级时间戳，正负不能超过180秒
        //clientId 	是 	string 	访客ID
        //signType 	是 	string 	MD5参数签名算法
        //sign 	是 	string 	签名字符串，不区分大小写
        
        
        $keyword = \YunShop::request()->keyword;
        if(empty($keyword)){
            return $this->successJson('无数据', ['data'=>'']);
            exit;
        }
        $array = array(
            'keyword'=>$keyword,//'北京益生康健商贸有限公司',
            'timeStamp'=>$this->getMsec(),//1643161842040,//
            'clientId'=>'yisheng',//jxb',
            'signType'=>'SHA256'//'sha256'//'SHA1'//'MD5',//'sha1',//
            );
        
        $sign = $this->signmd5($array);
        //$url = "http://wsy.vtaxchina.net"."/api/taxCompany.do";
        $url = "https://www.vtaxchina.com"."/api/taxCompany.do";
        /*{
            "code": 0,
            "data": {
                "sign": "签名必须是长度32位以上加密串",
                "timeStamp": "时间戳必须毫秒级，13位1开头的数"
            },
            "success": false,
            "message": "签名必须是长度32位以上加密串、时间戳必须毫秒级，13位1开头的数"
        }*/
        $array['sign']=$sign;
        
        //echo '<br>url:'.$url;
        //echo '<br><br>array:';
        //print_r($array);
        //echo '<br>sign:'.$sign;
        
        $re = $this->curl_post($url,$array);
        //return $re;
        $re = json_decode($re,true);        
        //print_r($re);
        return $this->successJson($re);
       
    }
    
    /**
     * 
     * @param array $params
     * @return string
     * 取加密的签名
     */
    protected function signmd5(array $params = array()){
        ksort($params);
        $data = $params;
        $str = http_build_query($params);
        $str = urldecode($str);
        $key = "fca0c375c0d83d0750e2b2b7b443b67d";
        $key = "beae93be45ff40a79e85ac7a567ecbce";
        $str2 = $str."&key=".$key;
        $sign = hash("sha256", $str2);//sha256
        return $sign;
    }
    
    
    /**
     * 
     * @return type
     * 取时间戳
     */
    protected function getMsec() {
        list($msec, $sec) = explode(' ', microtime());
        return intval(((float)$msec + (float)$sec) * 1000);
    }
    
     /**
     * PHP 处理 post数据请求
     * @param $url 请求地址
     * @param array $params 参数数组
     * @return mixed
     */
    protected function curl_post($url,array $params = array()){
        //TODO 转化为 json 数据
        //$data_string = json_encode($params);
        $data_string = $params;
        $ch = curl_init();
        curl_setopt($ch,CURLOPT_URL,$url);
        curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);
        curl_setopt($ch,CURLOPT_HEADER,0);
        curl_setopt($ch,CURLOPT_TIMEOUT,3);
        curl_setopt($ch,CURLOPT_POST,1);
        curl_setopt($ch,CURLOPT_POSTFIELDS,$data_string);
        /*
        curl_setopt($ch,CURLOPT_CONNECTTIMEOUT,10);
        
        curl_setopt($ch,CURLOPT_SSL_VERIFYPEER,false);
        curl_setopt($ch,CURLOPT_POSTFIELDS,$data_string);
        curl_setopt($ch,CURLOPT_HTTPHEADER,
            array(
                'Content-Type: application/json'
            )
        );
        */
        $data = curl_exec($ch);
        curl_close($ch);
        return ($data);
    }

}