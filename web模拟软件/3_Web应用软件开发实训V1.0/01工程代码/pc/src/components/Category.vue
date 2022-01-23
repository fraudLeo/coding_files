<template>
  <div id="app-content">
    <section class="page-header page-header-xs">
      <div class="container">
        <h1 id="categoryName">当前分类：{{categoryName}}</h1>
      </div>
    </section>

    <section>
      <div class="div" style="width: 20vw;position: relative;float: left;top:0">
        <el-menu
          default-active="6">
          <el-menu-item index="6">
            <i class="el-icon-menu"></i>
            <span slot="title">分类</span>
          </el-menu-item>
          <el-menu-item :index="'7-'+index" v-if="index < 15" @click="loadCategoryProducts(category.id,1)"
                        v-for="(category,index) in
          categoryList" v-bind:key="category.id">
            <i class="el-icon-location"></i>
            <span slot="title">{{category.name}}</span>
          </el-menu-item>
          <el-menu-item @click="$router.push({path:'/categories'})" index="8" v-if="categoryList.length >= 15">
            查看更多分类
          </el-menu-item>
        </el-menu>
      </div>


      <div class="container">
        <div id='page'></div>
        <div class='row'>
          <div class='col-lg-9 col-md-9 col-sm-9 col-lg-push-3 col-md-push-3 col-sm-push-3'>
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
                        <a class="btn btn-default add-wishlist" onclick="addWishlist(this)" href="javascript:void(0);"
                           data-item-id="1" data-toggle="tooltip" title="添加收藏">
                          <input type="hidden" name="productId" v-bind:value="product.id">
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
              <div class="text-center">
                <ul class="pagination bootpag">
                  <li data-lp="1" class="prev disabled">
                    <a href="javascript:void(0);">&lt;</a>
                  </li>
                  <li data-lp="1" class="active">
                    <a href="javascript:void(0);">1</a>
                  </li>
                  <li data-lp="2">
                    <a href="javascript:void(0);">2</a>
                  </li>
                  <li data-lp="2" class="next">
                    <a href="javascript:void(0);">&gt;</a>
                  </li>
                </ul>
              </div>
            </template>
            <!-- /Pagination Default -->
          </div>
        </div>
      </div>
    </section>
  </div>
</template>
<script>
  export default {
    data () {
      return {
        categoryName: "",
        categoryList: [],
        categoryObject: null,
        productListPage: null
      }
    },
    created: function () {
      this.loadCategoryList ()
      var params = this.Storage.Session.get ('data')
      this.loadCategoryProducts (params.id, params.page)
    },
    methods: {
      loadCategoryList () {
        var vm = this
        $.ajax ({
          url: vm.API.API_URL_CATEGORY_CONDITION,
          type: 'GET',
          success: function (response) {
            if (response.errorCode == 0) {
              vm.categoryList = response.data
            }
          },
          error: function (err) {
            console.log (err)
          }
        })
      },
      loadCategoryProducts (categoryId, page) {
        var vm = this
        if (categoryId) {
          $.ajax ({
            url: vm.API.API_URL_CATEGORY + '/' + categoryId,
            type: 'GET',
            success: function (response) {
              if (response.errorCode == 0) {
                vm.categoryObject = new Object (response.data)
                vm.categoryName = vm.categoryObject.name
                $.ajax ({
                  url: vm.API.API_URL_CATALOG_PRODUCT + '/' + vm.categoryObject.id,
                  type: 'GET',
                  success: function (response) {
                    if (response.errorCode == 0) {
                      vm.productListPage = new Object (response.data)
                    }
                  },
                  error: function (err) {
                    console.log (err)
                  }
                })
              }
            },
            error: function (err) {
              console.log (err)
            }
          })
          var params = {
            id: categoryId
          }
          this.Storage.Session.set ("data", params)
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
    }
  }
</script>
<style>

</style>
