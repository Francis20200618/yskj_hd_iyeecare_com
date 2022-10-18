<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2022/1/21
 * Time: 10:40
 */

namespace app\outside\modules\member\controllers;


use app\frontend\repositories\MemberAddressRepository;
use app\outside\controllers\OutsideController;

class AddressController extends OutsideController
{
    public function index()
    {
        $this->validate([
            'uid' => 'required|integer',
        ],null, [
            'title.required' => '会员标识不能为空',
            'contents.integer' =>  '会员标识必须是纯数字',
        ]);

        $uid = request()->input('uid');

        $memberAddress = app(MemberAddressRepository::class)->getAddressList($uid);


        return $this->successJson('list', $memberAddress);
    }
}