<template>
  <div class="index">
    <van-search
      placeholder="请输入搜索关键词"
      show-action
      v-model="value"
    >
      <div @click="$router.push('/samsara/search/'+value)" slot="action">搜索</div>
    </van-search>
    <div class="container">
      <div class="col">
        <div class="item" v-for="item of img1"><img :src="'static/'+item+'.jpg'" alt=""></div>
      </div>
      <div class="col">
        <div class="item" v-for="item of img2"><img :src="'static/'+item+'.jpg'" alt=""></div>
      </div>
    </div>

  </div>
</template>

<script>
  export default {
    name: 'Index',
    data() {
      return {
        img1: [1, 2, 3, 2, 2, 1],
        img2: [3, 2, 2, 1, 3]
      }
    },
    props: {},
    methods: {},
    components: {},
    mounted() {
    },
    beforeDestroy() {
    }
  }
</script>

<style scoped lang='stylus'>
  #body {
    height: 93vh;
    overflow: auto;
  }
  .search
    height auto
  .container
    display flex
    justify-content space-around
    padding 20px

    .col
      max-width 40vw
      display flex
      flex-direction column
      justify-content space-around
      flex 1

      .item
        background #e7e7e7
        border 1px solid #999
        border-radius 10px
        padding 10px
        margin-bottom 10px
        img
          width 100%
</style>
