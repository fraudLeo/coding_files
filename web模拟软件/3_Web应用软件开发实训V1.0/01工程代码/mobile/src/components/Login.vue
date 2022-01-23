<template>
  <div class="login">
    <m-header>用户登录</m-header>
    <div class="container">
      <img alt="" src="/static/1.jpg" style=" width: 20vw;
    height: 20vw;
    border-radius: 50%;
    position: absolute;
    top: 10vh;
    left: 40vw;">
      <van-cell-group class="cell">
        <van-field
          label="用户名"
          left-icon="contact"
          v-model="userName"
        />
        <van-field
          label="密码"
          left-icon="closed-eye"
          type="password"
          v-model="userPassword"
        />
      </van-cell-group>
      <van-button @click="login" block class="cell" large size="large" square type="primary">登录</van-button>
      <van-button @click="$router.push({path:'/reg'})" block class="cell" plain size="large" square type="primary">注册
      </van-button>
      <div class="cell spear">
        <router-link to="/recover">忘记密码</router-link>
        <van-icon name="like"/>
      </div>
    </div>
  </div>
</template>

<script>
  import header from './other/header'

  export default {
    data() {
      return {
        userName: '',
        userPassword: '',
      }
    },
    components: {'m-header': header},
    methods: {
      login() {
        var mobile = /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/;
        if (!this.userName) this.$dialog.alert({message: '请填写手机号❤'})
        else if (!this.userPassword) this.$dialog.alert({message: '请填写密码❤'})
        else if (!mobile.test(this.userName)) this.$dialog.alert({message: '请正确填写您的手机号码❤'})
        else if (this.userName.length > 11) this.$dialog.alert({message: '手机号码必须为11位❤'})
        else this.$post(this.$api.API_URL_LOGIN, {userName: this.userName, pwd: this.userPassword}).then(res => {
            if (res.errorCode == '0') {
              this.$store.commit('setUser', res.data)
              this.$router.push({path: '/me'})
            } else this.$dialog.alert({message: '用户名或密码错误'})
          })
      },
    }
  }

</script>

<style scoped lang="stylus">
  .container
    margin 20vh 10px

    .cell
      margin-bottom 20px

    .spear
      display flex
      justify-content space-between
      padding 0 10px
</style>
