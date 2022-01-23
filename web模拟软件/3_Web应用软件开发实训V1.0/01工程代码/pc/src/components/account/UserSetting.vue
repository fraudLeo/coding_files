<template>
  <div id="app-content">
    <section class="page-header page-header-xs">
      <div class="container">

        <h1>个人中心</h1>


        <el-breadcrumb separator-class="el-icon-arrow-right">
          <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
          <el-breadcrumb-item>个人中心</el-breadcrumb-item>
          <el-breadcrumb-item>个人信息设置</el-breadcrumb-item>

        </el-breadcrumb>
        <!-- /breadcrumbs -->

        <!-- page tabs -->
        <ul class="page-header-tabs list-inline">
          <li><a @click="goto('/account/order/list','OrderList')">我的订单</a></li>
          <li><a @click="goto('/account/contact/list','ContactList')">常用联系人</a></li>
          <li><a @click="goto('/account/wishlist','WishList')">我的收藏</a></li>
          <li class="active"><a>个人设置</a></li>
          <li><a @click="goto('/account/ewallet','EWallet')">充值</a></li>
        </ul>
        <!-- /page tabs -->

      </div>
    </section>

    <section v-if="user!=null">
      <div class="container">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h2 class="panel-title">个人信息设置</h2>
          </div>
          <fieldset class="padding-40 ">
            <div class="row">
              <h3 class='text-center'>个人信息</h3>
              <div class="col-md-6 col-sm-6">
                <label for="nickName">昵称 </label>
                <el-input id="nickName" name="nickName" type="text"
                          v-bind:class="{error:tips.nicknameTip}" v-model="user.nickname"/>
                <label class="error" for="nickName">{{tips.nicknameTip}}</label>
              </div>

              <div class="col-md-6 col-sm-6">
                <label for="email">Email </label>
                <el-input id="email" name="email" type="text"
                          v-bind:class="{error:tips.emailTip}" v-model="user.email"/>
                <label class="error" for="email">{{tips.emailTip}}</label>
              </div>
            </div>
            <el-button  @click="saveBasic" type="primary" class="pull-right margin-top-20" icon="el-icon-edit">保存</el-button>
          </fieldset>

          <hr/>
          <h3 class='text-center'>修改密码</h3>
          <fieldset class="padding-40 ">
            <div class="row">
              <form id="userPwdFrom" onsubmit="return false;">
                <div class="col-md-12 col-sm-12">
                  <label for="oldpassword">输入当前密码 </label>
                  <el-input id="oldpassword" name="oldpassword" type="password"
                            v-bind:class="{error:tips.oldpwdTip}" v-model="pwds.oldpwd"/>
                  <label class="error" for="oldpassword">{{tips.oldpwdTip}}</label>
                </div>

                <div class="col-md-6 col-sm-6">
                  <label for="password">新的密码 </label>
                  <el-input id="password" name="password" type="password"
                            v-bind:class="{error:tips.pwdTip}" v-model="pwds.pwd"/>
                  <label class="error" for="password">{{tips.pwdTip}}</label>
                </div>

                <div class="col-md-6 col-sm-6">
                  <label for="rpassword">确认密码 </label>
                  <el-input id="rpassword" name="rpassword" type="password"
                            v-bind:class="{error:tips.rpwdTip}" v-model="pwds.rpwd"/>
                  <label class="error" for="rpassword">{{tips.rpwdTip}}</label>
                </div>
              </form>
            </div>
            <el-button  @click="savePwd" type="primary" class="pull-right margin-top-20" icon="el-icon-edit">保存</el-button>

          </fieldset>
        </div>
      </div>
    </section>

  </div>
</template>

<script>
  export default {
    name: 'HelloWorld',
    data () {
      return {
        user: null,
        pwds: {
          oldpwd: '',
          pwd: '',
          rpwd: ''
        },
        tips: {
          nicknameTip: null,
          emailTip: null,
          oldpwdTip: null,
          pwdTip: null,
          rpwdTip: null
        }
      }
    },
    created () {
      this.getUserBasic ()
    },
    methods: {
      goto (path, name, val) {
        this.$router.push ({
          path: path,
          name: name
        })
      },
      getUserBasic () {
        var vm = this
        var userId = vm.Storage.Local.get ('User').id
        if (userId) {
          $.ajax ({
            url: vm.API.API_URL_CUSTOMER_BASIC,
            type: 'POST',
            data: {
              'userId': userId
            },
            success: function (response) {
              if (response.errorCode == 0 && response.data != null) {
                vm.user = response.data
              }
            },
            error: function (err) {
              console.log (JSON.stringify (err))
            }
          })
        }
      },
      saveBasic () {
        var vm = this
        var email = /^([0-9A-Za-z\-_\.]+)@([0-9a-z]+\.[a-z]{2,3}(\.[a-z]{2})?)$/g
        if (vm.user.nickname.length == 0 && vm.user.email.length == 0) {
          vm.tips.nicknameTip = "昵称不能为空!"
          vm.tips.emailTip = '邮箱不能为空!'
        } else if (vm.user.nickname.length > 20) {
          vm.tips.nicknameTip = "昵称不能超过20位!"
          vm.tips.emailTip = null
        } else if (vm.user.nickname.length == 0) {
          vm.tips.nicknameTip = "昵称不能为空!"
          vm.tips.emailTip = null
        } else if (vm.user.email.length > 50) {
          vm.tips.emailTip = '邮箱不能超过50位!'
          vm.tips.nicknameTip = null
        } else if (!email.test (vm.user.email)) {
          vm.tips.emailTip = '邮箱格式不正确!'
          vm.tips.nicknameTip = null
        } else if (vm.user.email.length == 0) {
          vm.tips.emailTip = '邮箱不能为空!'
          vm.tips.nicknameTip = null
        } else {
          vm.tips.emailTip = null
          vm.tips.nicknameTip = null
          var user = vm.Storage.Local.get ('User')
          if (user) {
            var userId = user.id
            $.ajax ({
              url: vm.API.API_URL_UPDATE_CUSTOMER,
              type: 'POST',
              data: {
                id: userId,
                nickname: vm.user.nickname,
                email: vm.user.email
              },
              success: function (response) {
                if (response.errorCode == 0 && response.data != null) {
                  if (response.data.success) {
                    vm.Toastr.success ("修改成功！")
                    var user = {
                      'id': userId,
                      'userName': vm.user.userName,
                      'nickname': vm.user.nickname
                    }
                    vm.Storage.Local.set ('User', user)
                    vm.$store.commit ('setUser', user)
                  } else {
                    vm.Toastr.success ("修改失败！")
                  }
                }
              },
              error: function (err) {
                console.log (JSON.stringify (err))
              }
            })
          }
        }
      },
      savePwd () {
        var vm = this
        if (vm.pwds.oldpwd.length == 0 && vm.pwds.pwd.length == 0 && vm.pwds.rpwd.length == 0) {
          vm.tips.oldpwdTip = "请输入原始密码！"
          vm.tips.pwdTip = '请输入新密码！'
          vm.tips.rpwdTip = '请输入确认密码！'
        } else if (vm.pwds.oldpwd.length == 0) {
          vm.tips.oldpwdTip = "请输入原始密码！"
          vm.tips.pwdTip = null
          vm.tips.rpwdTip = null
        } else if (vm.pwds.oldpwd.length > 20) {
          vm.tips.oldpwdTip = "密码不能超过20位！"
          vm.tips.pwdTip = null
          vm.tips.rpwdTip = null
        } else if (vm.pwds.pwd.length == 0) {
          vm.tips.oldpwdTip = null
          vm.tips.pwdTip = "请输入新密码！"
          vm.tips.rpwdTip = null
        } else if (vm.pwds.pwd.length > 20) {
          vm.tips.oldpwdTip = null
          vm.tips.pwdTip = "密码不能超过20位！"
          vm.tips.rpwdTip = null
        } else if (vm.pwds.rpwd.length == 0) {
          vm.tips.oldpwdTip = null
          vm.tips.pwdTip = null
          vm.tips.rpwdTip = "请输入确认密码！"
        } else if (vm.pwds.rpwd.length > 20) {
          vm.tips.oldpwdTip = null
          vm.tips.pwdTip = null
          vm.tips.rpwdTip = "密码不能超过20位！"
        } else if (vm.pwds.rpwd.length != vm.pwds.pwd.length) {
          vm.tips.oldpwdTip = null
          vm.tips.pwdTip = null
          vm.tips.rpwdTip = "密码与确认密码不一致！"
        } else {
          vm.tips.oldpwdTip = null
          vm.tips.pwdTip = null
          vm.tips.rpwdTip = null
          var user = vm.Storage.Local.get ('User')
          if (user) {
            var userId = user.id
            $.ajax ({
              url: vm.API.API_URL_CHANGE_PASSWORD,
              type: 'POST',
              data: JSON.parse ([{
                'userId': userId,
                'oldpassword': vm.pwds.oldpwd,
                'rpassword': vm.pwds.rpwd
              }]),
              success: function (response) {
                if (response.errorCode == 0 && response.data.success) {
                  vm.Toastr.success ("密码修改成功！")
                  vm.pwds.oldpwd = ''
                  vm.pwds.pwd = ''
                  vm.pwds.rpwd = ''
                } else if (response.errorCode == -1 && !response.data.success) {
                  if (response.data.message == '提示 当前密码不正确!') {
                    vm.Toastr.error ("原密码不正确！")
                  }
                }
              },
              error: function (err) {
                console.log (JSON.stringify (err))
              }
            })
          }
        }
      }
    }
  }
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

</style>
