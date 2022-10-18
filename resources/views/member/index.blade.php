@extends('layouts.base')
@section('title', '全部会员列表')
@section('content')
<link href="{{static_url('yunshop/css/total.css')}}" media="all" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="//at.alicdn.com/t/font_432132_0wgb9j72xqub.css"/>
<style scoped>
    .vue-title {
        display: flex;
        margin: 5px 0;
        line-height: 32px;
        font-size: 16px;
        color: #333;
        font-weight: 600;
    }

    .vue-title-left {
        width: 4px;
        height: 18px;
        margin-top: 6px;
        background: #29ba9c;
        display: inline-block;
        margin-right: 10px;
    }

    .vue-title-content {
        font-size: 14px;
        flex: 1;
    }

    .inputs {
        margin-top: 20px;
        padding-left: 15px;
    }

    .input-w-1 {
        width: 300px;
        margin-right: 10px;
    }

    .picker-box {
        margin-left: -10px;
    }

    .spanClass {
        font-family: SourceHanSansCN-Regular;
        font-size: 14px;
        font-weight: normal;
        font-stretch: normal;
        letter-spacing: 1px;
        color: #999999;
        margin-left: 10px;
    }

    .el-table_1_column_8,
    .el-table_1_column_9 {
        text-align: left !important;
    }

    .excelUp {
        width: 140px;
        height: 40px;
        border: 1px solid #29ba9c;
        color: #29ba9c;
        border-radius: 5px;
    }

    .excelUp .el-link--inner {
        color: #29ba9c;
    }

    .el-dialog {
        height: 685px;
    }

    .el-dialog__body {
        height: 540px;
    }
    .member-merge{
        height: 350px;
    }
    .member-merge .el-dialog__body {
        height: 200px;
    }

    .p-text {
        font-family: SourceHanSansCN-Regular;
        font-size: 14px;
        font-weight: normal;
        font-stretch: normal;
        letter-spacing: 0px;
        color: #333333;
        /* border:1px solid red; */
        text-align: center;
    }

    .cell {
        text-align: center;
    }

    .el-table_1_column_1 .cell {
        text-align: left;
        margin-left: 10px
    }

    .el-table_1_column_7 .cell {
        text-align: left;
    }

    .el-table_1_column_8 .cell {
        text-align: left;
    }

    .titleE {
        cursor: pointer;
        user-select: none;
    }

    .keep {
        width: 40px;
        height: 22px;
        font-family: SourceHanSansCN-Medium;
        font-size: 12px;
        font-weight: normal;
        font-stretch: normal;
        letter-spacing: 1px;
        color: #ffffff;
        font-weight: bold;
        background: #ff9800;
        text-align: center;
    }

    .keep_0 {
        background: #9c27b0;
        margin: 0 auto !important;
    }

    /* 显示图标 */
    .icon_size {
        font-size: 30px;
    }

    /* 已关注 */
    .wechat_public_already {
        color: #04af82;
    }

    /* 未关注 */
    .wechat_public_not {
        color: #999999;
    }

    /* 微信小程序 */
    .smallprogram {
        color: #00b84b;
    }

    /* APP */
    .all_app {
        color: #0068ff;
    }

    /* 微信开放平台 */
    .all_wechat {
        color: #0ad76d;
    }

    /* 支付宝 */
    .all_alipay {
        color: #069eff;
    }

    /* 抖音 */
    .all_tril {
        color: #23042b;
    }

    /* 企业微信 */
    .qiyeweixin01 {
        color: #0082ef;
    }

    /* 聚合cps App */
    .all_appshouji {
        color: #ffb025;
    }

    [v-cloak] {
        display: none;
    }

    .input-w {
        height: 40px;
        margin-right: 19px;
        margin-bottom: 20px;
        border-radius: 4px;
    }

    .input_1 {
        width: 120px;
    }

    .input_2 {
        width: 300px;
    }

    .input_3 {
        width: 230px;
    }

    .input_4 {
        width: 437px;
        height: 42px;
        border-radius: 6px;
        border: solid 1px #dee2ee;
    }

    .input_5 {
        width: 102px;
        height: 40px;
        background-color: #29ba9c;
        border-radius: 4px;
    }

    .input_6 {
        width: 140px;
        height: 40px;
        border-radius: 4px;
        color: #29ba9c;
        border: solid 1px #29ba9c;
    }

    .input_7 {
        width: 125px;
        height: 40px;
        border-radius: 4px;
        border: solid 1px #29ba9c;
    }

    .tag_all {
        height: 22px;
        line-height: 22px;
    }

    .tag_13c7a7 {
        background-color: #13c7a7;
        margin-bottom: 4px;
    }

    .tag_ffb025 {
        background-color: #ffb025;
    }

    .tag_box {
        text-align: left;
    }

    .tag_box .el-tag--dark {
        font-family: SourceHanSansCN-Medium;
        font-size: 12px;
        font-weight: normal;
        font-stretch: normal;
        letter-spacing: 1px;
        color: #ffffff;
        border: none;
    }

    .table_p p {
        margin: 0;
    }

    .addTag {
        width: 89px;
        height: 30px;
        border-radius: 4px;
        font-family: SourceHanSansCN-Heavy;
        font-size: 12px;
        font-weight: normal;
        color: #29ba9c;
        padding: 0px 0px;
        border: solid 1px #29ba9c;
        margin-right: 20px;
        margin-left: -45px;
    }

    /* 隐藏折叠功能 */
    .table_p .el-table__expand-column .cell {
        display: none;
    }

    .tableBox.noborder .expanded td {
        border: none;
    }

    .operation {
        width: 70px;
        height: 30px;
        border-radius: 4px;
        margin-bottom: 5px;
        border: solid 1px #a2a2a2;
    }

    .el-table__expanded-cell[class*=cell] {
        padding: 12px 50px;
    }

    .fixed {
        margin-left: -10px;
    }

    /* 链接列表 */
    .linkList {
        height: 30px;
        line-height: 30px;
    }
</style>
<div class="all">
    <div id="app" v-cloak>
        <div class="total-head">
            <div class="vue-title">
                <div class="vue-title-left"></div>
                <div class="vue-title-content">会员查询</div>
                <div>
                    <el-link href="{{yzWebUrl('member.member.add-member')}}" :underline="false" class="excelUp" style="width:125px;margin-right:10px;"><i class="el-icon-plus"></i> 添加会员</el-link>
                    <el-link href="{{yzWebUrl('member.member.import')}}" :underline="false" class="excelUp">会员EXCEL导入
                    </el-link>
                </div>
            </div>
            <!-- 搜索列表 -->
            <div class="inputs">
                <el-input clearable class="input-w input_1" v-model="search.mid" placeholder="会员ID"></el-input>
                <el-input clearable class="input-w input_2" placeholder="可搜索昵称/姓名/手机号" v-model="search.realname">
                    <el-select style="width:100px;" v-model="search.name_type" clearable slot="append">
                        <el-option v-for="(item,i) in petOption" :key="i" :label="item.name" :value="item.value"></el-option>
                    </el-select>
                </el-input>
                <el-input class="input-w input_1" clearable class="input-w" v-model="search.first_count" placeholder="一级人数">
                </el-input>
                <el-input class="input-w input_1" clearable class="input-w" v-model="search.second_count" placeholder="二级人数">
                </el-input>
                <el-input class="input-w input_1" clearable class="input-w" v-model="search.team_count" placeholder="团队人数"></el-input>
                <el-input class="input-w input_1" clearable class="input-w" v-model="search.custom_value" placeholder="自定义字段">
                </el-input>
                <el-select clearable class="input-w input_3" v-model="search.level" filterable placeholder="会员等级不限">
                    <el-option :label="setLevel_name" :value="0"></el-option>
                    <el-option v-for="(item,i) in levelOption" :key="i" :label="item.level_name" :value="item.id">
                    </el-option>
                </el-select>
                <el-select clearable class="input-w input_3" v-model="search.groupid" filterable placeholder="会员分组不限">
                    <el-option v-for="(item,i) in groupOption" :key="i" :label="item.group_name" :value="item.id">
                    </el-option>
                </el-select>
                <el-select clearable class="input-w input_3" v-model="search.isagent" filterable placeholder="推广员不限">
                    <el-option v-for="(item,i) in agentOption" :key="i" :label="item.label" :value="item.value">
                    </el-option>
                </el-select>
                <el-select clearable class="input-w input_3" v-model="search.followed" filterable placeholder="不限关注">
                    <el-option v-for="(item,i) in attentionOption" :key="i" :label="item.label" :value="item.value">
                    </el-option>
                </el-select>
                <el-select clearable class="input-w input_3" v-model="search.isblack" clearable filterable placeholder="不限黑名单">
                    <el-option v-for="(item,i) in blacklistOption" :key="i" :label="item.label" :value="item.value">
                    </el-option>
                </el-select>
                <el-date-picker class="input_4" style="width: 437px; margin-right:20px" value-format="timestamp"  type="datetimerange" v-model="search.time" align="right" unlink-panels range-separator="至" start-placeholder="开始日期" end-placeholder="结束日期" :picker-options="pickerOptions">
                </el-date-picker>
                <el-button class="input_5" @click="searchBtn" type="primary" @keyup.enter="searchBtn">
                    搜索</el-button>
                <el-button class="input_6" @click="deriveEvent">导出EXCEL</el-button>
            </div>
        </div>
        <div class="total-floo" style="padding-bottom:50px;overflow-x: scroll;">
            <!-- 统计总数 -->
            <div class="vue-title">
                <div class="vue-title-left"></div>
                <div class="vue-title-content" style="flex:none;width:60px;">会员列表</div>
                <span :class="{titleE :index!==0 }" v-if="is_customer(index)" @click="titleEvent(index)" class="spanClass" v-for="(item,index) in allList" :key="item.id">[[item.title]]: &nbsp
                    [[item.num]]， </span>
            </div>
            <div class="main">
                <!-- 会员列表 -->
                <el-table class="table_p tableBox" :class="[tage==1?'noborder':'']" :default-expand-all="isExpand" :data="itemList" style="width: 100%">
                    <el-table-column label="会员ID" width="100px">
                        <template slot-scope="scope">
                            <p class="p-text" style="text-align:left">[[ scope.row.uid ]]</p>
                        </template>
                    </el-table-column>
                    <el-table-column label="推荐人" min-width="100px" align="center">
                        <template slot-scope="scope">
                            <div v-if="scope.row.yz_member==null  || scope.row.yz_member.parent_id==0" class="p-text">
                                <p class="keep keep_0">总店</p>
                            </div>
                            <div v-else class="p-text" style="overflow: hidden;">
                                <el-tooltip class="item" effect="light" placement="bottom">
                                <div slot="content">ID:[[scope.row.yz_member !== null ? scope.row.yz_member.agent !== null ? scope.row.yz_member.agent.uid : '' : '']]</div>
                                <p v-if="scope.row.yz_member !== null && scope.row.yz_member.agent !== null && scope.row.yz_member.agent.avatar !== null">
                                    <img style="width:37px;height:37px;border-radius: 50%;margin-right:5px;" :src="scope.row.yz_member.agent.avatar" alt="">
                                </p>
                                </el-tooltip>
                                <p v-if="scope.row.yz_member !== null && scope.row.yz_member.agent!==null  && scope.row.yz_member.agent.nickname"><span v-if="scope.row.yz_member !== null  &&  scope.row.yz_member.inviter == 0">(暂定)</span>[[scope.row.yz_member.agent.nickname]]</p>
                                <p v-else>未更新</p>
                            </div>
                        </template>
                    </el-table-column>
                    <el-table-column label="粉丝">
                        <template slot-scope="scope">
                            <div class="p-text" style="padding-left: 6px;">
                                <p v-if="scope.row.avatar!==null"><img style="width:37px;height:37px;border-radius: 50%;margin-right:5px;" :src="scope.row.avatar" alt=""></p>
                                <p v-if="scope.row.fans_item">[[ scope.row.fans_item]]</p>
                                <p v-else>未更新</p>
                            </div>
                        </template>
                    </el-table-column>
                    <el-table-column label="姓名/手机号">
                        <template slot-scope="scope">
                            <p class="p-text">[[scope.row.realname]]</p>
                            <p class="p-text">[[scope.row.mobile]]</p>
                        </template>
                    </el-table-column>
                    <el-table-column label="等级/分组">
                        <template slot-scope="scope">
                            <p class="p-text">[[ scope.row.yz_member | levelName ]]</p>
                            <p class="p-text">[[ scope.row.yz_member | levelgroup]]</p>
                        </template>
                    </el-table-column>

                    <el-table-column label="注册时间" width="100px">
                        <template slot-scope="scope">
                            <p class="p-text">[[ scope.row.createtime]]</p>
                        </template>
                    </el-table-column>

                    <el-table-column width="150" label="积分/余额">
                        <template slot-scope="scope">
                            <div class="tag_box">
                                <div>
                                    <el-tag class="tag_all tag_13c7a7" effect="dark">
                                        积分：[[scope.row.credit1]]</el-tag>
                                </div>
                                <div>
                                    <el-tag class="tag_all tag_ffb025" effect="dark">
                                        余额：[[scope.row.credit2]]</el-tag>
                                </div>
                            </div>
                        </template>
                    </el-table-column>
                    <el-table-column width="150" label="已完成订单">
                        <template slot-scope="scope">
                            <div class="tag_box">
                                <div>
                                    <el-tag class="tag_all tag_13c7a7" effect="dark">订单：[[scope.row.has_one_order | total]]
                                    </el-tag>
                                </div>
                                <div>
                                    <el-tag class="tag_all tag_ffb025" effect="dark">
                                        金额：[[scope.row.has_one_order | sum]]</el-tag>
                                </div>
                            </div>
                        </template>
                    </el-table-column>

                    <el-table-column label="类型">
                        <template slot-scope="scope">
                            <!-- 图标类型显示 -->
                            <div style="height:40px;line-height:40px;">
                                <i class="iconfont icon_size" :class="openid(0,scope.row.has_one_fans)" :title="title(scope.row.has_one_fans)"></i>
                                <i class="iconfont icon_size" :class="openid(1,scope.row.has_one_mini_app)" title="小程序"></i>
                                <i class="iconfont icon_size" :class="openid(2,scope.row.has_one_wechat)" title="APP"></i>
                                <i class="iconfont icon_size" :class="openid(3,scope.row.has_one_unique)" title="微信开放平台"></i>
                                <i class="iconfont icon_size" :class="openid(4,scope.row.has_one_alipay)" title="支付宝"></i>
                                <i class="iconfont icon_size" :class="openid(5,scope.row.has_one_douyin)" title="抖音"></i>
                                <i class="iconfont icon_size" :class="openid(6,scope.row.has_one_customers)" title="企业微信"></i>
                                <i class="iconfont icon_size" :class="openid(7,scope.row.has_one_aggregation_cps_member)" title="聚合cps App"></i>
                            </div>
                        </template>
                    </el-table-column>
                    <!-- 气泡框显示 -->
                    <el-table-column label="操作">
                        <!-- 气泡框模块 -->
                        <template slot-scope="scope">
                            <!-- 气泡列表 -->
                            <el-popover placement="bottom" width="150" trigger="click">
                                <!-- 链接列表 -->
                                <el-link v-if="isBlack(i,scope.row)" class="linkList" v-for="(item,i) in linkData" :key="i" :href="item.link+scope.row.uid" :underline="false"><i :class="item.class"></i> [[item.title]]
                                </el-link>
                                <el-button slot="reference" size="mini" class="operation">操作
                                </el-button>
                            </el-popover>
                            <el-button v-if="scope.row.yz_member.is_old==1" slot="reference" size="mini" type="danger" style="border: none;" class="operation" @click="memberMerge(scope.row)">合并</el-button>
                        </template>
                    </el-table-column>
                    <!-- 标签类 -->
                    <el-table-column type="expand" v-if="tage==1">
                        <template slot-scope="scope">
                            <el-button class="addTag" @click.stop="openDialog(scope.row)">
                                <i class="el-icon-plus"></i> 添加标签
                            </el-button>
                            <span v-if="scope.row.has_many_tag" v-for="(item,index) in scope.row.has_many_tag">
                                <el-tag v-if="item.tag != null" :style="{color: item.tag.color,borderColor: item.tag.color}" effect="plain" style="margin-right:10px; margin-bottom:10px; cursor: pointer;user-select: none;" @close="handleCloseTag(scope.row.uid,item.tag_id)" @click="handEventTag(item.tag_id)" :key="index">[[item.tag.title]]</el-tag>
                            </span>
                        </template>
                    </el-table-column>
                </el-table>
            </div>
            <el-dialog
                title="合并提示" custom-class="member-merge"
                :visible.sync="showMemberMerge"
                width="30%"
                center>
                <div style="font-size: 18px;line-height:1.5;">
                    <p>该过程不可逆，点击合并后，该会员其他登录凭证（会员ID【[[currentMember.mark_member_id]]】）将会合并到会员ID【[[currentMember.uid]]】上，其他会员ID上的订单、余额、积分、佣金、下线等数据将不会被合并，并无法再次访问！</p>
                    <p style="color: #EE3939;">点击确定合并代表您已熟知上述风险，执行会员合并，并且自行承担责任！</p>
                </div>
                <span slot="footer" class="dialog-footer">
                    <el-button @click="showMemberMerge = false">取消合并</el-button>
                    <el-button type="primary" @click="sureMemberMerge">确定合并</el-button>
                </span>
            </el-dialog>

            <!-- 会话框 -->
            <el-dialog title="选择标签" :visible.sync="dialogVisible" width="55%" :before-close="handleClose">
                <el-table ref="singleTable" :data="tagData" height="500">
                    <el-table-column label="ID">
                        <template slot-scope="scope">
                            <div>[[ scope.row.id ]]</div>
                        </template>
                    </el-table-column>
                    <el-table-column label="标签名字">
                        <template slot-scope="scope">
                            <div>[[ scope.row.title]]</div>
                        </template>
                    </el-table-column>
                    <el-table-column label="操作">
                        <template slot-scope="scope">
                            <el-button size="mini" @click="makeMemberTags(scope.row)">选择</el-button>
                        </template>
                    </el-table-column>
                </el-table>
                <div slot="footer" class="dialog-footer">
                    <el-button @click="dialogVisible = false">取 消</el-button>
                </div>
            </el-dialog>
            <div v-if="itemList.length!==0 && itemList!==null" class="fixed total-floo">
                <div class="fixed_box">
                    <el-pagination layout="prev, pager, next,jumper" background style="text-align:right" :page-size="pagesize" :current-page="currentPage" :total="total" @current-change="handleCurrentChange">
                    </el-pagination>
                </div>
            </div>
        </div>
    </div>

    @include("finance.balance.verifyPopupComponent")

    <script>
        var vm = new Vue({
            el: '#app',
            // 防止后端冲突,修改ma语法符号
            delimiters: ['[[', ']]'],
            data() {
                return {
                    pickerOptions: {
                        shortcuts: [{
                            text: '最近一周',
                            onClick(picker) {
                                const end = new Date();
                                const start = new Date();
                                start.setTime(start.getTime() - 3600 * 1000 * 24 * 7);
                                picker.$emit('pick', [start, end]);
                            }
                        }, {
                            text: '最近一个月',
                            onClick(picker) {
                                const end = new Date();
                                const start = new Date();
                                start.setTime(start.getTime() - 3600 * 1000 * 24 * 30);
                                picker.$emit('pick', [start, end]);
                            }
                        }, {
                            text: '最近三个月',
                            onClick(picker) {
                                const end = new Date();
                                const start = new Date();
                                start.setTime(start.getTime() - 3600 * 1000 * 24 * 90);
                                picker.$emit('pick', [start, end]);
                            }
                        }]
                    },
                    showMemberMerge: false,
                    currentMember: {},
                    //搜索会员数据源
                    search: {
                        mid: '',
                        realname: '',
                        first_count: '',
                        second_count: '',
                        team_count: '',
                        custom_value: '',
                        level: '',
                        groupid: '',
                        isagent: '',
                        followed: '',
                        isblack: '',
                        searchtime: '',
                        time: '',
                        name_type: 0
                    },
                    tagList: [],
                    //开始时间
                    starttime: null,
                    //结束时间
                    endtime: null,
                    //页码数
                    currentPage: 1,
                    //一页显示数据
                    pagesize: 1,
                    //总页数
                    total: 1,
                    dialogVisible: false,
                    // 下拉集合的数据源
                    petOption: [{
                        value: 0,
                        name: '昵称'
                    }, {
                        value: 1,
                        name: '姓名'
                    }, {
                        value: 2,
                        name: '手机号'
                    }],
                    //等级搜索列
                    levelOption: [],
                    //分组搜索列
                    groupOption: [],
                    //是否推广员
                    agentOption: [{
                        value: '0',
                        label: '否'
                    }, {
                        value: '1',
                        label: '是'
                    }],
                    //是否已关注
                    attentionOption: [{
                        value: '1',
                        label: '已关注'
                    }, {
                        value: '0',
                        label: '未关注'
                    }],
                    //是否是黑名单
                    blacklistOption: [{
                        value: '0',
                        label: '否'
                    }, {
                        value: '1',
                        label: '是'
                    }],
                    allList: [{
                            id: 1,
                            title: '总数',
                            num: 8,
                        },
                        {
                            id: 2,
                            title: '微信公众号会员',
                            num: '---',
                        },
                        {
                            id: 3,
                            title: '微信小程序会员',
                            num: '---',
                        },
                        {
                            id: 4,
                            title: 'APP会员',
                            num: '---',
                        },
                        {
                            id: 5,
                            title: '微信开放平台会员',
                            num: '---',
                        },
                        {
                            id: 6,
                            title: '手机号绑定会员',
                            num: '---',
                        },
                        {
                            id: 7,
                            title: '企业微信会员',
                            num: '---',
                        }
                    ],
                    tableData: [],
                    tagData: [],
                    tagId: '',
                    itemList: [],
                    sumTit: "---",
                    isExpand: true,
                    isIdentification: 0,
                    groupid: "",
                    tage: 0,
                    setLevel_name: "普通会员",
                    is_customers: 0,
                    tag_id: "", //保存标签id
                    //列表跳转链接
                    linkData: [{
                            link: "{!! yzWebUrl('member.member.detail') !!}&id=",
                            class: "fa fa-edit",
                            title: "会员详情"
                        },
                        {
                            link: "{!! yzWebUrl('member.member-income.index') !!}&id=",
                            class: "fa fa-edit",
                            title: "收入详情"
                        },
                        {
                            link: "{!! yzWebUrl('order.order-list.index') !!}&member_id=",
                            class: "fa fa-list",
                            title: "会员订单"
                        },
                        {
                            link: "{!! yzWebUrl('point.recharge.index') !!}&id=",
                            class: "fa fa-credit-card",
                            title: "充值积分"
                        },
                        {
                            link: "{!! yzWebUrl('balance.recharge.index') !!}&member_id=",
                            class: "fa fa-money",
                            title: "充值余额"
                        },
                        {
                            link: "{!! yzWebUrl('password.page.index') !!}&member_id=",
                            class: "fa fa-money",
                            title: "支付密码"
                        },
                        {
                            link: "{!! yzWebUrl('member.member.agent-old') !!}&id=",
                            class: "fa fa-exchange",
                            title: "直推客户"
                        },
                        {
                            link: "{!! yzWebUrl('member.member.agent') !!}&id=",
                            class: "fa fa-exchange",
                            title: "团队客户"
                        },
                        {
                            link: "{!! yzWebUrl('member.member.agent-parent') !!}&id=",
                            class: "fa fa-exchange",
                            title: "上级会员"
                        },
                        {
                            link: "{!! yzWebUrl('member.member.black') !!}&black=0&id=",
                            class: "fa fa-minus-circle",
                            title: "取消黑名单"
                        },
                        {
                            link: "{!! yzWebUrl('member.member.black') !!}&black=1&id=",
                            class: "fa fa-minus-circle",
                            title: "设置黑名单"
                        },
                        {
                            link: "{!! yzWebUrl('member.member-address.index') !!}&id=",
                            class: "fa fa-truck",
                            title: "收货地址管理"
                        },
                        {
                            link: "{!! yzWebUrl('member.bank-card.index') !!}&id=",
                            class: "fa fa-truck",
                            title: "银行卡管理"
                        },
                    ]
                }
            },
            //定义全局的方法
            beforeCreate() {
                that = this
            },
            created() {
                g = this;
                //全局监听deriveEvent enter事件
                document.onkeydown = (e) => {
                    let key = window.event.keyCode;
                    if (key == 13) {
                        g.searchBtn();
                    }
                }

                tag_id = {{ request()->tag_id ?: 0 }};
                if (tag_id){
                    this.tag_id = tag_id;
                }
                // //查找分组id
                // let id = this.indexId('groupid');
                // if (id) {
                //     this.$set(this, "groupid", id);
                //     this.postYzWebFullUrl(1, "", this.groupid);
                // } else {
                //     this.postYzWebFullUrl(1);
                // }
                // this.postYzWebGroups();
            },
            mounted() {
                //查找分组id
                let id = this.indexId('groupid');
                if (id) {
                    this.$set(this, "groupid", id);
                    this.postYzWebFullUrl(1, "", this.groupid);
                } else {
                    this.postYzWebFullUrl(1, this.getParam('tag_id'));
                }
                this.postYzWebGroups();
            },
            watch: {
                "tagData": {
                    handler() {
                        if (this.$refs.singleTable) {
                            this.$nextTick(() => {
                                this.$refs.singleTable.doLayout(); // 解决表格错位
                            })
                        }
                    },
                    deep: true,
                    immediate: true
                }
            },
            filters: {
                //判断等级是否存在
                levelName(name) {
                    return name.level && name.level !== null ? name.level.level_name : that.setLevel_name
                },
                //判断分组是否存在
                levelgroup(group) {
                    // console.log(group);
                    if (group.group && group.group !== null) {
                        return group.group.group_name
                    } else {
                        return "无分组"
                    }
                },
                //订单
                total(val) {
                    return val == null ? 0 : val.total
                },
                //金额
                sum(val) {
                    return val == null ? 0 : val.sum
                },
            },
            computed: {
                // 判断开启企业微信
                is_customer() {
                    return (i) => {
                        if (i == 6) {
                            return this.is_customers == 0 ? false : true
                        } else {
                            return true;
                        }
                    }
                },
                title() {
                    return (title) => {
                        if (title !== null && title.followed == 1) {
                            return "已关注"
                        } else if (title !== null && title.followed == 0) {
                            return "未关注"
                        } else {
                            return ""
                        }
                    }
                },
                //图标
                openid() {
                    return (id, val) => {
                        // console.log(item);
                        //关注
                        if (id == 0) {
                            if (val && val !== null && val.followed == 1) {
                                return "icon-all_wechat_public wechat_public_already"
                            } else if (val && val !== null && val.followed == 0) {
                                return "icon-all_wechat_public wechat_public_not"
                            } else {
                                return ""
                            }
                        }
                        //小程序
                        if (id == 1) {
                            return val && val !== null ? "icon-all_smallprogram smallprogram" : ""
                        }
                        //APP
                        if (id == 2) {
                            return val && val !== null ? "icon-all_app all_app" : ""
                        }
                        /* 微信开放平台 */
                        if (id == 3) {
                            return val && val !== null ? "icon-all_wechat all_wechat" : ""
                        }
                        /* 支付宝 */
                        if (id == 4) {
                            return val && val !== null ? "icon-all_alipay all_alipay" : ""
                        }
                        /* 抖音 */
                        if (id == 5) {
                            return val && val !== null ? "icon-all_trill all_tril" : ""
                        }
                        /* 企业微信 */
                        if (id == 6) {
                            return val && val !== null ? "icon-qiyeweixin01 qiyeweixin01" : ""
                        }
                        // 聚合cps App
                        if(id == 7) {
                            return val && val !== null ? "icon-all_appshouji all_appshouji" : ""
                        }
                    }
                },
                //黑名单
                isBlack() {
                    return (i, row) => {
                        //取消黑名单
                        if (i == 9) return row.yz_member.is_black == 1;
                        //设置黑名单
                        if (i == 10) return row.yz_member.is_black !== 1;
                        return true
                    }
                }
            },
            methods: {
                // 获取会员标签的id
                getParam(name) {
                    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
                    var r = window.location.search.substr(1).match(reg);
                    if (r != null) return unescape(r[2]);
                    return null;
                },
                //数据类
                //0.请求搜索列表数据
                postYzWebGroups() {
                    this.$http.post("{!! yzWebFullUrl('member.member.get-sub-groups') !!}", {}).then(res => {
                        let {
                            groups,
                            levels
                        } = res.body.data;
                        //等级搜索列
                        // console.log(levels);
                        this.levelOption = levels !== null ? levels : [];
                        //分组搜索列
                        this.groupOption = groups !== null ? groups : [];
                        // console.log(groups);
                    })
                },
                //1.请求列表数据
                postYzWebFullUrl(page, tag_id, groupid) {
                    // console.log(groupid, 455646);
                    this.tag_id = tag_id ? tag_id : 0;
                    let loading = this.$loading({
                                        lock: true,
                                        text: 'Loading',
                                        spinner: 'el-icon-loading',
                                        background: 'rgba(0, 0, 0, 0.7)'
                                    });
                    const SEARCH = this.search;
                    this.$http.post("{!! yzWebFullUrl('member.member.show') !!}", {
                        page: page,
                        tag_id:this.tag_id,
                        search: {
                            mid: SEARCH.mid,
                            name_type: SEARCH.name_type,
                            realname: SEARCH.realname,
                            first_count: SEARCH.first_count,
                            second_count: SEARCH.second_count,
                            team_count: SEARCH.team_count,
                            custom_value: SEARCH.custom_value,
                            level: SEARCH.level,
                            groupid: SEARCH.groupid || groupid,
                            isagent: SEARCH.isagent,
                            followed: SEARCH.followed,
                            isblack: SEARCH.isblack,
                            // searchtime: SEARCH.searchtime,
                            times: {
                                start: this.starttime !== null ? this.starttime : "",
                                end: this.endtime !== null ? this.endtime : ""
                            }
                        }
                    }).then(response => {
                        if (response.data.result === 1) {
                            let {
                                ret,
                                groups,
                                levels,
                                list,
                                rest
                            } = response.body.data
                            let {
                                total: sum,
                                is_customers,
                                is_member_tags,
                                set
                            } = rest
                            if (rest !== null && JSON.stringify(rest) !== "{}") {
                                //判断企业微信会员插件是否开启
                                this.is_customers = is_customers;
                                // 插件开启显示
                                this.tage = is_member_tags;
                                this.allList[0].num = sum;
                                this.setLevel_name = rest.set;
                            }

                            let {
                                data,
                                from,
                                total,
                                per_page,
                                current_page,
                            } = list
                            if (list !== null && JSON.stringify(list) !== "{}") {
                                //总页数
                                this.total = total;
                                //一页显示条数
                                this.pagesize = per_page
                                //当前页码
                                this.currentPage = current_page
                                //列表数据
                                this.itemList = data !== null ? data : [];
                            }
                            setTimeout(() => {
                                loading.close();
                            }, 500)
                        } else {
                            loading.close();
                            this.$message.error("请求失败");
                        }
                    })
                },
                //2.点击获取统计数据
                titleEvent(index) {
                    if (index === 0) {
                        return
                    }
                    this.postDateList(index)
                },
                //3.请求标签的列表数据
                handleTagsList() {
                    this.$http.post("{!!yzWebFullUrl('plugin.member-tags.Backend.controllers.tag.handleTagsList')!!}", {}).then(res => {
                        let {
                            list
                        } = res.body.data;
                        this.tagData = list;
                    })
                },
                //4.各软件统计总会员数数据
                postDateList(i) {
                    this.$http.post("{!!yzWebFullUrl('member.member.member-chart')!!}", {
                        chart_type: i
                    }).then(res => {
                        let {
                            count
                        } = res.body.data
                        //改变总数
                        this.allList[i].num = count;
                    })
                },
                //功能类
                memberMerge(row) {
                    console.log(row)
                    this.showMemberMerge = true;
                    this.currentMember = row;
                },
                sureMemberMerge() {
                    this.$http.post("{!!yzWebFullUrl('member.member.memberMerge')!!}", {
                        uid: this.currentMember.uid
                    }).then(res => {
                        if(res.data.result == 1){
                            this.$message.success(res.data.msg);
                            this.showMemberMerge = false;
                            //重新请求列表数据
                            this.postYzWebFullUrl(this.currentPage)
                        }else {
                            this.$message.error(res.data.msg);
                        }
                    })
                },
                //1.标签点击搜索
                handEventTag(tag_id) {
                    this.tag_id = tag_id
                    //记录进入标签搜索标识符
                    this.isIdentification = 1;
                    this.postYzWebFullUrl(1, tag_id);
                },
                //2.点击请求当前点击的标签的列表
                openDialog(row) {
                    //当前会员的id
                    this.tagId = row.uid
                    //打开回话框
                    this.dialogVisible = true
                    //请求标签列表
                    this.handleTagsList();
                },
                //3.删除会员标签校验
                handleCloseTag(member_id, tag_id) {
                    this.$confirm('是否需要删除?', '提示').then(() => {
                        this.$http.post("{!!yzWebFullUrl('plugin.member-tags.Backend.controllers.tag.delMemberTags')!!}", {
                            member_id,
                            tag_id,
                            member_tag_id:'-1'
                        }).then(res => {
                            if (res.data.result == 1) {
                                this.$message.success("删除" + res.data.msg);
                                //重新获取数据
                                if (this.isIdentification == 0) {
                                    this.postYzWebFullUrl(1);
                                } else {
                                    this.postYzWebFullUrl(this.currentPage, tag_id);
                                }
                            } else {
                                this.$message.error("删除" + res.data.msg);
                            }
                        })
                    }).catch(() => {});
                },
                //4.添加标签数据
                makeMemberTags(row) {
                    this.$http.post("{!!yzWebFullUrl('plugin.member-tags.Backend.controllers.tag.makeMemberTags')!!}", {
                        tag_id: row.id,
                        member_id: this.tagId
                    }).then(res => {
                        if (res.data.result == 1) {
                            this.$message.success("标签添加" + res.data.msg);
                            //重新获取数据
                            this.postYzWebFullUrl(this.currentPage);
                            //关闭回话框
                            this.dialogVisible = false;
                        } else {
                            this.$message.error("标签添加" + res.data.msg + "已存在!" + "请勿重新添加");
                        }
                    })
                },
                //5.选择完标签关闭弹窗
                handleClose() {
                    this.dialogVisible = false
                },
                //6.分页点击切换下一页数据
                handleCurrentChange(val) {
                    //切换下一页数据
                    this.tag_id ? this.postYzWebFullUrl(val, this.tag_id) : this.postYzWebFullUrl(val)
                },
                //7.点击搜索
                searchBtn() {
                    if (!this.search.time) {
                        this.search.time = [];
                    }
                    this.starttime = parseInt(this.search.time[0] / 1000);
                    this.endtime = parseInt(this.search.time[1] / 1000);
                    //重新请求列表数据
                    this.postYzWebFullUrl(1)
                },
                //8.导出文件
                deriveEvent() {
                    let isSubmied = false;
                    if (verifyed && (expireTime === 0 || expireTime * 1000 < Date.now())) {
                        showGetVerifyCodePopup();
                        return false;
                    }
                    if (isSubmied) {
                        return false;
                    } else {
                        isSubmied = true;
                    }

                    let SEARCH = this.search;
                    let start = this.starttime && !isNaN(this.starttime) ? parseInt(this.starttime) : "";
                    let end = this.endtime && !isNaN(this.endtime) ? parseInt(this.endtime) : "";
                    
                    //不能换行
                    let url = `{!! yzWebFullUrl('member.member.export') !!}&search[mid]=` + SEARCH.mid + '&search[name_type]=' + SEARCH.name_type + '&search[realname]=' + SEARCH.realname + '&search[first_count]=' + SEARCH.first_count + '&search[second_count]=' + SEARCH.second_count + '&search[team_count]=' + SEARCH.team_count + '&search[custom_value]=' + SEARCH.custom_value + '&search[level]=' + SEARCH.level + '&search[groupid]=' + SEARCH.groupid + '&search[isagent]=' + SEARCH.isagent + '&search[followed]=' + SEARCH.followed + '&search[isblack]=' + SEARCH.isblack + '&search[times][start]=' + start + '&search[times][end]=' + end + '&tag_id=' + this.tag_id;
                    window.location.href = url;
                    console.log(url);
                },
                // 工具类
                //1.查找地址栏id
                indexId(variable) {
                    var query = window.location.search.substring(1);
                    var vars = query.split("&");
                    for (var i = 0; i < vars.length; i++) {
                        var pair = vars[i].split("=");
                        if (pair[0] == variable) {
                            return Number(pair[1]);
                        }
                    }
                    return (false);
                },
                //2.时间的转换
                timeDate(date) {
                    let d = new Date(date);
                    let resDate = d.getFullYear() + '-' + (d.getMonth() + 1) + '-' + d.getDate() + ' ' + d.getHours() + ':' + d.getMinutes() + ':' + d.getSeconds();;
                    return resDate;
                }
            }
        })
    </script>
    <script>
    </script>
    @endsection