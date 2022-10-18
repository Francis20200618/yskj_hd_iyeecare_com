<?php
/******************************************************************************************************************
 * Author:  king -- LiBaoJia
 * Date:    10/26/21 3:24 PM
 * Email:   livsyitian@163.com
 * QQ:      995265288
 * IDE:     PhpStorm
 * User:    www.yunzshop.com  www.yunzshop.com
 * Company: 广州市芸众信息科技有限公司
 * Profile: 专注移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务
 ******************************************************************************************************************/


namespace app\common\observers;


use app\common\events\member\MemberChangeEvent;
use Illuminate\Database\Eloquent\Model;

class McMemberObserver extends BaseObserver
{
    public function updated(Model $model)
    {
        event(new MemberChangeEvent($model));
    }
}
