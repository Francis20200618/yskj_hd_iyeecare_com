define({
  name: "delivery",
  template: `
    <div>
      <el-form label-width="15%" :rules="rules">
        <div id="vue_head">
            <div class="base_set">
                <div class="vue-main-title">
                    <div class="vue-main-title-left"></div>
                    <div class="vue-main-title-content">配送</div>
                </div>
                <div class="vue-main-form">
                    <el-form-item label="运费配置">
                      <el-radio v-model="form.dispatch.dispatch_type" :label="1">统一邮费</el-radio>
                      <el-radio v-model="form.dispatch.dispatch_type" :label="0">运费模板</el-radio>
                    </el-form-item>
                    <el-form-item label=" " prop="dispatchPrice">
                      <div>
                        <el-input v-model="form.dispatch.dispatch_price" style="width:30%;" v-if="form.dispatch.dispatch_type == 1">
                          <template slot="append">元</template>
                        </el-input>
                        <el-select v-model="form.dispatch.dispatch_id" placeholder="请选择运费模板" v-if="form.dispatch.dispatch_type == 0" clearable filterable allow-create default-first-option>
                          <el-option :label="item.dispatch_name" :value="item.id" v-for="(item,index) in form.dispatch_templates" :key="index">{{item.dispatch_name}}</el-option>
                        </el-select>
                      </div>
                    </el-form-item>
                    <el-form-item label="配送方式" v-if="form.dispatchTypesSetting.length > 0">
                      <el-checkbox-group v-model="form.dispatch.dispatch_type_ids">
                        <el-checkbox :label="item.id" :value="item.id" v-for="(item,index) in form.dispatchTypesSetting" :key="index">{{item.name}}</el-checkbox>
                      </el-checkbox-group>
                    </el-form-item>
                </div>
            </div>
        </div>
      </el-form>
    </div>
  `,
  data(){
    let checkout = (rule, value, callback) => {
      let regular = new RegExp(/^[+]{0,1}(\d+)$|^[+]{0,1}(\d+\.\d+)$/)
      let dispatchPrice = regular.test(this.form.dispatch.dispatch_price);
      if(!dispatchPrice){
        callback(new Error('请输入大于0的数'));
        this.yesRegular = false
        return
      }
      this.yesRegular = true
    };
    return {
      freight_list:[{
        id:0,
        name:"默认模板"
      },{
        id:1,
        name:"其他模板"
      }],
      yesRegular:true,
      rules:{
        dispatchPrice:{ validator: checkout},
      },
    }
  },
  mounted() {
    let dispatch_type_ids_list = []
    this.form.dispatch.dispatch_type_ids.forEach(element => {
      dispatch_type_ids_list.push(element * 1)
    });
    if(this.form.dispatch.dispatch_id == null || this.form.dispatch.dispatch_id == 0){
      this.form.dispatch.dispatch_id = ""
    }
    this.form.dispatch.dispatch_type_ids = dispatch_type_ids_list
  },
  methods: {
    extraDate(){
      
    },
    validate(){
      if(!this.yesRegular){
        return false;
      }else{
        return {
          dispatch_type:this.form.dispatch.dispatch_type,
          dispatch_price:this.form.dispatch.dispatch_price ? this.form.dispatch.dispatch_price : "",
          dispatch_type_ids:this.form.dispatch.dispatch_type_ids,
          dispatch_id:this.form.dispatch.dispatch_id
        };
      }
    }
  },
  style: ``,
  props: {
    form: {
      type: Object,
      default() {
        return {}
      }
    }
  }
})