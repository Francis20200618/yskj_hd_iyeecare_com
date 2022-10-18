define({
  name:"auth",
  template:`
    <div class="auth">
      <el-form ref="auth" :model="json">
      <div class="vue-main-title">
        <div class="vue-main-title-left"></div>
        <div class="vue-main-title-content">权限</div>
      </div>

      <div style="margin:0 auto;width:80%;">        
          <el-form-item label="会员等级浏览权限">
          <div style="display:flex;padding: 12px 0 0 20px;">
                <el-checkbox-group v-model="levelAccessList" class="checkbo-group"  @change="checked => handleCheckedChange(checked,'watch')">
                  <el-checkbox v-for="item in levels" :key="item.id" :label="item.id + ''">{{item.level_name}}</el-checkbox>
                </el-checkbox-group>
          </div>
          </el-form-item>

          <el-form-item label="会员等级购买权限">
          <div style="display:flex;padding: 12px 0 0 20px;">
              <el-checkbox-group v-model="levelBuyList" class="checkbo-group" @change="checked => handleCheckedChange(checked,'buy')">
                <el-checkbox v-for="item in levels" :key="item.id" :label="item.id + ''">{{item.level_name}}</el-checkbox>
              </el-checkbox-group>
          </div>
          </el-form-item>

          
          <el-form-item label="会员组浏览权限">
          <div style="display:flex;padding: 12px 0 0 33px;">
              <el-checkbox-group v-model="vipAccessList" class="checkbo-group" @change="checked => handleCheckedChange(checked,'watches')">
                <el-checkbox v-for="item in groups" :key="item.id" :label="item.id + ''">{{item.group_name}}</el-checkbox>
              </el-checkbox-group>
          </div>
          </el-form-item>

          <el-form-item label="会员组购买权限">
          <div style="display:flex;padding: 12px 0 0 33px;">
              <el-checkbox-group v-model="vipBuyList" class="checkbo-group" @change="checked => handleCheckedChange(checked,'buys')">
                <el-checkbox v-for="item in groups" :key="item.id" :label="item.id + ''">{{item.group_name}}</el-checkbox>
              </el-checkbox-group>
          </div>
          </el-form-item>


        <el-form-item label="每次限购数量">
          <el-input style="width:400px;margin-left:48px;" v-model="json.once_buy_limit" oninput="if(value<0)value=''" type="number"></el-input>
          <div style="margin-left: 145px;" class="form-item_tips">每次下单限购数量</div>
        </el-form-item>

        <el-form-item label="会员限购总数">
          <el-input style="width:400px;margin-left:48px;" v-model="json.total_buy_limit" oninput="if(value<0)value=''" type="number"></el-input>
          <div style="margin-left: 145px;" class="form-item_tips">会员限购的总数</div>
        </el-form-item>

        <el-form-item label="会员每天限购数量">
          <el-input style="width:400px;margin-left:20px;" v-model="json.day_buy_limit" oninput="if(value<0)value=''" type="number"></el-input>
          <div style="margin-left: 145px;" class="form-item_tips">会员每天限购数量</div>
        </el-form-item>

        <el-form-item label="会员每周限购数量">
          <el-input style="width:400px;margin-left:20px;" v-model="json.week_buy_limit" oninput="if(value<0)value=''" type="number"></el-input>
          <div style="margin-left: 145px;" class="form-item_tips">会员每周限购数量</div>
        </el-form-item>

        <el-form-item label="会员每月限购数量">
          <el-input style="width:400px;margin-left:20px;" v-model="json.month_buy_limit" oninput="if(value<0)value=''" type="number"></el-input>
          <div style="margin-left: 145px;" class="form-item_tips">会员每月限购数量</div>
        </el-form-item>

        <el-form-item label="会员起购数量">
          <el-input style="width:400px;margin-left:48px;" v-model="json.min_buy_limit" oninput="if(value<0)value=''" type="number"></el-input>
          <div style="margin-left: 145px;" class="form-item_tips">会员单次最少购买数量，为空、0不限制</div>
        </el-form-item>
        
         <el-form-item label="商品每日限购总量">
          <el-input style="width:400px;margin-left:15px;" v-model="json.day_buy_total_limit" oninput="if(value<0)value=''" type="number"></el-input>
          <div style="margin-left: 145px;" class="form-item_tips">如设置为1，则今日售出1件(需已支付),会员今天无法再购买此商品</div>
        </el-form-item>

      </div>
    </el-form>
    </div>
  `,
  style:`
  .auth .checkbo-group {
    display: flex;
    flex-flow: wrap;
    white-space: pre-wrap;
  }
  .auth .checkbo-group .el-checkbox {
    line-height: 25px;
  }
  `,
  props: {
    form: {
      default() {
        return {}
      }
    }
  },
  data(){
    // let intReg = /^[0-9]*$/;
    // let validateNum = (rule,value, callback) => {
    //   let regular = intReg.test(value);
    //   if(!value){
    //      callback();
    //   }else{
    //     if (regular) {
    //       callback();
    //     }else{
    //       callback(new Error("请输入正整数"));
    //     }
    //   }
    // };
    return {
      levelAccessList:[],//会员等级浏览权限
      levelBuyList:[],//会员等级购买权限
      vipAccessList:[],//会员组浏览权限
      vipBuyList:[],//会员组购买权限
      levels: [],
      groups: [],
      json: {
        show_levels: '',
        show_groups: '',
        buy_levels: '',
        buy_groups: '',
        once_buy_limit: '',
        total_buy_limit: '',
        day_buy_limit: '',
        week_buy_limit: '',
        month_buy_limit: '',
        min_buy_limit: '',
        day_buy_total_limit:'',
      },
      // rules:{
      //   once_buy_limit: {validator: validateNum },
      //   total_buy_limit: {validator: validateNum },
      //   day_buy_limit: {validator: validateNum },
      //   week_buy_limit: {validator: validateNum },
      //   month_buy_limit: {validator: validateNum },
      //   min_buy_limit: {validator: validateNum },
      // },
    }
  },
  mounted(){
    if (this.form && this.form.privilege) {
      let data = this.form.privilege;  
      this.json = this.pick(data, [
        "show_levels",
        "show_groups",
        "buy_levels",
        "buy_groups",
        'once_buy_limit',
        'total_buy_limit',
        'day_buy_limit',
        'week_buy_limit',
        'month_buy_limit',
        'min_buy_limit',
        'day_buy_total_limit',
      ]);
      this.levelAccessList = data.show_levels ? data.show_levels.split(",") : [''];
      this.vipAccessList = data.show_groups ? data.show_groups.split(",") : [''];
      this.levelBuyList = data.buy_levels ? data.buy_levels.split(",") : [''];
      this.vipBuyList = data.buy_groups ? data.buy_groups.split(",") : [''];
    }
    this.levels = this.form.levels ? JSON.parse(JSON.stringify(this.form.levels)) : [];
    this.groups = this.form.groups ? JSON.parse(JSON.stringify(this.form.groups)) : [];
  },
  methods:{
    pick(obj, params) {
      return params.reduce((iter, val) => (val in obj && (iter[val] = obj[val]?obj[val]:''), iter), {});
    },
    async validate(){
      return this.json;
    },
    handleCheckedChange(checked,type) {
      console.log(checked);
      let isCheckAll = false;
      let checkAll = [];
      checked.forEach((item, index) => {
        if (item === '' && checked.length > 1) {
          if (index !== 0) {
            isCheckAll = true;
            checkAll = [''];
          }
        } else {
          checkAll.push(item);
        }
      });
      let levelStr = isCheckAll ? '' : checkAll.join(',');
      if(type == 'watch') {
        this.json.show_levels = levelStr;
        this.levelAccessList = checkAll;
      }
      if(type == 'buy') {
        this.json.buy_levels = levelStr;
        this.levelBuyList = checkAll;
      }
      if(type == 'watches'){
        this.json.show_groups = levelStr;
        this.vipAccessList = checkAll;
      }
      if(type == 'buys'){
        this.json.buy_groups = levelStr;
        this.vipBuyList = checkAll;
      }
    },
  }
})