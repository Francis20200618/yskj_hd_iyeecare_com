define({
  name: "discount",
  template: `
    <div>
    <el-form>
      <div class="vue-main-title">
          <div class="vue-main-title-left"></div>
          <div class="vue-main-title-content">折扣</div>
        </div>
        <div style="margin:0 auto;width:80%;">
          <el-form-item label="折扣类型">
            <el-radio v-model="form.level_discount_type" :label="1">{{attr_hide.level_discount_name ? attr_hide.level_discount_name : "会员等级" }}</el-radio>
          </el-form-item>
        </div>
        <div style="margin:0 auto;width:80%;">
          <el-form-item label="折扣方式">
            <el-radio v-if="(hide_discount_method || attr_hide.discount_method == 1)" v-model="form.discount_method" :label="1">折扣</el-radio>
            <el-radio v-if="(hide_discount_method || attr_hide.discount_method == 2)" v-model="form.discount_method" :label="2">固定金额</el-radio>
            <el-radio v-if="(hide_discount_method || attr_hide.discount_method == 3)" v-model="form.discount_method" :label="3">成本比例</el-radio>
          </el-form-item>
          
          <el-form-item  prop="goodsFull" style="margin-left: 68px;" v-for="(item,index) in form.levels" :key="index">
            <el-input  style="width: 300px;" v-model="item.discount_value" >
              <template slot="prepend">{{item.level_name}}</template>
              <template slot="append">{{form.discount_method == 1 ? "折" : form.discount_method == 2 ? "元" : "%" }}</template>
            </el-input>
          </el-form-item>
        </div>
      </el-form>
    </div>
  `,
  style: `
  `,
  props: {
    form: {
      default() {
        return {};
      },
    },
    attr_hide: {
        default() {
            return {}
        }
    },
  },
  data() {
    return {
        hide_discount_method:true,
    };
  },
  mounted () {
      if (this.attr_hide.discount_method) {
          this.form.discount_method = this.attr_hide.discount_method;
          this.hide_discount_method = false;
      }
  },
  methods: {
    validate() {
      let levelsData = JSON.parse(JSON.stringify(this.form.levels));
      discount_value = {}
      levelsData.forEach(item => {
        discount_value[item.level_id] = item.discount_value
      });
      return {
        discount_value,
        level_discount_type:this.form.level_discount_type,
        discount_method:this.form.discount_method
      }
    },
  },
});
