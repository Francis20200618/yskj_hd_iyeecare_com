<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2021/11/19
 * Time: 18:07
 */

namespace app\backend\modules\order\models;


use  Maatwebsite\Excel\Concerns\FromArray;
use Maatwebsite\Excel\Concerns\WithMapping;
use Maatwebsite\Excel\Concerns\WithColumnFormatting;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Maatwebsite\Excel\Concerns\WithEvents;
use Maatwebsite\Excel\Events\AfterSheet;
use Maatwebsite\Excel\Concerns\WithStyles;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;

//临时使用
class OrderExport  implements FromArray,WithStyles
{

    public $data;//订单数据
    public $status; //sheet名称（订单状态）
    public $column; //总行数
    public $goodsNum = []; //一个订单的商品数量

    public function __construct($data)
    {
        $this->data = $data;
    }

    public function array(): array
    {
        $list = [];
        foreach ($this->data as $key => $value) {
            if ($key > 0) {
                $column_array = [];
                $column = [];
                foreach ($value as $column_key => $column_value) {
                    if (is_array($column_value)) {
                        $size = count($column_value);
                        $this->goodsNum[] = count($column_value);
                        if ($size > 1) {
                            foreach ($column_value as $goods_key => $goods_value) {
                                $column_array[] = array_merge($column, $goods_value);
                            }
                        } else {
                            foreach ($column_value as $goods_key => $goods_value) {
                                $column_array[] = array_merge($column, $goods_value);
                            }
                        }
                    } else {
                        if ($column_array) {
                            foreach ($column_array as $k => $v) {
                                $column_array[$k][] = $column_value;
                            }

                        } else {
                            $column[] = $column_value;
                        }

                    }
                }
                if ($column_array) {
                    $list = array_merge($list, $column_array);
                } else {
                    $list = array_merge($list, [$column]);
                }
            } else {
                $list[] = $value;
            }
        }
        return $list;
    }



    public function styles(Worksheet $sheet)
    {

        $cell = [];
        for($i = 'A'; $i != 'AQ'; $i++) {
            $cell[] = $i;
        }
        $cell = array_filter($cell,function ($v) {
            return !in_array($v,['L','M','N','O','P','Q']);
        });

        foreach ($cell as $item) {
            $start = 2;
            foreach ($this->goodsNum as $key => $value) {
                $end = $start + $value - 1;
                if ($value > 1) {
                    $sheet->mergeCells($item . $start . ':' . $item . $end); //合并单元格
                }
                $start = $end + 1;

            }
        }
    }
}