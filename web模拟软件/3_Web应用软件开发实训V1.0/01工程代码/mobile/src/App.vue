<template>
  <div id="app">
    <router-view id="body"/>

  </div>
</template>

<script>
  export default {
    name: 'App',
    data() {
      return {
        active: 0
      }
    }
  }
</script>

<style>
  body {
    margin: 0;
    background-color: #f9f9f9;
  }


  #app {
    font-family: 'Avenir', Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    text-align: center;
  }
</style>
