<template>
  <div id="app-content">
    <section class="page-header page-header-xs">
      <div class="container">

        <h1>个人中心</h1>

        <!-- breadcrumbs -->
        <el-breadcrumb separator-class="el-icon-arrow-right">
          <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
          <el-breadcrumb-item>个人中心</el-breadcrumb-item>
          <el-breadcrumb-item>充值</el-breadcrumb-item>

        </el-breadcrumb>
        <!-- /breadcrumbs -->

        <!-- page tabs -->
        <ul class="page-header-tabs list-inline">
          <li><a @click="goto('/account/order/list','OrderList')">我的订单</a></li>
          <li><a @click="goto('/account/contact/list','ContactList')">常用联系人</a></li>
          <li><a @click="goto('/account/wishlist','WishList')">我的收藏</a></li>
          <li><a @click="goto('/account/setting','UserSetting')">个人设置</a></li>
          <li class="active"><a>充值</a></li>
        </ul>
        <!-- /page tabs -->
      </div>
    </section>
    <section>
      <div class="container">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h2 class="panel-title">账户充值</h2>
          </div>
          <br/>
          <div class="row">
            <h4 class='text-center'>当前电子钱包账户余额为：{{(userAccount.amount).toFixed(2)}}</h4>
          </div>
          <div class="panel-body">
            <fieldset class="margin-top-10 ">
              <div class="row">
                <div class="form-group col-lg-12">
                  <label for="account">请输入充值金额 <span style="color:red">*</span></label>
                  <el-input type="text" class="required" v-model="account" v-bind:class="{error:msg}"
                            placeholder="请输入充值金额" maxlength="255"/>
                  <div class="erro">{{msg}}</div>
                </div>
              </div>
              <el-button @click="recharge" type="primary" class="pull-right margin-top-20" icon="el-icon-circle-plus-outline
">充值
              </el-button>
            </fieldset>
          </div>

        </div>
      </div>
    </section>
  </div>
</template>

<script>
  export default {
    name: 'EWallet',
    data () {
      return {
        account: '',
        msg: null,
        userAccount: {
          amount: 0,
        }
      }
    },
    created () {
      this.getUserAccount ()
    },
    methods: {
      getUserAccount () {
        var vm = this
        var userId = vm.Storage.Local.get ('User').id
        if (userId) {
          $.ajax ({
            url: vm.API.API_URL_CUSTOMER_Account,
            type: 'POST',
            contentType:"application/json",
            data: JSON.stringify({
              'userId': userId
            }),
            dataType: 'json',
            success: function (response) {
              if (response.errorCode == 0 && response.data) {
                vm.userAccount = response.data
              }
            },
            error: function (err) {
              vm.Toastr.error ('网络超时！')
              console.log (JSON.stringify (err))
            }
          })
        }
      },
      recharge () {
        var vm = this
        if (vm.account.length == 0) {
          vm.msg = "请输入金额！"
        }else if(this.account<0 ){
          vm.msg = "金额不能为负"
        } else {
          vm.msg = null
          var userId = vm.Storage.Local.get ('User').id
          if (userId) {
            $.ajax ({
              url: vm.API.API_URL_CUSTOMER_Recharge_Account,
              type: 'POST',
              contentType:"application/json",
              data: JSON.stringify({
                'userId': userId,
                'amount': vm.account
              }),
              dataType: 'json',
              success: function (response) {
                if (response.errorCode == 0 && response.data) {
                  vm.account = ''
                  vm.getUserAccount ()
                  vm.Toastr.success ('充值成功！')
                } else {
                  vm.Toastr.error ('充值失败！')
                }
              },
              error: function (err) {
                vm.Toastr.error ('网络超时！')
                console.log (JSON.stringify (err))
              }
            })
          }
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
