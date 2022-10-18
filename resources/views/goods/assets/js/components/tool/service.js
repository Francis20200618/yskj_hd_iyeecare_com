define({
  name: "service",
  template: `
    <div>
      <el-form ref="form" label-width="15%">
        <div id="vue_head">
            <div class="base_set">
                <div class="vue-main-title">
                    <div class="vue-main-title-left"></div>
                    <div class="vue-main-title-content">服务提供</div>
                </div>
                <div class="vue-main-form">
                    <el-form-item label="是否自动上下架">
                      <el-radio v-model="form.is_automatic" :label="1">是</el-radio>
                      <el-radio v-model="form.is_automatic" :label="0">否</el-radio>
                    </el-form-item>
                    <el-form-item label="上下架时间">
                      <el-date-picker
                          v-model="shelves_time"
                          type="datetimerange"
                          value-format="timestamp"
                          align="right"
                          unlink-panels
                          range-separator="至"
                          start-placeholder="开始日期"
                          end-placeholder="结束日期"
                          :picker-options="pickerOptions">
                      </el-date-picker>
                  </el-form-item>
                </div>
            </div>
        </div>
      </el-form>
    </div>
  `,
  data(){
    return {
      // shelves:"1",
      pickerOptions: {
        shortcuts: [{
          text: "最近一周",
          onClick(picker) {
            const end = new Date();
            const start = new Date();
            start.setTime(start.getTime() - 3600 * 1000 * 24 * 7);
            picker.$emit("pick", [start, end]);
          }
        }, {
          text: "最近一个月",
          onClick(picker) {
            const end = new Date();
            const start = new Date();
            start.setTime(start.getTime() - 3600 * 1000 * 24 * 30);
            picker.$emit("pick", [start, end]);
          }
        }, {
          text: "最近三个月",
          onClick(picker) {
            const end = new Date();
            const start = new Date();
            start.setTime(start.getTime() - 3600 * 1000 * 24 * 90);
            picker.$emit("pick", [start, end]);
          }
        }]
      },
      shelves_time: [],

      widgets:{
        service:{
          is_automatic:"1"
        }
      }
    }
  },
  style: ``,
  mounted() {
    // console.log(this.form,'服务提供')
    this.shelves_time = [this.form.starttime * 1000,this.form.endtime*1000]
  },
  methods:{
    extraDate(){
      
    },
    validate(){
      return {
        starttime:this.shelves_time[0] / 1000,
        endtime:this.shelves_time[1] / 1000,
        is_automatic:this.form.is_automatic,
      }
    }
  },
  props: {
    form: {
      type: Object,
      default() {
        return {}
      }
    }
  }
})