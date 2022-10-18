<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2022/3/30
 * Time: 17:58
 */
namespace app\payment\controllers;

use app\common\models\PayOrder;
use app\common\models\PayType;
use app\payment\PaymentController;
use Yunshop\LeshuaPay\models\XmlToArray;
use Yunshop\LeshuaPay\services\LeshuaPay;

class LeshuaController extends PaymentController
{
    const LESHUA_ALIPAY = 85;
    const LESHUA_WECHAT = 86;
    const LESHUA_POS = 87;

    public function notifyUrlAlipay()
    {
        return $this->processOrder(self::LESHUA_ALIPAY);
    }

    public function notifyUrlWechat()
    {
        return $this->processOrder(self::LESHUA_WECHAT);
    }

    public function notifyUrlPos()
    {
        return $this->processOrder(self::LESHUA_POS);
    }

    /**
     * 支付回调参数
     *
     * @param $order_no
     * @param $parameter
     * @return array
     */
    public function setData($order_no, $trade_no, $total_fee, $pay_type_id, $pay_type)
    {
        return [
            'total_fee' => $total_fee,
            'out_trade_no' => $order_no,
            'trade_no' => $trade_no,
            'unit' => 'fen',
            'pay_type' => $pay_type,
            'pay_type_id' => $pay_type_id,
        ];
    }

    protected function processOrder($type)
    {
        $xml = request()->getContent();
        $data = XmlToArray::convert($xml, true);
        \Log::debug(self::class. '--: 乐刷数据: ' . json_encode($data));

        $payOrder = PayOrder::where('out_order_no', $data['third_order_id'])->first();

        if (!$payOrder) {
            \Log::debug(self::class. '--: 未找到支付订单');
            return false;
        }

        \YunShop::app()->uniacid = $payOrder->uniacid;
        \Setting::$uniqueAccountId = $payOrder->uniacid;

//        $leshuaPay = new LeshuaPay;
//        $res = $leshuaPay->queryOrder($data['third_order_id']);
//        if ($res['resp_code'] == '0' && $res['status'] == '2') {
        $currentPayType = $this->currentPayType($type);
        $data = $this->setData($data['third_order_id'], $data['third_order_id'], $data['amount'], $currentPayType['id'], $currentPayType['name']);
        $this->payResutl($data);
        \Log::debug(self::class . '订单支付成功--订单号: ' . $data['third_order_id']);

        echo '000000';
//            return;
//        }

//        \Log::debug(self::class. '--返回乐刷错误信息: '. json_encode($res));
//        return;
    }

    public function currentPayType($payId)
    {
        return PayType::find($payId);
    }
}