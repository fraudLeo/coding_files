<template>
  <div :class="status?'header0':'header1'">
    <van-icon v-if="status" name="arrow-left" @click="$router.go(-1)"/>
    <slot></slot>
    <van-icon v-if="status" name="home-o" @click="$router.push('/home')"/>
  </div>
</template>

<script>
  export default {
    name: 'v-header',
    data () {
      return {}
    },
    props: {},
    methods: {},
    components: {},
    mounted () {
    },
    computed: {
      status () {
        return this.$route.path.includes ('samsara')
      }
    },
    beforeDestroy () {
    }
  }
</script>

<style scoped lang='stylus'>
  .header1
    background #717171
    color white
    font-size 1.2em
    line-height 1.2em
    padding 10px
  .header0
    background #717171
    color white
    font-size 1.2em
    line-height 1.2em
    padding 10px
    display flex
    align-items center
    justify-content space-between
</style>
