<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2022/1/21
 * Time: 17:32
 */

namespace app\outside\controllers;

use app\common\exceptions\ApiException;
use app\common\models\Address;
use app\common\models\Street;


class AddressController extends OutsideController
{
    public function getAddress()
    {
        $addressData = [];

        $type = request()->input('level');

        $parent_id = request()->input('parent_id');

        switch ($type) {
            case 'province':

                $addressData = Address::getProvince();
                break;
            case 'city':
                $addressData = Address::getCityByParentId($parent_id);
                break;
            case 'district':
                $addressData = Address::getAreaByParentId($parent_id);
                break;
            case 'street':
                if (!\Setting::get('shop.trade.is_street')) {
                    throw new ApiException('商城未开启街道级地址设置');
                }
                $addressData = Street::getStreetByParentId($parent_id);
                break;
        }

        return $this->successJson('list', $addressData);
    }
}