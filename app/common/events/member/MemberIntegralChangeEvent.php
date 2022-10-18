<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2022/3/14
 * Time: 16:32
 */

namespace app\common\events\member;

use app\common\events\Event;

class MemberIntegralChangeEvent extends Event
{
    protected $member;
    protected $source;
    protected $recordData;

    public function __construct($memberLove,$source, $recordData)
    {
        $this->member = $memberLove;

        $this->source = $source;

        $this->recordData = $recordData;
    }

    public function getRecordData()
    {
        return $this->recordData;
    }

    public function getMember()
    {
        return $this->member;
    }

    public function getSource()
    {
        return $this->source;
    }
}