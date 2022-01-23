<template>

  <div class="mine">
    <mHeader>我的</mHeader>
    <van-cell style="margin-bottom: 30px" v-if="$store.getters.user">
      <template slot="icon">
        <img src="/static/1.jpg" style="height:5em;width:5em;border-radius: 50%">
      </template>
      <template slot="title">
        <div class="" style="text-align: right;top:-10px;position:relative">
          <p>{{$store.getters.user.nickname}}</p>
          <p>{{$store.getters.user.userName}}</p>
        </div>

      </template>
    </van-cell>
    <van-cell :key="index" :title="item.title" :to="item.url" is-link v-for="(item,index) of row">
      <template slot="icon">
        <img :src="item.icon" style="height:1em;width:1em">
      </template>
    </van-cell>
    <van-cell icon="balance-o" is-link title="电子钱包充值" to="/samsara/wallet"/>
    <van-cell icon="scan" is-link title="扫描二维码"/>
    <van-cell @click="$store.commit('setUser',null)" icon="share" is-link title="退出" to="/login"/>
  </div>
</template>

<script>
  import mHeader from './other/header'

  export default {
    components: {mHeader},
    data () {
      return {
        row: [{
          title: '订单历史',
          icon: '../../static/img/1.png',
          url: '/samsara/history'
        }, {
          title: '常用联系人',
          icon: '../../static/img/2.png',
          url: '/samsara/concat'
        }, {
          title: '我的收藏',
          icon: '../../static/img/3.png',
          url: '/samsara/collect'
        }, {
          title: '会员设置',
          icon: '../../static/img/4.png',
          url: '/samsara/setting'
        }],
        user: '',

      }
    },
    created () {
      if (!this.$store.getters.user) this.$router.push ({path: '/login'})
      this.$form (this.$api.API_URL_CART, {
        userId: this.$store.getters.user.id,
        type: 1
      }).then (res => {
        let i = 0
        if (res.data) res.data.orderItemList.forEach (value => {
          i += value.quantity
        })
        this.$store.commit ('setStore', i)
      })
    },
    methods: {}
  }

</script>

<style scoped>

</style>
