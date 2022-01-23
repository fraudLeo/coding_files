<template>
  <div>
    <van-search
      placeholder="请输入搜索关键词"
      show-action
      v-model="value"
    >
      <div @click="$router.push('/samsara/search/'+value)" slot="action">搜索</div>
    </van-search>
    <div class="container">
      <div class="category">
        <div class="cell" v-for="(item,index) of list" @click="$router.push('/samsara/category/'+item.id)">
          <img :src="'/static/assets/'+(index+1)+'.png?q=random'" alt="">
          <span>{{item.name}}</span>
        </div>
        <div class="cell"  @click="$router.push('/samsara/categoryList/')">
          <img src="/static/assets/more.png" alt="">
          <span>更多</span>
        </div>
      </div>

      <div :key="index" class="item" v-for="(category,index)  in categoryRelationList">
        <div class="title">{{category.name}}</div>
        <mt-cell :key="index1" :to="'/samsara/productdetail/'+product.id" is-link
                 v-for="(product,index1) in category.productRelationList">
          <img :src="$api.BASE_SERVER_URL+product.defaultImg" height="50" slot="icon" width="50"/>
          <span>
            <p class="title">{{product.name}}</p>
            <p>
              <span class="price-name">店面价格<span class="price-price">  ￥{{product.shopPrice / 100}} &nbsp</span></span>
            <span class="price-name">市场价格<span class="price-sale-price">  ￥{{product.price / 100}}.0</span></span>
            </p>
          </span>
        </mt-cell>
        <mt-cell :to="'/samsara/category/'+category.id" is-link title="查看更多"></mt-cell>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    data () {
      return {
        categoryRelationList: [],
        value: '',
        list: []
      }
    },
    created: function () {
      this.$post (this.$api.API_URL_CATALOG_INDEX_PRODUCTS + '/3').then (res => {
        this.categoryRelationList = res.data
      })
      this.$get (this.$api.API_URL_CATEGORY_CONDITION).then (res => {
        this.list = res.data.slice (0, 5)
      })
    },
    methods: {}
  }
</script>

<style scoped lang="stylus">
  .search
    height auto

  .price-price {
    color: #1aad19;
  }

  .category
    padding 10px
    display flex
    flex-wrap wrap
    background white

    .cell
      width 26vw
      display flex
      flex-direction column
      align-items center
      padding 10px

      img
        width 30px

  .price-sale-price {
    text-decoration: line-through;
  }

  .container
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
