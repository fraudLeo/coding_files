<template>
  <div id="app-content">
    <section class="page-header page-header-xs">
      <div class="container">
        <h1>我的购物车</h1>
        <el-breadcrumb separator-class="el-icon-arrow-right">
          <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
          <el-breadcrumb-item>购物车</el-breadcrumb-item>
        </el-breadcrumb>
      </div>
    </section>
    <!-- /PAGE HEADER -->
    <!-- 购物车 -->
    <section>
      <div class="container" v-if="cartList">
        <!-- 如果购物车为空 -->
        <div class="panel panel-default" v-if="cartList.orderItemList.length==0">
          <div class="panel-body">
            <strong style='font-size: 25px'>购物车里无商品!</strong><br/>
            随便看看，优惠多多，赶紧抢购吧！
          </div>
        </div>
        <!-- 如果购物车不为空 -->
        <!-- CART -->
        <div class="row" v-else>
          <!-- LEFT -->
          <div class="col-lg-9 col-sm-8">
            <!-- CART -->
            <form class="cartContent clearfix" method="post" action="#">
              <!-- cart content -->
              <div id="cartContent">
                <!-- cart header -->
                <div class="item head clearfix">
                  <span class="cart_img"></span>
                  <span class="product_name size-13 bold">产品名称</span>
                  <span class="remove_item size-13 bold"></span>
                  <span class="total_price size-13 bold">合计价格</span>
                  <span class="qty size-13 bold">数量</span>
                </div>
                <!-- /cart header -->
                <template v-for="cartItem in cartList.orderItemList">
                  <div class="item" v-for="product in cartItem.productList">
                    <div class="cart_img pull-left width-100 padding-10 text-left">
                      <img v-bind:src="API.BASE_SERVER_URL+product.defaultImg" alt="" width="40"/>
                    </div>
                    <a @click="goto('/product','Product',product.id)" class="product_name">
                      <span>{{product.name}}</span>
                      <small>{{cartItem.jsonData}}</small>
                    </a>
                    <el-button @click="removeCartItem(cartItem.id)" style="margin: 10px;float: right" type="danger"
                               icon="el-icon-delete"
                               circle></el-button>

                    <div name="total_price" class="total_price">¥
                      <span>
												{{((cartItem.price*cartItem.quantity)/100).toFixed(2)}}
											</span>
                    </div>
                    <div class="qty">
                      <el-input-number size="mini" v-model="cartItem.quantity" @change="updateQuantity" :min="1"
                                       :max="999"></el-input-number>
                      &times;
                      ¥ {{(cartItem.price/100).toFixed(2)}}
                    </div>
                    <div class="clearfix"></div>
                  </div>
                </template>

                <el-button @click="updateCartOrPay" style="margin-left: 10px" type="success" plain
                           class="pull-right margin-top-20"
                           icon="el-icon-check">更新购物车
                </el-button>
                <el-button @click="removeCartAll" type="danger" plain class="pull-right margin-top-20"
                           icon="el-icon-delete">清空购物车
                </el-button>


                <!-- /update cart -->
                <div class="clearfix"></div>
              </div>
              <!-- /cart content -->

            </form>
            <!-- /CART -->
          </div>
          <!-- RIGHT -->
          <div class="col-lg-3 col-sm-4">
            <div>
              <div class="hideDiv">
								<span class="clearfix">
									<span id="sumCart" class="pull-right">
									¥	{{(cartList.price/100).toFixed(2)}}
									</span>
									<strong class="pull-left">商品总价:</strong>
								</span>
                <span class="clearfix">
									<span class="pull-right">包邮</span>
									<span class="pull-left">物流费用:</span>
								</span>
                <hr/>
                <span class="clearfix">
									<span class="pull-right size-20">
										¥{{(cartList.price/100).toFixed(2)}}
									</span>
									<strong class="pull-left">合计金额:</strong>
								</span>
                <hr/>
                <el-button @click="updateCartOrPay('pay')" style="margin-left: 10px" type="success" plain
                           class="pull-right margin-top-20"
                           icon="el-icon-check">立即支付
                </el-button>
              </div>
            </div>
          </div>
        </div>
        <!-- /CART -->
      </div>
    </section>
  </div>
</template>

<script>
  export default {
    name: 'Cart',
    data () {
      return {
        cartList: {
          orderItemList: []
        }
      }
    },
    created () {
      this.getCartList ()
    },
    methods: {
      getCartList () {
        var vm = this
        var user = vm.Storage.Local.get ('User')
        if (user) {
          var userId = user.id
          $.ajax ({
            url: vm.API.API_URL_CART,
            type: 'POST',
            data: {
              'userId': userId,
              'type': 1
            },
            dataType: 'json',
            success: function (response) {
              if (response.errorCode == 0 && response.data) {
                vm.cartList = response.data
              } else {
                vm.cartList.orderItemList = []
              }
            },
            error: function (err) {
              vm.Toastr.error ("网络超时！")
              console.log (JSON.stringify (err))
            }
          })
        }
      },
      updateQuantity (quantity) {
        if (this.cartList) {
          this.cartList.price = 0
          var orderItemList = this.cartList.orderItemList
          for (var orderItem in orderItemList) {
            if (orderItemList[orderItem].quantity == '') {
              orderItemList[orderItem].quantity = 1
            }
            this.cartList.price += orderItemList[orderItem].price * orderItemList[orderItem].quantity
          }
        }
      },
      updateCartOrPay (flag) {
        var vm = this
        var user = vm.Storage.Local.get ('User')
        if (user) {
          var userId = user.id
          var orderItemList = []
          var orderItem = {}
          var orderList = this.cartList.orderItemList
          for (var order in orderList) {
            var orderItem = {}
            orderItem["id"] = orderList[order].id
            orderItem["quantity"] = orderList[order].quantity
            orderItem["productId"] = orderList[order].productId
            orderItem["skuId"] = orderList[order].skuId
            orderItem["optionValueKeyGroup"] = orderList[order].optionValueKeyGroup
            orderItemList.push (orderItem)
          }
          $.ajax ({
            url: vm.API.API_URL_CART_ITEMS_UPDATE,
            type: 'POST',
            contentType: 'application/json;charset=utf-8',
            data: JSON.stringify ({
              'userId': userId,
              'type': 0,
              'orderItemList': orderItemList
            }),
            dataType: 'json',
            success: function (response) {
              if (response.errorCode == 0 && response.data == 1) {

                vm.getCartList ()
                if (flag && flag == 'pay') {
                  vm.$router.push ({
                    path: '/account/payment',
                    name: 'Payment'
                  })
                } else {
                  vm.Toastr.success ("更新成功！")
                }
              } else {
                vm.Toastr.error ("更新失败！")
              }
            },
            error: function (err) {
              vm.Toastr.error ("网络超时！")
              console.log (JSON.stringify (err))
            }
          })
        }
      },
      removeCartItem (orderItemId) {
        var vm = this
        var user = this.Storage.Local.get ('User')
        if (user) {
          $.ajax ({
            url: this.API.API_URL_CART_ITEMS_REMOVE,
            type: 'POST',
            data: {
              'userId': user.id,
              'id': orderItemId,
            },
            success: function (response) {
              if (response.errorCode == 0 && response.data) {
                vm.getCartList ()
                vm.Toastr.success ('删除成功')
              } else {
                vm.Toastr.error ('删除失败')
              }
            },
            error: function (err) {
              console.log (JSON.stringify (err))
              vm.Toastr.error ('删除失败')
            }
          })
        } else {
          this.Toastr.warning ("请登录后再操作!")
        }
      },
      removeCartAll () {
        var vm = this
        var user = this.Storage.Local.get ('User')
        if (user) {
          $.ajax ({
            url: this.API.API_URL_CART_ITEMS_REMOVEALL,
            type: 'POST',
            data: {
              'userId': user.id
            },
            success: function (response) {
              if (response.errorCode == 0 && response.data) {
                vm.getCartList ()
                vm.$store.commit ('setCartCount', vm.getCartCount ())
              } else {
                vm.Toastr.error ('清空失败')
              }
            },
            error: function (err) {
              console.log (JSON.stringify (err))
              vm.Toastr.error ('清空失败')
            }
          })
        } else {
          this.Toastr.warning ("请登录后再操作!")
        }
      },
      //获取购物车数量
      getCartCount () {
        var vm = this
        var user = this.Storage.Local.get ("User")
        var cartCount = 0
        if (user) {
          var userId = user.id
          $.ajax ({
            url: vm.API.API_URL_CART_COUNT,
            type: 'POST',
            async: false,//不使用异步
            data: {
              'userId': userId
            },
            success: function (response) {
              if (response.errorCode == 0 && response.data != null) {
                vm.cartCount = response.data
                cartCount = response.data
              }
            },
            error: function (err) {
              console.log (JSON.stringify (err))
            }
          })
        }
        return cartCount
      },
      goto (path, name, val) {
        this.$router.push ({
          path: path,
          name: name
        })
        if (val) {
          this.Storage.Session.set ('data', {
            id: val
          })
        }
      }
    }
  }
</script>

<style scoped>

</style>
