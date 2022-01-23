<template>
  <div class="Child">
    <router-view id="body"/>
  </div>
</template>

<script>
  export default {
    name: 'Child',
    data() {
      return {}
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
  #body{
    height 100vh
  }
</style>
