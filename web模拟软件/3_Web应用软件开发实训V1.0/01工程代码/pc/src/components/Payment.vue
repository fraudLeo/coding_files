<template>
  <div id="app-content">
    <section class="page-header page-header-xs">
      <div class="container">
        <h1>支付</h1>
        <ol class="breadcrumb">
          <li><a href="/">首页</a></li>
          <li>支付</li>
        </ol>
      </div>
    </section>
    <!-- /PAGE HEADER -->
    <!-- 购物车 -->
    <section>
      <div class="container" v-if="payment">
        <div class="row">
          <!-- LEFT -->
          <div class="col-lg-9 col-sm-8">
            <!-- CART -->
            <form class="cartContent clearfix" method="post" action="#">
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
                <template v-for="p in payment.orderItemList">
                  <div class="item" v-for="product in p.productList">
                    <div class="cart_img pull-left width-100 padding-10 text-left">
                      <img v-bind:src="API.BASE_SERVER_URL+product.defaultImg" alt="" width="40"/>
                    </div>
                    <a href="shop-single-left.html" class="product_name">
                      <span>{{product.name}}</span>
                      <small>{{product.jsonData}}</small>
                    </a>
                    <div name="total_price" class="total_price">
                      ￥<span>{{(p.price*p.quantity/100).toFixed(2)}}</span>
                    </div>
                    <div class="qty">
                      <p class="zq" zid="${z.id}"
                         zpid="${z.productList[0].id}"
                         sku="${z.skuId}"
                         group="${z.optionValueKeyGroup}">{{p.quantity}}</p>
                      &times;{{(p.price/100).toFixed(2)}}
                    </div>
                    <div class="clearfix"></div>
                  </div>
                </template>
                <div class='padding-20'>
                  <strong style='font-size: 20px'>选择常用联系人</strong>
                  <hr/>
                  <div class='padding-bottom-10' v-for="contect in payment.contectList">
                    <input v-if="contect.contactFlag==1" class="product-review-vote" type="radio" checked="checked"
                           name="contact" @click="selectContact(contect.id)"/>
                    <input v-else class="product-review-vote" type="radio" name="contact"
                           @click="selectContact(contect.id)"/>
                    姓名：{{contect.name}} &nbsp;&nbsp; 联系电话：{{contect.mobile}} &nbsp;&nbsp; 地址：{{contect.address}}
                  </div>
                  <!-- 联系人 -->
                </div>

                <div class='padding-20'>
                  <strong style='font-size: 20px'>请选择支付方式</strong>
                  <hr/>
                  <div>
                    <a @click="payTreasure(0)"><img src='../../static/images/pay/pc_wxqrpay.png'/></a>
                    <a @click="qrcode"><img src='../../static/images/pay/alipaypcnew.png'/></a>
                    <a @click="payTreasure(2)">电子钱包</a>
                  </div>
                </div>
                <div class="clearfix"></div>
              </div>
              <div class="qrcode">
                <qr v-if="qrcodeState" style="text-align: center" :logoSrc="'../../static/images/pay/alipaypcnew.png'"
                    :text="qrdata"
                    :size="200"
                    :margin="0"></qr>
              </div>
            </form>
            <!-- /cart content -->
            <!-- /CART -->
          </div>
          <!-- RIGHT -->
          <div class="col-lg-3 col-sm-4">
            <div class="toggle active">
              <div class='toggle-content' style='display: block;'>
                <div>
									<span class="clearfix">
										<span class="pull-right">￥{{(payment.price/100).toFixed(2)}}</span>
										<strong class="pull-left">商品总价:</strong>
									</span>
                  <span class="clearfix">
										<span class="pull-right">包邮</span>
										<span class="pull-left">物流费用:</span>
									</span>
                  <hr/>
                  <span class="clearfix">
										<span class="pull-right size-20">￥{{(payment.price/100).toFixed(2)}}</span>
										<strong class="pull-left">合计金额:</strong>
									</span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script>
  import qr from 'vue-qr'

  export default {
    name: 'Payment',
    data () {
      return {
        payment: null,
        selectContactId: null,
        qrcodeState: false
      }
    },
    created () {
      this.getCartList ()
    },
    components: {qr},
    destroyed () {
      clearInterval (this.check)
    },
    computed: {
      qrdata () {
        return JSON.stringify ({
          'orderNum': this.payment.orderNum,
          'userId': this.Storage.Local.get ('User').id,
          'id': this.selectContactId,
          'paymentType': 1
        })
      }
    },
    methods: {
      qrcode () {
        var vm = this, id = this.Storage.Local.get ('User').id, num = this.payment.orderNum
        this.check = setInterval (function () {
          $.ajax ({
            url: vm.API.API_CHECK_ORDER,
            type: 'POST',
            contentType:"application/json",
            data:JSON.stringify( {
              'userId': id,
              'orderNum': num,
            }),
            dataType: 'json',
            success: function (response) {
              if (response.data == 1) {
                vm.Toastr.success ("支付成功，2秒钟后跳转到订单历史")
                vm.$store.commit ('setCartCount', vm.getCartCount ())
                vm.$router.push ({
                  path: '/account/order/list',
                  name: 'OrderList'
                })
              }
            }
          })
        }, 5000)
        this.qrcodeState = true
      },
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
              'type': 0
            },
            dataType: 'json',
            success: function (response) {
              if (response.errorCode == 0 && response.data) {
                vm.payment = response.data
                for (var item in response.data.contectList) {
                  if (response.data.contectList[item].contactFlag == 1) {
                    vm.selectContactId = response.data.contectList[item].id
                  }
                }
              }
            },
            error: function (err) {
              vm.Toastr.error ("网络超时！")
              console.log (JSON.stringify (err))
            }
          })
        }
      },
      selectContact (contactId) {
        this.selectContactId = contactId
      },
      payTreasure (type) {
        this.qrcode = false
        var vm = this
        var user = vm.Storage.Local.get ('User')
        if (user) {
          if (type == 2 && this.getUserAccount () < vm.payment.price / 100) {
            this.Toastr.warning ('余额不足！')
            return
          }
          if (!vm.selectContactId) {
            this.Toastr.warning ('请选择联系人！')
            return
          }
          $.ajax ({
            url: vm.API.API_URL_ORDER_PAYMENT,
            type: "POST",
            data: {
              'userId': user.id,
              'id': vm.selectContactId,
              'paymentType': type
            },
            dataType: "json", //ajax返回值设置为text（json格式也可用它返回，可打印出结果，也可设置成json）
            async: false,
            success: function (json) {
              //errorCode为0则为成功
              if (json.errorCode == 0) {
                vm.Toastr.success ("支付成功，2秒钟后跳转到订单历史")
                vm.$store.commit ('setCartCount', vm.getCartCount ())
                setTimeout (function () {
                  if (type == 2) {
                    vm.$router.push ({
                      path: '/account/paymentResult',
                      name: 'PaymentResult'
                    })
                    vm.Storage.Session.set ('TotalPrice', vm.payment.price / 100)
                  } else {
                    vm.$router.push ({
                      path: '/account/order/list',
                      name: 'OrderList'
                    })
                  }
                }, 2000)
              } else {
                vm.Toastr.error ("支付失败")
              }
            },
            error: function (json) {
              vm.Toastr.success ("支付失败")
            }
          })
        }
      },
      getUserAccount () {
        var vm = this
        var user = vm.Storage.Local.get ('User')
        var amount = 0
        if (user) {
          $.ajax ({
            url: vm.API.API_URL_CUSTOMER_Account,
            type: 'POST',
            data: {
              'userId': user.id
            },
            dataType: 'json',
            async: false,
            success: function (response) {
              if (response.errorCode == 0 && response.data) {
                amount = response.data.amount
              }
            },
            error: function (err) {
              vm.Toastr.error ('网络超时！')
              console.log (JSON.stringify (err))
            }
          })
        }
        return amount
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
            type: 'GET',
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
    }
  }
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

</style>
