<?php
/**
 * Created by PhpStorm.
 * User: mqz
 * Date: 2022/1/20
 * Time: 14:11
 */

namespace app\common\models\order;


use app\common\models\BaseModel;

/**
 * 用户发票记录
 * Class OrderInvoiceperson
 * @package app\common\models\order
 */
class OrderInvoiceperson extends BaseModel
{
    protected $table = 'yz_order_invoiceperson';


    protected $guarded = ['id'];


    protected $attributes = [
        //'uid' => 0,
    ];

}