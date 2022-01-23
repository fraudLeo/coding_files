<template>
  <div class="dev">
    <mHeader>我的收藏</mHeader>

  </div>
</template>

<script>
  import mHeader from './header'

  export default {
    methods: {},
    created () {
      this.$form (this.$api.API_URL_CUSTOMER_WISHLIST + '/1', {
        'userId': this.$store.getters.user.id
      }).then (res => {
        console.log (res)
      })

    },
    components: {mHeader},
    data () {
      return {}
    }
  }

</script>

<style lang="stylus" scoped>

</style>
