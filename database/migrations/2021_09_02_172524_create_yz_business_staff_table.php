<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2021/6/24
 * Time: 18:10
 */

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateYzBusinessStaffTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        if (!Schema::hasTable('yz_business_staff')) {
            Schema::create('yz_business_staff', function (Blueprint $table) {
                $table->increments('id')->comment('主键ID');
                $table->integer('uniacid')->comment('公众号id');
                $table->integer('business_id')->comment('企业ID');
                $table->integer('uid')->default(0)->comment('会员id');
                $table->string('user_id')->default('')->comment('成员UserID。对应管理端的帐号');
                $table->string('name')->default('')->comment('成员名称');
                $table->string('mobile')->default('')->comment('手机号');
//                $table->text('department_id_arr')->comment('成员部门数据,序列化');
                $table->string('position')->dafault('')->comment('职务');
                $table->tinyInteger('gender')->default(0)->comment('0未知 1男 2女');
                $table->string('telephone')->default('')->comment('固话');
                $table->string('email')->default('')->comment('邮箱地址');
                $table->string('avatar')->default('')->comment('头像');
                $table->string('alias')->default('')->comment('别名');
                $table->tinyInteger('status')->default(0)->comment('0未关联 1=已激活，2=已禁用，4=未激活，5=退出企业');
                $table->string('qr_code')->default('')->comment('员工个人二维码');
                $table->string('address')->default('')->comment('员工地址');
                $table->string('open_userid')->default('')->comment('成员第三方唯一标识代码');
                $table->string('main_department')->default('')->comment('主部门');
                $table->integer('updated_at')->nullable();
                $table->integer('created_at')->nullable();
                $table->integer('deleted_at')->nullable();
                $table->index('business_id');
            });
        }

        \Illuminate\Support\Facades\DB::statement("ALTER TABLE " . app('db')->getTablePrefix() . "yz_business_staff comment '企业PC端-企业员工表'");
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('yz_business_staff');
    }
}
