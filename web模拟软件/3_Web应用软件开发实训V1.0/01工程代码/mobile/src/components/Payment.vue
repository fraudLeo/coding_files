<template>
  <div class="Payment">
    <mHeader>支付</mHeader>
    <van-notice-bar
      :text="'当前购物车:'+count+'件商品,合计金额:'+(cartList.price)/100"
      left-icon="volume-o"
    />
    <div :key="index0" class="cell0" style="margin-top: 20px;text-align: left"
         v-for="(item0,index0) of cartList.orderItemList">
      <div :key="index1" class="cell1" v-for="(item1,index1) of item0.productList">
        <van-cell-group>
          <van-cell :value="item1.name" title="商品名称"/>
          <van-cell :value="(item1.price)/100" title="单价"/>
          <van-cell :value="item0.quantity" title="数量"/>
        </van-cell-group>
      </div>
    </div>
    <div v-for="(item,index) of optionList" style="margin-top: 20px">
      <van-cell :title="item.name" :value="item.columns[item.picked]" @click="item.show=true;optionIndex=index"
                style="text-align: left"/>
      <van-popup
        position="bottom"
        v-model="item.show"
      >
        <van-picker
          :columns="item.columns"
          @cancel="item.show = false"
          @change="optionSelect"
          @confirm="item.show = false"
          show-toolbar
        />
      </van-popup>
    </div>
    <van-button @click="pay" block class="cell" large size="large" square
                style="margin-top: 20px" type="primary">立即支付
    </van-button>
  </div>
</template>

<script>
  import mHeader from './other/header'

  export default {
    name: 'Payment',
    data () {
      return {
        concatList: [],
        cartList: [],
        balance: [],
        count: 0,

        optionIndex: 0,
        optionList: [
          {
            name: '选择联系人',
            show: false,
            columns: [],
            picked: 0,
            value: []
          },
          {name: '付款方式', show: false, columns: ['支付宝', '微信', '电子钱包付款'], picked: 0, value: [0, 1, 2]}
        ],
      }
    },
    props: {},
    methods: {
      optionSelect (picked, value, index) {
        this.optionList[this.optionIndex].picked = index
      },
      pay () {
        if (this.optionList[1].picked == 2)
          if (this.balance.amount >= this.cartList.price / 100)
            this.$form (this.$api.API_URL_ORDER_PAYMENT, {
              id: this.optionList[0].value[this.optionList[0].picked],
              paymentType: this.optionList[1].value[this.optionList[1].picked],
              userId: this.$store.getters.user.id
            }).then (res => {
              if (res.errorCode == 0) {
                this.$dialog.alert ({message: '支付成功！您将进入历史订单'})
                this.$router.replace ('history')
                if (this.optionList[1].value[this.optionList[1].picked] == 2) this.$form (this.$api.API_URL_CUSTOMER_Pay_Order, {
                  amount: -(this.cartList.price / 100),
                  userId: this.$store.getters.user.id
                })
              } else this.$dialog.alert ({message: '网络超时'})
            })
          else this.$dialog.alert ({message: '余额不足'})
        else this.$dialog.alert ({message: '支付成功?'})
      }
    },
    components: {mHeader},
    created () {
      this.$form (this.$api.API_URL_CUSTOMER_Account, {userId: this.$store.getters.user.id}).then (res => {
        this.balance = res.data
      })
      this.$form (this.$api.API_URL_CONTECT, {userId: this.$store.getters.user.id}).then (res => {
        let data = res.data.data
        this.concatList = data
        data.forEach (value => {
          if (value.contactFlag) {
            this.optionList[0].columns.unshift (value.name)
            this.optionList[0].value.unshift (value.id)
          } else {
            this.optionList[0].columns.push (value.name)
            this.optionList[0].value.push (value.id)
          }
        })
      })
      this.$form (this.$api.API_URL_CART, {
        userId: this.$store.getters.user.id,
        type: 1
      }).then (res => {
        let i = 0
        if (res.data) res.data.orderItemList.forEach (value => {
          i += value.quantity
        })
        this.cartList = res.data
        this.count = i
      })
    },
    beforeDestroy () {
    }
  }
</script>

<style scoped lang='stylus'>

</style>
