<template>
  <div id="wrapper">
    <Header ref="Header"/>
    <router-view/>
    <Footer/>
  </div>
</template>

<script>
export default {
  name: 'App'
}
</script>

<style scoped>
div{
    text-align: left;
}
</style>
