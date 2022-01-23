<template>
  <div class="index">
    <router-view id="body"/>
    <van-tabbar active-color="#07c160" v-model="active">
      <van-tabbar-item icon="newspaper-o" to="/">首页</van-tabbar-item>
      <van-tabbar-item dot icon="home-o" to="/home">商城</van-tabbar-item>
      <van-tabbar-item>
        <van-uploader slot="icon" :after-read="onRead" accept="image/gif, image/jpeg" multiple>
          <img :src="props.active ? icon.active : icon.normal"
               slot-scope="props"
               style="height: 30px">
        </van-uploader>
      </van-tabbar-item>
      <van-tabbar-item icon="shopping-cart-o" :info="$store.state.count?$store.state.count:null" to="/car">购物车
      </van-tabbar-item>
      <van-tabbar-item icon="user-o" to="/me">我的</van-tabbar-item>
    </van-tabbar>
  </div>
</template>

<script>
  export default {
    name: 'Main',
    data () {
      return {
        active: 0,
        icon: {
          active: 'static/addthis.png',
          normal: 'static/addthis1.png'
        }
      }
    },
    props: {},
    methods: {
      onRead () {

      }
    },
    components: {},
    mounted () {
    },
    beforeDestroy () {
    }
  }
</script>

<style scoped lang='stylus'>
  #body {
    height: 93vh;
    overflow: auto;
  }
</style>
