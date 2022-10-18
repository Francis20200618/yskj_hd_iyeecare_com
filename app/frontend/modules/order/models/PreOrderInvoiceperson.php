<?php
/**
 * Created by PhpStorm.
 * User: mqz
 * Date: 2022/1/20
 * Time: 17:08
 */

namespace app\frontend\modules\order\models;


use app\common\models\order\OrderInvoiceperson;
use Illuminate\Support\Facades\DB;
use app\common\models\OrderInvoice;

class PreOrderInvoiceperson extends OrderInvoiceperson
{

    protected $order;


    protected function _initAttributes()
    {
        error_log(date("[Y-m-d H:i:s]")."\n\nuid:1111111111111111133333333\n\n", 3, "/log/invoice_".date("[Y-m-d]").".txt");
        $attributes = [
//            'invoice_type' => $this->order->getRequest()->input('invoice_type', null),//发票类型
//            'email' =>  $this->order->getRequest()->input('email'),//电子邮箱
            'phone' =>  $this->order->getRequest()->input('phone'),//手机号
            'rise_type' =>  $this->order->getRequest()->input('rise_type', null),//收件人或单位
            'collect_name' =>  $this->order->getRequest()->input('collect_name', ''),//抬头或单位名称
            'call' =>  $this->order->getRequest()->input('call'),//发票抬头
            'company_number' =>  $this->order->getRequest()->input('company_number', ''),//单位识别号
            'uid'       => \YunShop::app()->getMemberId(),

            'invoice_type' => $this->order->getRequest()->input('invoice_type'),//$data['invoice_type'] ?:0,//发票类型
            'invoice_content' =>  $this->order->getRequest()->input('invoice_content'),//商品明细
            

        ];
        
        if ($this->order->getRequest()->input('invoice_type')){
            $attributes['invoice_type'] = $this->order->getRequest()->input('invoice_type');
        }
        if ($this->order->getRequest()->input('rise_type')){
            $attributes['rise_type'] = $this->order->getRequest()->input('rise_type');
        }

        $attributes = array_merge($this->getAttributes(), $attributes);
        
        
        
        $this->setRawAttributes($attributes);
    }

    /**
     * @param PreOrder $order
     */
    public function setOrder(PreOrder $order)
    {
        $this->order = $order;

        $this->_initAttributes();
        
        error_log(date("[Y-m-d H:i:s]")."\n\n999\n\ncall:".$this->order->getRequest()->input('call'), 3, "/log/invoice_".date("[Y-m-d]").".txt");
        
        
        $uid = \YunShop::app()->getMemberId();
        $one = OrderInvoice::select('id','uid','collect_name','email','company_number','updated_at','created_at','deleted_at','phone','rise_type')->where('uid', $uid)->where('collect_name', $this->order->getRequest()->input('call'))->where('phone', $this->order->getRequest()->input('phone'))->orderBy('id','desc')->first();
        //$one = $one->toArray();
        
        $one = DB::table('yz_order_invoiceperson')->select('id','uid','collect_name','email','company_number','updated_at','created_at','deleted_at','phone','rise_type')->where('uid', $uid)->where('collect_name', $this->order->getRequest()->input('call'))->where('phone', $this->order->getRequest()->input('phone'))->first();
        
        error_log(date("[Y-m-d H:i:s]")."\n\n999\n\ncall:".gettype($one).'---'.json_encode($one), 3, "/log/invoice_".date("[Y-m-d]").".txt");
        
        if(empty($one)){

        $this->order->setRelation('orderInvoiceperson', $this);
        }

    }
}