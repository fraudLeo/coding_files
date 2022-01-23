<template>
  <div id="app-content">
    <section class="page-header page-header-xs">
      <div class="container">
        <h1>个人中心</h1>
        <!-- breadcrumbs -->
        <el-breadcrumb separator-class="el-icon-arrow-right">
          <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
          <el-breadcrumb-item>个人中心</el-breadcrumb-item>
          <el-breadcrumb-item>我的订单</el-breadcrumb-item>
          <el-breadcrumb-item>活动详情</el-breadcrumb-item>
        </el-breadcrumb>
        <!-- /breadcrumbs -->
        <!-- page tabs -->
        <ul class="page-header-tabs list-inline">
          <li class="active"><a>我的订单</a></li>
          <li><a @click="goto('/account/contact/list','ContactList')">常用联系人</a></li>
          <li><a @click="goto('/account/wishlist','WishList')">我的收藏</a></li>
          <li><a @click="goto('/account/setting','UserSetting')">个人设置</a></li>
          <li><a @click="goto('/account/ewallet','EWallet')">充值</a></li>
        </ul>
        <!-- /page tabs -->
      </div>
    </section>
    <section>
      <div class="container">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h2 class="panel-title">我的订单</h2>
          </div>
          <el-table
            border
            stripe
            :data="orderList.orderListData"
            style="width: 100%;">
            <el-table-column
              prop="orderNum"
              label="订单编号">
            </el-table-column>
            <el-table-column
              prop="contactName"
              label="联系人姓名"
              width="180">
            </el-table-column>
            <el-table-column
              prop="contactMobile"
              label="联系人电话"
              width="180">
            </el-table-column>
            <el-table-column
              prop="status"
              label="订单状态"
              width="180">
              <template slot-scope="scope">
                <span v-if="scope.row.status==0|| scope.row.status==null">订单编辑中</span>
                <span v-if="scope.row.status==1">已下单</span>
                <span v-if="scope.row.status==2">配送中</span>
                <span v-if="scope.row.status==3">配送完成</span>
                <span v-if="scope.row.status==4">订单取消</span>
              </template>
            </el-table-column>
            <el-table-column
              prop="price"
              label="订单金额"
              width="180">
              <template slot-scope="scope">
                <span>{{(scope.row.price/100).toFixed(1)}}</span>
              </template>
            </el-table-column>
          </el-table>
        </div>

        <template v-if="orderList!=null&&orderList.orderListData.length!=0">
          <ul class="pagination pagination-sm">
            <li><a @click="gotoPage(orderList.nowPage-1)">&laquo;</a></li>
            <template v-for="value in orderList.pageCount">
              <li v-if="orderList.nowPage == value" class="active">
                <a @click="gotoPage(value)"> {{value}}</a>
              </li>
              <li v-else>
                <a @click="gotoPage(value)">{{value}}</a>
              </li>
            </template>
            <li><a @click="gotoPage(orderList.nowPage+1)">&raquo;</a></li>
          </ul>
        </template>
      </div>
    </section>
  </div>
</template>

<script>
  export default {
    name: 'orderList',
    data () {
      return {
        orderList: null,
        pages: []
      }
    },
    created () {
      this.getOrderList (1)
    },
    methods: {
      getOrderList (nowPage) {
        var vm = this
        var user = vm.Storage.Local.get ('User')
        if (user) {
          var userId = user.id
          $.ajax ({
            url: vm.API.API_URL_ORDERS,
            type: 'POST',
            contentType:"application/json",
            data: JSON.stringify({
              'userId': userId,
              'type': 0,
              'nowPage': nowPage
            }),
            dataType: 'json',
            success: function (response) {
              if (response.errorCode == 0 && response.data != null) {
                vm.orderList = response.data
              }
            },
            error: function (err) {
              vm.Toastr.error ("网络超时！")
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
        if (val) {
          this.Storage.Session.set ("data", {
            orderNum: val
          })
        }
      },
      gotoPage (page) {
        if(0<this.orderList.nowPage && this.orderList.nowPage>page)
        this.getOrderList (page)
      }
    }
  }
</script>

<style scoped>

</style>
