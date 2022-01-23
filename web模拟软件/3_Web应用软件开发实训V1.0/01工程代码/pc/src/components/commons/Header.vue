<template>
  <div>
    <div id="topBar">
      <template v-if="user!=null">
        <el-menu :default-active="'2'" class="el-menu-demo" mode="horizontal">
          <el-submenu index="2" style="float: right">
            <template slot="title">
              <i class="fa fa-user hidden-xs"></i> 会员中心
            </template>
            <el-menu-item index="2-1">
              <li>
                <a tabindex="-1" @click="goto('/account/order/list','OrderList')"><i
                  class="fa fa-history"></i>订单历史</a>
              </li>
            </el-menu-item>
            <el-menu-item index="2-2">
              <li>
                <a tabindex="-1" @click="goto('/account/wishlist','WishList')"><i class="fa fa-bookmark"></i>收藏夹</a>
              </li>
            </el-menu-item>
            <el-menu-item index="2-3">
              <li>
                <a tabindex="-1" @click="goto('/account/contact/list','ContactList')"><i
                  class="fa fa-edit"></i>常用联系人</a>
              </li>
            </el-menu-item>
            <el-menu-item index="2-4">
              <li>
                <a tabindex="-1" @click="goto('/account/setting','UserSetting')"><i class="fa fa-cog"></i>个人设置</a>
              </li>
            </el-menu-item>
            <el-menu-item index="2-5">
              <li>
                <a tabindex="-1" @click="goto('/account/ewallet','EWallet')"><i class="fa fa-money"></i>充值</a>
              </li>
            </el-menu-item>
            <el-menu-item index="2-6">
              <li>
                <a tabindex="-1" @click="logout"><i class="fa fa-sign-out"></i>退出</a>
              </li>
            </el-menu-item>
          </el-submenu>
          <el-menu-item index="3" style="float: right">
            <li class="text-welcome hidden-xs">
              <template v-if="user.id">
                欢迎
              </template>
              <strong v-if="user.nickname">
                {{user.nickname}}
              </strong>
              <strong v-else>
                {{user.userName}}
              </strong>
            </li>
          </el-menu-item>

        </el-menu>

      </template>
      <template v-else>
        <el-menu :default-active="'2'" router class="el-menu-demo" mode="horizontal">
          <el-menu-item style="float: right" index="/register">
            <router-link to="" class='sysBuilding'>注册</router-link>
          </el-menu-item>
          <el-menu-item style="float: right" index="/login">
            <router-link to="" class='sysBuilding'>登录</router-link>
          </el-menu-item>
        </el-menu>
      </template>

    </div>
    <!-- /Top Bar -->

    <div id="header" class="sticky clearfix">
      <!-- TOP NAV -->
      <header id="topNav">
        <div class="container">
          <!-- Mobile Menu Button -->
          <button class="btn btn-mobile" data-toggle="collapse" data-target=".nav-main-collapse"><i
            class="fa fa-bars"></i></button>

          <!-- BUTTONS -->
          <ul class="pull-right nav nav-pills nav-second-main">

            <!-- QUICK SHOP CART -->
            <li class="quick-cart" ref="box">
              <a @click="getCart()">
                <span class="badge badge-aqua btn-xs badge-corner">{{cartCount}}</span>
                <i v-if="user!=null" class="fa fa-shopping-cart"></i>
              </a>
              <div class="quick-cart-box" v-bind:class="{showCart:cartShowFlag}">
                <h4 class="text-center">购物车</h4>
                <div id="divCart" class="quick-cart-wrapper" v-if="cartList">
                  <template v-for="cartItem in cartList.orderItemList">
                    <a v-for="product in cartItem.productList" @click="viewCartProduct(product.id)">
                      <img v-bind:src="API.BASE_SERVER_URL+product.defaultImg" style="width:45px;height:45px"
                           alt="无法显示图片"/>
                      <h6>
                        <span>{{cartItem.quantity}}</span>
                        {{product.name}}
                      </h6>
                      <small>{{(cartItem.price/100).toFixed(1)}}</small>
                    </a>
                  </template>
                </div>
                <!-- quick cart footer -->
                <div class="quick-cart-footer clearfix">
									<span id="sumprice" class="pull-left" v-if="cartList">
										<strong>共:</strong>￥{{(cartList.price/100).toFixed(2)}}
									</span>
                  <a @click="goto('/account/cart','Cart')" class="btn btn-primary btn-xs pull-right">查看购物车</a>
                </div>
                <!-- /quick cart footer -->
              </div>
            </li>
            <!-- /QUICK SHOP CART -->
          </ul>
          <div class='row'>
            <div class='col-lg-3 col-sm-3'>
              <router-link :to="{path:'/'}" class="logo pull-left" style="margin-top:5px"><img
                src="../../../static/images/logo.gif"/></router-link>
            </div>
            <div class='col-lg-6 col-sm-6' style='padding-top: 30px'>
              <div class="search-box" style="display: block;">
                <form id='searchForm' onkeydown="if(event.keyCode==13)return false;" action="${root}/pc/search/page/1"
                      method="get">
                  <div class="input-group">
                    <el-input prefix-icon="el-icon-search"
                              type="text" v-model="productName" placeholder="请输入查询关键字">
                    </el-input>
                    <span class="input-group-btn">
											<el-button type="primary" @click="search" ref="searchInput">搜索</el-button>
										</span>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </header>
    </div>
  </div>
</template>

<script>
  export default {
    name: "Header",
    data () {
      return {
        productName: "",
        user: null,
        cartCount: '',
        cartList: null,
        cartShowFlag: false
      }
    },
    computed: {
      getUser () {
        return this.$store.state.user
      },
      cartCountFromStore () {
        return this.$store.state.cartCount
      }
    },
    created () {
      var user = this.Storage.Local.get ("User")
      this.displayUserInfo (user)
      this.getCartCount ()
    },
    methods: {
      search () {
        var path = this.$route.path
        if (path == "/search") {
          this.$store.commit ("setKeyword", this.productName)
        } else {
          if (this.productName) {
            this.$router.push ({
              path: "/search",
              name: "Search"
            })
            var params = {
              name: this.productName
            }
            this.Storage.Session.set ("data", params)
          }
        }
      },
      logout () {
        this.user = null
        this.Storage.Local.remove ("User")
        this.cartCount = ''
        if (this.$route.path.indexOf ('/account') != -1) {
          this.$router.push ({
            path: '/login',
            name: 'Login',
            params: {
              msg: '您还未登录，请登录！'
            }
          })
        }

      },
      displayUserInfo (user) {
        this.user = user
      },
      getCartCount () {
        var vm = this
        if (vm.user) {
          var userId = vm.user.id
          $.ajax ({
            url: vm.API.API_URL_CART_COUNT,
            type: 'POST',
            data: {
              'userId': userId
            },
            success: function (response) {
              if (response.errorCode == 0 && response.data != null) {
                if (response.data != 0) {
                  vm.cartCount = response.data
                } else {
                  vm.cartCount = ""
                }
              }
            },
            error: function (err) {
              console.log (JSON.stringify (err))
            }

          })
        }
      },
      getCart () {
        if (!this.cartShowFlag) {
          document.addEventListener ('click', this.hidePanel, false)
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
                  vm.cartShowFlag = true
                }
              },
              error: function (err) {
                vm.Toastr.error ("网络超时！")
                console.log (JSON.stringify (err))
              }
            })
          }
        } else {
          this.cartShowFlag = false
          document.removeEventListener ('click', this.hidePanel, false)
        }
      },
      hidePanel (e) {
        if (!this.$refs.box.contains (e.target)) {
          this.cartShowFlag = false
          document.removeEventListener ('click', this.hidePanel, false)
        }
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
        if (path == '/account/cart') {
          this.cartShowFlag = false
        }
      },
      viewCartProduct (productId) {
        if (this.$route.path == '/product') {
          this.$store.commit ('setCartProductId', productId)
        } else {
          this.goto ('/product', 'Product', productId)
        }
      }
    },
    watch: {
      getUser: function (newVal, oldVal) {
        this.displayUserInfo (newVal)
        this.getCartCount ()
      },
      cartCountFromStore: function (newVal, oldVal) {
        if (this.cartCount != newVal) {
          this.getCartCount ()
        }
      }
    }
  }
</script>

<style scoped>
  .showCart {
    display: block !important;
  }
</style>
