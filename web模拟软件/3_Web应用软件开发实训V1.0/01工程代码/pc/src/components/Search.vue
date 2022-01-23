<template>
  <div id="app-content">
    <section class="page-header page-header-xs">
      <div class="container">
        <h1>查询关键字："{{productName}}"</h1>
      </div>
    </section>
    <section>
      <div class="container">
        <!-- /LIST OPTIONS -->
        <template v-if="productListPage&&productListPage.productList.length>0">
          <ul class="shop-item-list row list-inline nomargin">
            <!-- 产品-->
            <li class="col-lg-3 col-sm-3" v-for="product in productListPage.productList">
              <div class="shop-item">
                <div class="thumbnail">
                  <!-- product image(s) -->
                  <a @click="goto('/product','Product',product.id)" class="shop-item-image">
                    <img class="img-responsive" v-bind:src="API.BASE_SERVER_URL+product.defaultImg"/>
                  </a>
                  <!-- /product image(s) -->
                  <!-- hover buttons -->
                  <div class="shop-option-over">
                    <a class="btn btn-default add-wishlist" @click="addWish(product.id)" data-toggle="tooltip"
                       title="添加收藏">
                      <i class="fa fa-heart nopadding"></i>
                    </a>
                  </div>
                  <!-- /hover buttons -->
                  <!-- product more info -->
                  <div class="shop-item-info">
                  </div>
                  <!-- /product more info -->
                </div>
                <div class="shop-item-summary text-center">
                  <h2>{{product.name}}</h2>
                  <!-- price -->
                  <div class="shop-item-price">
                    <span class="line-through">￥{{product.price / 100}}</span>￥{{product.shopPrice / 100}}
                  </div>
                  <!-- /price -->
                </div>
                <!-- /buttons -->
              </div>
            </li>
            <!-- /产品 -->
          </ul>
          <hr/>
          <!-- Pagination Default -->
          <div name="bootpagFooter" class="text-center"></div>
          <!-- /Pagination Default -->
        </template>
        <div class="notFind" v-else>
          <img src="../assets/404.png" alt="">
          <p>结果未找到</p>
        </div>
      </div>
    </section>
  </div>
</template>

<script>


  export default {
    name: 'Search',
    data () {
      return {
        productName: '',
        productListPage: null
      }
    },
    created: function () {
      var params = this.Storage.Session.get ('data')
      this.productName = params.name
      this.search (params.name, 1)
    },
    computed: {
      getKeyword () {
        return this.$store.state.keyword
      }
    },
    methods: {
      search (productName, currentPage) {
        if (productName, currentPage) {
          var vm = this
          $.ajax ({
            url: vm.API.API_URL_CATALOG_SEARCH_PRODUCTS + "/" + productName + "/page/" + currentPage,
            type: 'GET',
            dataType: 'json',
            success: function (response) {
              if (response.errorCode == 0) {
                vm.productListPage = response.data
              }
            },
            error: function (err) {
              console.log (JSON.stringify (err))
            }
          })
          var params = {
            name: productName
          }
          vm.Storage.Session.set ("data", params)
        }
      },
      addWish (productId) {
        var vm = this
        var userId = vm.Storage.Local.get ('User').id
        if (userId && productId) {
          $.ajax ({
            url: vm.API.API_URL_CUSTOMER_ADD_WISHLIST,
            type: 'POST',
            data: {
              'userId': userId,
              'productId': productId
            },
            success: function (response) {
              if (response.errorCode == 0 && response.data) {
                vm.Toastr.success ("添加成功！")
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
        var params = {
          id: val
        }
        this.Storage.Session.set ("data", params)
      }
    },
    watch: {
      getKeyword: function (newVal, oldVal) {
        this.productName = newVal
        this.search (newVal, 1)
      }
    }
  }
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
  .notFind img{
    width: 20vw;
  }

  .notFind{
    text-align: center;
  }
  .notFind p{
    font-size: 2em;
  }
</style>
