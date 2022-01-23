<template>
  <div class="history">
    <mHeader>历史记录</mHeader>
    <van-cell-group style="margin-top: 20px;text-align: left" v-for="(item,index) of list" :key="index">
      <van-cell :value="((item.price)/100)+'.00'" title="订单金额"/>
      <van-cell :value="item.orderNum" title="订单编号"/>
      <van-cell :value="item.createTime" title="订单时间"/>
      <van-cell title="订单状态" v-if="item.status==0|| item.status==null" value="订单编辑中"/>
      <van-cell title="订单状态" tivan-celltle="订单状态" v-if="item.status==1" value="已下单"/>
      <van-cell title="订单状态" v-if="item.status==2" value="配送中"/>
      <van-cell title="订单状态" v-if="item.status==3" value="配送完成"/>
      <van-cell title="订单状态" v-if="item.status==4" value="订单取消"/>
      <van-cell :value="item.contactName" title="联系人"/>
      <van-cell :value="item.contactMobile" title="联系人电话"/>
      <van-cell style="color:rebeccapurple;text-align: center" title="查看订单详细" is-link :to="'/samsara/order/'+item.orderNum"/>
    </van-cell-group>

  </div>

</template>

<script>
  import mHeader from './header'

  export default {
    methods: {
      getOrderList() {
        this.$post(this.$api.API_URL_ORDERS, {
          userId: this.$store.getters.user.id,
          type: 0,
          nowPage: this.page
        }).then(res => {
          if (res.errorCode == 0) {
            this.page++
            this.list=this.list.concat(res.data.orderListData)
          } else this.$dislog.alert({message: '网络超时'})
        })
      }
    },
    created() {
      if (!this.$store.getters.user) this.$router.push({path: '/login'})
      this.getOrderList()
    },
    components: {mHeader},
    data() {
      return {
        list: [],
        page: 1
      }
    }
  }

</script>

<style lang="stylus" scoped>

</style>
