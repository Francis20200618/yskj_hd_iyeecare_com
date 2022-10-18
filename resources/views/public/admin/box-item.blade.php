<style>
  .vue-title-yz-modular {
    padding: 10px;
    margin: 20px 0;
    background-color: #fff;
    border-radius: 8px;
  }

  .vue-title-yz-box {
    display: flex;
    margin: 5px 0;
    line-height: 32px;
    font-size: 18px;
    color: #333;
    font-weight: 600;
  }

  .vue-title-yz-green {
    width: 4px;
    height: 18px;
    margin-top: 6px;
    background: #29ba9c;
    display: inline-block;
    margin-right: 10px;
  }

  .vue-title-yz-text {
    flex: 1;
    font-size: 14px;
  }

  .vue-title-yz-text span:nth-child(n+2) {
    color: #999;
    margin-left: 20px;
    font-weight: 400;
    font-size: 14px;
  }
</style>

<script>
  Vue.component("box-item", {
    delimiters: ['[[', ']]'],
    props: {
      text: {
        type: String | Array
      }
    },
    template: `<div class="vue-title-yz-modular">
				<div class="vue-title-yz-box" v-if="textList.length>0">
					<div class="vue-title-yz-green"></div>
					<div class="vue-title-yz-text"><span v-for="(text,i) in textList" :key="i">[[text]]</span></div>
          <slot name="btn"></slot>
				</div>
				<slot></slot>
				</div>`,
    computed: {
      textList() {
        if (Array.isArray(this.text)) return this.text;
        else return [this.text];
      }
    }
  })
</script>