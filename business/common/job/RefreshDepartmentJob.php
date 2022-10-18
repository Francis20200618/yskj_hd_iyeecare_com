<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2021/9/22
 * Time: 13:37
 */

namespace business\common\job;


use app\common\facades\Setting;
use business\common\services\DepartmentService;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;


class RefreshDepartmentJob implements ShouldQueue
{

    use InteractsWithQueue, Queueable, SerializesModels;
    protected $business_id;
    protected $uniacid;

    public function __construct($uniacid, $business_id)
    {
        $this->uniacid = $uniacid;
        $this->business_id = $business_id;
    }


    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        \YunShop::app()->uniacid = $this->uniacid;
        Setting::$uniqueAccountId = $this->uniacid;

        \Log::debug('企业微信部门更新队列开始' . $this->business_id);
        $res = DepartmentService::refreshDepartment($this->business_id);
        $result = $res['result'] ? '成功' : '失败';
        \Log::debug('企业微信部门更新队列' . $result . ':' . $res['msg']);
        
    }


}