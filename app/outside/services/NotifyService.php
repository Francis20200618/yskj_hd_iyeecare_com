<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2022/1/7
 * Time: 15:33
 */

namespace app\outside\services;


use app\outside\modes\OutsideAppSetting;

class NotifyService
{
    private $app_id; //应用AppID
    private $secret; //密钥字符串
    private $sign_type = "MD5"; //SHA256 MD5
    private $version = "1.0";


    public $responseData = []; //data参数
    public $verifySign = 0;

    public function __construct($data, $outsideApp = null)
    {
        $this->responseData = $data;

        $this->setConfig($outsideApp);
    }

    /**
     * 配置信息
     */
    public function setConfig($outsideApp)
    {
        if (is_null($outsideApp)) {
            $outsideApp = OutsideAppSetting::current();
        }

        $this->app_id = $outsideApp->app_id;
        $this->secret = $outsideApp->app_secret;
    }

    public function verifySign()
    {
        if (strtoupper($this->getResponseData('sign_type')) == 'SHA256') {
            return  $this->verifySha256();
        }

        return $this->verifyMd5();

    }

    protected function verifySha256()
    {
        $hashSign = hash_hmac('sha256', $this->toQueryString($this->responseData), $this->secret);

        return $hashSign == $this->responseData['sign'];
    }

    protected function verifyMd5()
    {
        return strtoupper(md5($this->toQueryString($this->responseData).'&secret='.$this->secret)) == $this->responseData['sign'];
    }


    public function setResponseData($key, $value)
    {
        $this->responseData[$key] = $value;
    }

    public function getResponseData($key)
    {
        return array_get($this->responseData, $key, null);
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