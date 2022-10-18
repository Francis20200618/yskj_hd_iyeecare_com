@extends('layouts.base')

@section('content')
@section('title', trans('提现详情'))
<style>
    body {
        background-color: #eff3f6;
    }

    .info {
        display: flex;
        margin: 20px 0;
    }

    .user {
        width: 500px;
    }

    .info-title {
        font-size: 14px;
        color: #29ba9c;
        line-height: 40px;
    }

    .info-box {
        display: flex;
        flex-wrap: nowrap;
        justify-content: space-around;
    }

    .user-info img {
        width: 60px;
        height: 60px;
        border-radius: 4px;
    }

    .info-item {
        /* padding: 0 100px; */
    }

    .item {
        margin: 10px 0;

    }

    .box-card {
        width: 300px;
    }

    .el-card__header {
        text-align: center;
        padding: 10px;
    }

    .cell {
        text-align: center;
    }

    .vue-page {
        border-radius: 5px;
        width: calc(100% - 276px);
        float: right;
        margin-right: 15px;
        position: fixed;
        bottom: 0;
        right: 0;
        padding: 15px 5% 15px 0;
        background: #fff;
        height: 60px;
        z-index: 999;
        margin-top: 0;
        box-shadow: 0 2px 9px rgb(51 51 51 / 10%);
        text-align: center;
    }

    .changeAll .el-radio {
        margin-right: 10px;
    }

    .el-message-box {
        width: 500px;
    }

    [v-cloak] {
        display: none;
    }
</style>
<div class="all">
    <div id="app" v-cloak>
        <box-item text="提现者信息" v-loading="loading">
            <div class="info-box">
                <div class="info-item">
                    <div class="info-title">会员信息</span></div>
                    <div class="user-info">
                        <div class="image" v-if="withdraw.member">
                            <div style="display: flex;width: 100%;">
                                <img :src="withdraw.member.avatar_image" alt="" srcset="" />
                                <div style="line-height: 30px;margin-left: 20px;">
                                    <div>昵称：[[withdraw.member.nickname]]</div>
                                    <div>姓名：[[withdraw.member.realname]]</div>
                                </div>
                            </div>
                            <div class="item">手机号：[[withdraw.member.mobile]]</div>
                            <div class="item">会员等级：[[withdraw.member.level_name]]</div>
                        </div>
                    </div>
                </div>
                <div class="info-item">
                    <div class="info-title">操作时间</div>
                    <div class="user-info">
                        <div>申请时间：[[withdraw.created_at]]</div>
                        <div class="item" v-if="withdraw.audit_at">审核时间：[[withdraw.audit_at]]</div>
                        <div class="item" v-if="withdraw.pay_at">打款时间：[[withdraw.pay_at]]</div>
                        <div class="item" v-if="withdraw.arrival_at">到账时间：[[withdraw.arrival_at]]</div>
                    </div>
                </div>


                <div class="info-item">
                    <div class="info-title">打款信息</div>
                    <div class="user-info">
                        <div>提现状态：<span style="color: red;">[[withdraw.status_name]]</span></div>
                        <template v-if="withdraw.status==0">
                            <div class="item">审核金额：<span style="color: red;">[[withdraw.amounts||"0.00"]] 元</span></div>
                            <div class="item">预计手续费：<span style="color: red;">[[withdraw.poundage||"0.00"]] 元</span></div>
                            <div class="item" >预计劳务税：<span style="color: red;">[[withdraw.servicetax||"0.00"]] 元</span></div>
                            <div class="item">预计应打款：<span style="color: red;">[[(withdraw.amounts-withdraw.poundage-withdraw.servicetax).toFixed(2)]] 元</span></div>
                        </template>
                        <template v-else>
                            <div class="item">审核金额：<span style="color: red;">[[(Number(withdraw.actual_amounts)+Number(withdraw.actual_servicetax)+Number(withdraw.actual_poundage)).toFixed(2)]] 元</span></div>
                            <div class="item">手续费：<span style="color: red;">[[withdraw.actual_poundage||"0.00"]] 元</span></div>
                            <div class="item">劳务税：<span style="color: red;">[[withdraw.actual_servicetax||"0.00"]] 元</span></div>
                            <div class="item">应打款：<span style="color: red;">[[withdraw.actual_amounts||"0.00"]] 元</span></div>
                        </template>
                    </div>
                </div>
                <div class="info-item">
                    <div class="info-title">提现方式</div>
                    <div class="user-info">
                        <div>提现方式：[[withdraw.pay_way_name]]</div>
                        <div class="item">收入类型：[[withdraw.type_name]]</div>
                        <div class="item">提现金额：<span style="color: red;">[[withdraw.amounts||"0.00"]] 元</span></div>
                        <template class="item" v-if="withdraw.pay_way=='manual'">
                            <template v-if="withdraw.manual_type==1">
                                <div class="item">{{\Setting::get('shop.lang.zh_cn.income.manual_withdrawal') ?: '手动打款'}}方式：银行卡</div>
                                <template v-if="withdraw.bank_card">
                                    <div class="item">开户人姓名：[[withdraw.bank_card.member_name]]</div>
                                    <div class="item">开户行：[[withdraw.bank_card.bank_name]]</div>
                                    <div class="item">开户省：[[withdraw.bank_card.bank_province]]</div>
                                    <div class="item">开户市：[[withdraw.bank_card.bank_city]]</div>
                                    <div class="item">开户支行：[[withdraw.bank_card.bank_branch]]</div>
                                    <div class="item">银行卡号：[[withdraw.bank_card.bank_card]]</div>
                                </template>
                            </template>
                            <template v-if="withdraw.manual_type==2">
                                <div class="item">手动打款方式：微信</div>
                                <div class="item" v-if="withdraw.has_one_yz_member">微信号：[[withdraw.has_one_yz_member.wechat]]</div>
                            </template>
                            <template v-if="withdraw.manual_type==3">
                                <div class="item">手动打款方式：支付宝</div>
                                <div class="item" v-if="withdraw.has_one_yz_member">支付宝号：[[withdraw.has_one_yz_member.alipay]]</div>
                            </template>
                        </template>
                    </div>
                </div>
            </div>
        </box-item>
        <box-item :text="['提现收入列表',(income_total||'0')+'条']">
            <el-table :data="income_list" style="width: 100%" v-loading="loading">
                <el-table-column prop="id" label="收入ID"></el-table-column>
                <el-table-column prop="type_name" label="提现类型"></el-table-column>
                <el-table-column prop="amount" label="提现金额"></el-table-column>
                <el-table-column prop="pay_status_name" label="打款状态"></el-table-column>
                <el-table-column prop="created_at" label="提现时间"></el-table-column>
                <el-table-column label="操作">
                    <template slot-scope="scope">
                        <i class="el-icon-view" style="font-size: 16px;cursor: pointer;" @click="changeDetail(scope.row)"></i>
                    </template>
                </el-table-column>
                <el-table-column label="状态" width="300" v-if="withdraw.status==0||withdraw.status==-1">
                    <template slot="header" slot-scope="scope">
                        <div class="changeAll">
                            <el-radio-group v-model="changeAllData" @change="changeAll" style="color: aqua;">
                                <el-radio :label="1">全部通过</el-radio>
                                <el-radio :label="-1">全部无效</el-radio>
                                <el-radio :label="3">全部驳回</el-radio>
                            </el-radio-group>
                        </div>
                    </template>
                    <template slot-scope="scope">
                        <el-radio-group v-model="scope.row.pay_status" @change="change(scope.row)">
                            <el-radio :label="1">通过</el-radio>
                            <el-radio :label="-1">无效</el-radio>
                            <el-radio :label="3">驳回</el-radio>
                        </el-radio-group>
                    </template>
                </el-table-column>
            </el-table>
        </box-item>
        <div style="height: 60px;"></div>
        <div class="vue-page">
            <el-button @click="goback">返回列表</el-button>
            <el-button type="primary" @click="examine('审核成功')" v-if="withdraw.status==0">提交审核</el-button>
            <template v-if="withdraw.status==1">
                <el-button v-if="withdraw.pay_way=='balance'" type="primary" @click="Repayment('pay_way')">打款到余额</el-button>
                <el-button v-if="withdraw.pay_way=='wechat'" type="primary" @click="Repayment('pay_way')">打款到微信钱包</el-button>
                <el-button v-if="withdraw.pay_way=='alipay'" type="primary" @click="Repayment('pay_way')">打款到支付宝</el-button>
                <el-button v-if="withdraw.pay_way=='manual'" type="primary" @click="Repayment('pay_way')">{{\Setting::get('shop.lang.zh_cn.income.manual_withdrawal') ?: '手动打款'}}</el-button>
                <el-button v-if="withdraw.pay_way=='eup_pay'" type="primary" @click="Repayment('pay_way')">EUP提现</el-button>
                <el-button v-if="withdraw.pay_way=='huanxun'" type="primary" @click="Repayment('pay_way')">打款到银行卡</el-button>
                <el-button v-if="withdraw.pay_way=='yop_pay'" type="primary" @click="Repayment('pay_way')">易宝提现</el-button>
                <el-button v-if="withdraw.pay_way=='converge_pay'" type="primary" @click="Repayment('pay_way')">汇聚提现</el-button>
                <el-button v-if="withdraw.pay_way=='high_light_wechat'||withdraw.pay_way=='high_light_alipay'||withdraw.pay_way=='high_light_bank'" type="primary" @click="Repayment('pay_way')">高灯打款</el-button>
                <el-button type="primary" @click="Repayment('线下确认打款')">线下确认打款</el-button>
                <el-button type="danger" @click="Repayment('驳回记录')">驳回记录</el-button>
            </template>
            <template v-else-if="withdraw.status==4">
                <el-button type="primary" @click="Repayment('重新打款')">重新打款</el-button>
                <el-button type="primary" @click="Repayment('线下确认打款')">线下确认打款</el-button>
                <el-button type="danger" @click="Repayment('驳回记录')">驳回记录</el-button>
            </template>
            <template v-else-if="withdraw.status==-1">
                <el-button type="primary" @click="examine('重新审核成功')">重新审核</el-button>
            </template>
        </div>

        <el-dialog title="详情" :visible.sync="dialogVisible" width="30%">
            <template v-if="detail">
                <box-item v-for="(item,i) in detail" :text="item.title">
                    <div style="margin-left: 20px;">
                        <template v-for="(items,ii) in item.data">
                            <div :class="{item:i>0||ii>0}" v-if="!isarr(items)">[[items.title]] ：[[items.value]]</div>
                            <template v-else>
                                <div :class="{item:i>0||ii>0}" v-for="name in items">[[name.title]] ：[[name.value]]</div>
                            </template>
                        </template>
                    </div>
                </box-item>
            </template>
            <template v-else>
                <el-empty description="无详情"></el-empty>
            </template>
        </el-dialog>
    </div>
</div>
@include('public.admin.box-item')
<script>
    let id = "{{ request()-> id }}";
    let vm = new Vue({
        el: "#app",
        delimiters: ['[[', ']]'],
        data() {
            return {
                withdraw: {},
                income_list: [],
                loading: false,
                examineData: {},
                income_total: "",
                dialogVisible: false,
                detail: null,
                changeAllData: ""
            }
        },
        created() {
            this.getdata();
        },
        methods: {
            changeAll(val) {
                this.income_list.forEach(item => {
                    item.pay_status = val || this.changeAllData;
                })
            },
            isarr(data) {
                return Array.isArray(data);
            },
            changeDetail(row) {
                if (!row.detail) {
                    this.detail = ""
                } else {
                    this.detail = JSON.parse(row.detail);
                }
                this.dialogVisible = true;
            },
            getdata() {
                this.loading = true;
                this.$http.post("{!! yzWebUrl('withdraw.detail.index') !!}", {
                    id
                }).then(({
                    data
                }) => {
                    if (data.result) {
                        data = data.data;
                        this.withdraw = data.withdraw;
                        this.income_list = data.income_list;
                        this.income_total = data.income_total;
                        console.log(this.withdraw.pay_way);
                        if (this.withdraw.status == -1 || this.withdraw.status == 0) {
                            if (this.withdraw.status == 0) {
                                this.changeAllData = 1;
                                this.changeAll(1);
                            } else {
                                this.changeAllData = -1;
                            }
                        }
                    } else this.$message.error(data.msg);
                    this.loading = false;
                })
            },
            examine(msg) {
                let audit = {}
                this.income_list.forEach(item => {
                    audit[item.id] = item.pay_status;
                })
                const loading = this.$loading({
                    lock: true,
                    text: '正在运行中...',
                    spinner: 'el-icon-loading',
                    background: 'rgba(0, 0, 0, 0.7)'
                });
                this.$http.post("{!! yzWebUrl('withdraw.audit.index') !!}", {
                    id,
                    audit
                }).then(({
                    data
                }) => {
                    loading.close();
                    if (data.result) {
                        this.$message({
                            message: msg,
                            type: 'success'
                        });
                        this.getdata();
                    } else this.$message.error(data.msg);
                })
            },
            change(row) {
                // this.examineData[row.id] = row.status;
                let check = true;
                this.income_list.forEach(item => {
                    if (item.pay_status != row.pay_status) check = false;
                })
                console.log(check);
                if (check) this.changeAllData = row.pay_status;
                else this.changeAllData = "";
            },
            confirm(tips, url) {
                this.$confirm(tips, '提示', {
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                    type: 'warning'
                }).then(() => {
                    this.endData(url);
                }).catch(() => {
                    return false
                });
            },
            Repayment(name) {
                if (name == "pay_way") {
                    let url = "{!! yzWebUrl('withdraw.pay.index') !!}"
                    this.endData(url);
                } else if (name == "线下确认打款") {
                    let url = "{!! yzWebUrl('withdraw.confirm-pay.index') !!}";
                    this.confirm('本打款方式需要线下打款，系统只是完成流程!', url);
                } else if (name == "重新打款") {
                    let url = "{!! yzWebUrl('withdraw.again-pay.index',['again_pay'=> 1]) !!}";
                    this.endData(url);
                } else if (name == "驳回记录") {
                    let url = "{!! yzWebUrl('withdraw.audited-rebut.index') !!}";
                    this.confirm("驳回后，需要会员重新申请提现（仅驳回审核通过提现）", url)
                };
            },
            endData(url) {
                const loading = this.$loading({
                    lock: true,
                    text: '正在运行中...',
                    spinner: 'el-icon-loading',
                    background: 'rgba(0, 0, 0, 0.7)'
                });
                this.$http.post(url, {
                    id: this.withdraw.id
                }).then(({
                    data
                }) => {
                    if (data.result) {
                        this.$message({
                            message: data.msg,
                            type: 'success'
                        });
                        this.getdata();
                    } else this.$message.error(data.msg);
                })
                loading.close();
            },
            goback() {
                window.history.go(-1)
            }
        }
    })
</script>

@endsection