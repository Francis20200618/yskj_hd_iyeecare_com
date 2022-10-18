<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddOrderGoodsIdToYzPointLogTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        if (Schema::hasTable('yz_point_log')) {
            Schema::table('yz_point_log', function (Blueprint $table) {
                if (!Schema::hasColumn('yz_point_log', 'order_goods_id')) {
                    $table->tinyInteger('order_goods_id')->default(0)->comment( '订单商品id,退款返还积分使用');
                }

            });
        }
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {

    }
}
