<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2022/1/6
 * Time: 11:36
 */

namespace app\outside\services;


class OutsideAppService
{

    /**
     * 年月日 + 三位公众号 + 5位随机数
     * @return string
     */
    public static function createAppId()
    {

        $currentUniacid = \YunShop::app()->uniacid;
        $unique  =  hexdec(uniqid());
        $random  = substr($unique, -5, 5);
        $uniacid = str_pad($currentUniacid,3,0,STR_PAD_LEFT);
        $appId = date("Ymd"). $uniacid.$random;

        return $appId;
    }

    public static function createSecret($appId = '')
    {
        if (empty($appId)) {
            $appId = self::createAppId();
        }

        return strtoupper(md5($appId.str_random()));
    }

    public function jiamihash($data, $appSecret, $isBinary = false)
    {
        $sign = hash_hmac('sha256', $data, $appSecret,$isBinary);

        return $sign;
    }


    /**
     * 将参数转换成k=v拼接的形式
     * @param $parameter
     * @return string
     */
    public function toQueryString($parameter)
    {

        //按key的字典序升序排序，并保留key值
        ksort($parameter);

        $strQuery="";
        foreach ($parameter as $k=>$v){

            //不参与签名、验签
            if($k == "sign"){
                continue;
            }

            if($v === null) {$v = '';}

            $strQuery .= strlen($strQuery) == 0 ? "" : "&";
            $strQuery.=$k."=".$v;
        }

        return $strQuery;
    }
}