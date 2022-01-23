<template>
  <div>
    <mHeader>订单编号：{{this.$route.params.id}}.00</mHeader>
    <van-cell-group style="margin-top: 20px;text-align: left">
      <van-cell :value="((detail.price)/100)+'.00'" title="订单金额"/>
      <van-cell :value="detail.createTime" title="订单时间"/>
      <van-cell title="订单状态" v-if="detail.status==0|| detail.status==null" value="订单编辑中"/>
      <van-cell title="订单状态" tivan-celltle="订单状态" v-if="detail.status==1" value="已下单"/>
      <van-cell title="订单状态" v-if="detail.status==2" value="配送中"/>
      <van-cell title="订单状态" v-if="detail.status==3" value="配送完成"/>
      <van-cell title="订单状态" v-if="detail.status==4" value="订单取消"/>
      <van-cell :value="detail.contactName" title="联系人"/>
      <van-cell :value="detail.contactMobile" title="联系人电话"/>
      <van-cell :value="detail.contactMobile" title="物流单号"/>
      <van-cell :value="detail.contactMobile" title="物流公司"/>
    </van-cell-group>
    <van-cell-group :key="index0" style="margin-top: 20px;text-align: left"
                    v-for="(item,index0) of detail.orderItemList">
      <div v-for="items of item.productList">
        <van-cell :value="items.name" title="商品名称"/>
        <van-cell :value="'￥'+items.price/100+'.00'" title="单价"/>
      </div>
      <van-cell :value="item.quantity" title="数量"/>
      <van-cell :value="'￥'+item.price/100+'.00'" title="合计金额"/>
    </van-cell-group>
  </div>
</template>

<script>
  import mHeader from './header'

  export default {
    methods: {
      getDetail() {
        this.$form(this.$api.API_URL_ORDER_DETAIL, {
          userId: this.$store.getters.user.id,
          orderNum: this.$route.params.id
        }).then(res => {
          if (res.errorCode == 0) this.detail = res.data
          else this.$dislog.alert({message: '网络超时'})
        })
      }
    },
    created() {
      this.getDetail()
    },
    components: {mHeader},
    data() {
      return {
        detail: {}
      }
    }
  }
</script>

<style lang="stylus" scoped>

</style>
