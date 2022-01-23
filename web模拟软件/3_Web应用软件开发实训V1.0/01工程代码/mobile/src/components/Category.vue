<template>
  <div>
    <van-search
      placeholder="请输入搜索关键词"
      show-action
      v-model="value">
      <div @click="$router.push('/samsara/search/'+value)" slot="action">搜索</div>
    </van-search>
    <div class="container">
      <mt-cell :key="index1" :to="'/samsara/productdetail/'+product.id" is-link v-for="(product,index1) in list">
        <img :src="$api.BASE_SERVER_URL+product.defaultImg" height="50" slot="icon" width="50"/>
        <span>
            <p class="title">{{product.name}}</p>
            <p>
              <span class="price-name">店面价格<span class="price-price">  ￥{{product.shopPrice / 100}} &nbsp</span></span>
            <span class="price-name">市场价格<span class="price-sale-price">  ￥{{product.price / 100}}.0</span></span>
            </p>
          </span>
      </mt-cell>
    </div>
  </div>
</template>

<script>
  export default {
    data() {
      return {
        list: [],
        value: ''
      }
    },
    created() {
      this.$get(this.$api.API_URL_CATALOG_PRODUCT + '/' + this.$route.params.id).then(res => {
        this.list = res.data.productList
      })
    }
  }
</script>

<style scoped lang="stylus">
  .search
    height auto

  .price-price {
    color: #1aad19;
  }

  .price-sale-price {
    text-decoration: line-through;
  }

  .container
    .mint-cell-title
      text-align left
    .item
      background-color #fff
      border-top 1px solid #ddd
      margin-top 20px

      .title
        text-align left
        color #888
        margin 10px
        font-size 13px
</style>
