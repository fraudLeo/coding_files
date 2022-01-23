<template>
  <div id="app-content">
    <section class="page-header page-header-xs">
      <div class="container">
        <h1>用户注册</h1>
        <el-breadcrumb separator-class="el-icon-arrow-right">
          <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
          <el-breadcrumb-item>用户注册</el-breadcrumb-item>
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
            <h2 class="size-16">用户注册</h2>
            <!-- register form -->
            <div class="clearfix">
              <!-- ALERT -->
              <div id="error" class="alert alert-mini alert-danger margin-bottom-30" style="display: none">
                <strong>{{tips.msg}}</strong>
              </div>
              <!-- /ALERT -->
              <div id="message">
                <strong v-if="user.tempSMSCode">您的手机验证码：{{user.tempSMSCode}}</strong>
                <strong v-if="tips.msg">{{tips.msg}}</strong>
              </div>
              <!-- mobile -->
              <div class="form-group">

                <el-input type="text" placeholder="手机号码" v-model="user.userName"
                          v-bind:class="{error:tips.mobileTip}" required="" maxlength="11">
                  <el-button @click="sendSmsMsg" slot="append" type="primary" icon="el-icon-mobile-phone
">发送
                  </el-button>
                </el-input>

                <label class="error">{{tips.mobileTip}}</label>
              </div>
              <!-- 验证码 -->
              <div class="form-group">

                <el-input type="text" placeholder="请输入手机验证码" v-model="user.smsCode"
                          v-bind:class="{error:tips.valCodeTip}" maxlength="6">
                </el-input>
                <label class="error">{{tips.valCodeTip}}</label>
              </div>
              <!-- Password -->
              <div class="form-group">
                <el-input type="password" placeholder="新密码" v-model="user.pwd"
                          v-bind:class="{error:tips.pwdTip}" required="" maxlength="20">
                </el-input>
                <label class="error">{{tips.pwdTip}}</label>
              </div>
              <!-- Password -->
              <div class="form-group">
                <el-input type="password" placeholder="确认密码" v-model="user.rpwd"
                          v-bind:class="{error:tips.rpwdTip}" required="" maxlength="20">
                </el-input>
                <label class="error">{{tips.rpwdTip}}</label>
              </div>
            </div>

            <el-button @click="registerOpt" style="margin: 10px 0;width: 100%" type="primary"
                       icon="el-icon-circle-check-outline">立即注册
            </el-button>
            <div>
              <router-link to="/login">立即登录</router-link>
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
    name: 'Register',
    data () {
      return {
        user: {
          userName: '',
          smsCode: '',
          pwd: '',
          rpwd: '',
          amount: 0,
          tempUserName: '',
          tempSMSCode: ''

        },
        tips: {
          msg: null,
          mobileTip: null,
          valCodeTip: null,
          pwdTip: null,
          rpwdTip: null
        }
      }
    },
    methods: {
      sendSmsMsg () {
        var vm = this
        var mobile = /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/
        if (vm.user.userName.length == 0) {
          vm.tips.mobileTip = '请输入手机号码！'
        } else if (!mobile.test (vm.user.userName)) {
          vm.tips.mobileTip = '请正确填写您的手机号码！'
        } else if (vm.user.userName.length > 11) {
          vm.tips.mobileTip = '手机号码不能超过11位！'
        } else {
          //验证手机号是否已注册
          $.ajax ({
            url: vm.API.API_URL_CUSTOMER,
            type: 'POST',
            data: {
              userName: vm.user.userName
            },
            success: function (response) {
              if (response.errorCode == -3 && !response.data) {
                //发送短信获取验证码
                $.ajax ({
                  url: vm.API.SEND_SMS,
                  type: 'POST',
                  data: {
                    userName: vm.user.userName
                  },
                  success: function (response) {
                    if (response.errorCode == 0 && response.data) {
                      vm.user.tempSMSCode = response.data
                      vm.user.tempUserName = vm.user.userName
                      vm.tips.msg = null
                      vm.Toastr.success ('短信已发送！')
                    } else {
                      vm.Toastr.error ('短信发送失败！')
                    }
                  },
                  error: function (err) {
                    console.log (JSON.stringify (err))
                  }
                })
              } else {
                vm.user.tempSMSCode = null
                vm.user.tempSMSCode = null
                vm.user.tempUserName = null
                vm.tips.msg = '您已注册，请登录!'
              }
            },
            error: function (err) {
              console.log (JSON.stringify (err))
            }
          })
        }
      },
      registerOpt () {
        var vm = this
        var mobile = /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/
        if (vm.user.userName.length == 0) {
          vm.tips.mobileTip = '请输入手机号码！'
          vm.tips.valCodeTip = null
          vm.tips.pwdTip = null
          vm.tips.rpwdTip = null
        } else if (!mobile.test (vm.user.userName)) {
          vm.tips.mobileTip = '请正确填写您的手机号码！'
          vm.tips.valCodeTip = null
          vm.tips.pwdTip = null
          vm.tips.rpwdTip = null
        } else if (vm.user.userName.length > 11) {
          vm.tips.mobileTip = '手机号码不能超过11位！'
          vm.tips.valCodeTip = null
          vm.tips.pwdTip = null
          vm.tips.rpwdTip = null
        } else if (vm.user.smsCode.length == 0) {
          vm.tips.valCodeTip = '请输入手机验证码！'
          vm.tips.mobileTip = null
          vm.tips.pwdTip = null
          vm.tips.rpwdTip = null
        } else if (vm.user.smsCode.length > 6) {
          vm.tips.valCodeTip = '手机验证码必须是6位！'
          vm.tips.mobileTip = null
          vm.tips.pwdTip = null
          vm.tips.rpwdTip = null
        } else if (vm.user.pwd.length == 0) {
          vm.tips.pwdTip = '请输入密码！'
          vm.tips.mobileTip = null
          vm.tips.valCodeTip = null
          vm.tips.rpwdTip = null
        } else if (vm.user.pwd.length > 20) {
          vm.tips.pwdTip = '密码不能超过20位！'
          vm.tips.mobileTip = null
          vm.tips.valCodeTip = null
          vm.tips.rpwdTip = null
        } else if (vm.user.rpwd.length == 0) {
          vm.tips.rpwdTip = '请输入确认密码！'
          vm.tips.mobileTip = null
          vm.tips.valCodeTip = null
          vm.tips.pwdTip = null
        } else if (vm.user.rpwd.length > 20) {
          vm.tips.rpwdTip = '确认密码不能超过20位！'
          vm.tips.mobileTip = null
          vm.tips.valCodeTip = null
          vm.tips.pwdTip = null
        } else if (vm.user.rpwd != vm.user.pwd) {
          vm.tips.msg = '密码与确认密码不一致！'
          vm.tips.mobileTip = null
          vm.tips.valCodeTip = null
          vm.tips.pwdTip = null
          vm.tips.rpwdTip = null
        } else if (vm.user.userName != vm.user.tempUserName) {
          vm.tips.msg = '注册手机与发送验证码的手机号码不一致！'
          vm.tips.mobileTip = null
          vm.tips.valCodeTip = null
          vm.tips.pwdTip = null
          vm.tips.rpwdTip = null
        } else if (vm.user.smsCode != vm.user.tempSMSCode) {
          vm.tips.msg = '验证码不正确'
          vm.tips.mobileTip = null
          vm.tips.valCodeTip = null
          vm.tips.pwdTip = null
          vm.tips.rpwdTip = null
        } else {
          vm.tips.msg = null
          vm.tips.mobileTip = null
          vm.tips.valCodeTip = null
          vm.tips.pwdTip = null
          vm.tips.rpwdTip = null
          //获取默认账户值
          $.ajax ({
            url: vm.API.API_URL_EWALLET_DEFAULT,
            type: 'GET',
            data: {
              userName: vm.user.userName
            },
            success: function (response) {
              if (response.errorCode == 0 && response.data) {
                vm.user.amount = response.data
                //注册用户信息
                $.ajax ({
                  url: vm.API.REGISTER,
                  type: 'POST',
                  data: {
                    userName: vm.user.userName,
                    pwd: vm.user.rpwd,
                    amount: vm.user.amount
                  },
                  success: function (response) {
                    if (response.errorCode == 0 && response.data) {
                      vm.user = {
                        userName: '',
                        smsCode: '',
                        pwd: '',
                        rpwd: '',
                        amount: 0,
                        tempUserName: '',
                        tempSMSCode: ''
                      }
                      vm.Toastr.success ('注册成功！')
                    } else {
                      vm.Toastr.error ('注册失败！')
                    }
                  },
                  error: function (err) {
                    console.log (JSON.stringify (err))
                  }
                })
              } else {
                vm.Toastr.error ('注册失败！')
              }

            },
            error: function (err) {
              console.log (JSON.stringify (err))
            }
          })
        }
      },
      goto (path, name, val) {
        this.$router.push ({
          path: path,
          name: name
        })
      }
    }
  }
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

</style>
