<template>
  <div class="div">
    <mHeader>钱包充值</mHeader>
    <van-notice-bar v-if="balance"
                    :text="'当前电子钱包账户余额为：￥'+balance.amount"
                    left-icon="volume-o"
    />
    <van-cell-group style="margin-top: 20px;text-align: left">
      <van-cell title="电子钱包充值"/>
      <van-field
        label="充值金额"
        placeholder="充值金额"
        required
        type="number"
        v-model="money"
      />
    </van-cell-group>
    <van-button @click="charge" block class="cell" plain size="large" square style="margin-top: 20px"
                type="danger">确认充值
    </van-button>


  </div>
</template>

<script>
  import mHeader from './header'

  export default {
    methods: {
      charge () {
        if (this.money > 0)
          this.$post (this.$api.API_URL_CUSTOMER_Recharge_Account, {
            userId: this.$store.getters.user.id,
            amount: this.money
          }).then (res => {
            if (res.errorCode == 0) {
              this.$dialog.alert ({message: '充值成功'})
              this.getBalance ()
              this.money = 0
            } else this.$dialog.alert ({message: '网络超时！'})
          })
        else this.$dialog.alert ({message: '请输入大于0的值'})
      },
      getBalance () {
        this.$post (this.$api.API_URL_CUSTOMER_Account, {
          userId: this.$store.getters.user.id
        }).then (res => {
          if (res.errorCode == 0) this.balance = res.data
          else this.$dialog.alert ({message: '网络超时！'})
        })
      }
    },
    created () {
      this.getBalance ()

    },
    components: {mHeader},
    data () {
      return {
        balance: null,
        money: 0
      }
    }
  }

</script>

<style lang="stylus" scoped>

</style>
