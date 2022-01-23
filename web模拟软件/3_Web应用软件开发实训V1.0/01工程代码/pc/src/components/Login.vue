<template>
  <div id="app-content">
    <section class="page-header page-header-xs">
      <div class="container">
        <h1>用户登录</h1>
        <el-breadcrumb separator-class="el-icon-arrow-right">
          <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
          <el-breadcrumb-item><a>登录</a></el-breadcrumb-item>
        </el-breadcrumb>
      </div>
    </section>
    <!-- /PAGE HEADER -->
    <!-- -->
    <section>
      <div class="container">
        <div class="row">
          <!-- LEFT TEXT -->
          <div class="col-md-5 col-md-offset-1">
            <img class="img-responsive" src="../../static/images/shop/login-png.png">
          </div>
          <!-- /LEFT TEXT -->
          <!-- LOGIN -->
          <div class="col-md-4">
            <h2 class="size-16">登录</h2>
            <div class="text-center" style='color:red;margin-bottom:20px;'>{{tips.msg}}</div>
            <!-- login form -->
            <div class="clearfix">
              <!-- ALERT -->
              <div class="alert alert-mini alert-danger margin-bottom-30" style="display: none">
                <strong></strong>
              </div>
              <!-- /ALERT -->
              <div id="message" style="display: none"></div>
              <!-- mobile -->
              <div class="form-group">
                <el-input type="text" v-model="user.userName" v-bind:class="{error:tips.userNameErr}"
                          placeholder="手机号码" required=""></el-input>
                <label class="error">{{tips.userNameErr}}</label>
              </div>

              <!-- Password -->
              <div class="form-group">
                <el-input type="password" v-model="user.pwd" v-bind:class="{error:tips.pwdErr}"
                          placeholder="密码" required=""></el-input>
                <label class="error">{{tips.pwdErr}}</label>
              </div>

            </div>

            <el-button  @click="login" style="margin: 10px 0;width: 100%" type="primary"
             icon="el-icon-circle-check-outline">登录
            </el-button>
            <div class="text-center">
              <router-link to="/forgot">忘记密码</router-link>&nbsp;&nbsp;&nbsp;
              <router-link to="/register">注册新用户</router-link>
            </div>
            <!-- /login form -->
          </div>
          <!-- /LOGIN -->
        </div>
      </div>
    </section>
    <!-- / -->
    <input type="hidden" id="btnFlag"/>
  </div>
</template>

<script>
  export default {
    name: 'Login',
    data () {
      return {
        user: {
          userName: '',
          pwd: ''
        },
        tips: {
          msg: '',
          userNameErr: null,
          pwdErr: null
        }
      }
    },
    created () {
      var msg = this.$route.params.msg
      if (msg) {
        this.tips.msg = msg
      }
    },
    methods: {
      login () {
        var mobile = /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/
        if (!this.user.userName && !this.user.pwd) {
          this.tips.userNameErr = '请输入手机号码！'
          this.tips.pwdErr = '请输入密码！'
        } else if (!this.user.userName) {
          this.tips.userNameErr = '请输入手机号码！'
          this.tips.pwdErr = null
        } else if (!mobile.test (this.user.userName) && this.user.userName.length != 11) {
          this.tips.userNameErr = '请正确填写您的手机号码！'
          this.tips.pwdErr = null
        } else if (this.user.userName.length > 11) {
          this.tips.userNameErr = '手机号码不能超过11位！！'
          this.tips.pwdErr = null
        } else if (!this.user.pwd) {
          this.tips.userNameErr = null
          this.tips.pwdErr = '请输入密码！'
        } else {
          this.tips.userNameErr = null
          this.tips.pwdErr = null
          var vm = this
          $.ajax ({
            url: vm.API.API_URL_LOGIN,
            type: 'POST',
            contentType:"application/json",
            data: JSON.stringify({
              userName: vm.user.userName,
              pwd: vm.user.pwd
            }),
            success: function (response) {
              if (response.errorCode == 0 && response.data != null) {
                vm.tips.msg = ''
                var user = {
                  id: response.data.id,
                  userName: response.data.userName,
                  nickname: response.data.nickname
                }
                vm.$router.push ({
                  path: '/',
                  name: 'Home'
                })
                vm.Storage.Local.set ('User', user)
                vm.$store.commit ('setUser', user)
              } else {
                vm.tips.msg = '用户名不存在或密码错误！'
              }
            },
            error: function (err) {
              console.log (JSON.stringify (err))
              vm.Toastr.error ("网络异常！")
            }
          })
        }
      }
    }
  }
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
