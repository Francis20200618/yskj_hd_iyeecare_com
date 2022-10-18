<?php
/**
 * Created by PhpStorm.
 * Author: mqz
 * Date: 2022/1/20
 * Time: 15:52
 */

namespace app\common\models;


/**
 * Class OrderInvoice
 * @package app\common\models
 */
class OrderInvoice extends BaseModel
{
    public $table = 'yz_order_invoiceperson';
    protected $guarded = ['id'];
}