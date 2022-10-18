<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2022/3/26
 * Time: 12:39
 */

namespace app\outside\modules\member\controllers;


use app\common\models\MemberLevel;
use app\outside\controllers\OutsideController;

class MemberLevelController extends OutsideController
{
    public function index()
    {
       $list =  MemberLevel::select('id', 'level_name', 'level')->orderBy('level','ASC')->get();


       return $this->successJson('list', $list);
    }
}