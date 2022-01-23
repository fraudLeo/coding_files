<template>
  <div v-if="productDetail">
    <mHeader>产品详情</mHeader>
    <div class="container">
      <div class="product" v-if="productDetail">
        <img class="img" v-bind:src="$api.BASE_SERVER_URL+productDetail.defaultImg"/>
        <div class="desc">
          <span class="title">{{productDetail.name}}</span>
          <van-field
            @click-icon="$toast('question')"
            clearable
            icon="question-o"
            label="购买数量"
            type="number"
            placeholder="请填写购买数量"
            required
            v-model="count"
          />
        </div>
        <div v-for="(item,index) of optionList" :key="index">
          <div>
            <van-cell :title="item.name" :value="item.columns[item.picked]" @click="item.show=true;optionIndex=index"
                      style="text-align: left"/>
            <van-popup
              position="bottom"
              v-model="item.show"
            >
              <van-picker
                :columns="item.columns"
                @cancel="item.show = false"
                @change="optionSelect"
                @confirm="item.show = false"
                show-toolbar
              />
            </van-popup>
          </div>

        </div>
      </div>
      <van-tabs v-model="activeTab">
        <van-tab class="pannel" title="商品详情" v-if="productDetail">
          <img class="img" v-bind:src="$api.BASE_SERVER_URL+productDetail.defaultImg"/>
          <span class="content">{{productDetail.explain}}
        </span>
        </van-tab>
        <van-tab class="pannel" title="商品评论">
          <div class="comment">
            <div class="title" v-if="reviewsList">用户评论</div>
            <van-cell-group>
              <van-cell :key="id" :label="reviews.content" :title="reviews.user.nickname" :value="reviews.createTime"
                        style="text-align: left"
                        v-for="(reviews,id) in reviewsList"/>
            </van-cell-group>
            <div class="title">添加评论</div>
            <van-cell-group>
              <van-field
                autosize
                label="添加评论"
                placeholder="请输入评论"
                rows="3"
                type="textarea"
                v-model="content"
              />
            </van-cell-group>
            <div class="row">
              <van-rate v-model="star"/>
              <van-button @click="submit(2)" class="vBtn" round size="samll" type="primary">提交</van-button>
            </div>
          </div>
        </van-tab>
      </van-tabs>
    </div>
    <div class="bottom">
      <div class="row">
        <div class="con1">
          <div class="price1">￥{{productDetail.shopPrice / 100}}元</div>
          <div class="price2">￥{{productDetail.price / 100}}元</div>
        </div>
        <div @click="submit(0)" class="con2">加入购物车</div>
        <div @click="submit(1)" class="con3">立即购买</div>
      </div>
    </div>
  </div>
</template>

<script>
  import mHeader from './other/header.vue'

  export default {
    data () {
      return {
        //初始化
        activeTab: 0,
        count: 1,
        productDetail: null,
        // 商品选项
        optionIndex: 0,
        optionList: [
          {name: '包装', show: false, columns: ['粗壮', '西装', '精装'], picked: '1', price: [1, 23, 4], quantity: [1, 2, 3]},
          {name: '包装', show: false, columns: ['粗壮', '西装', '精装'], picked: '1', price: [1, 23, 4], quantity: [1, 2, 3]}
        ],
        //评论
        reviewsList: [],
        content: '',
        star: 0,
        //全局
        cartcount: 0,
        user: this.$store.getters.user,

      }
    },
    created: function () {
      if (this.user) this.$form (this.$api.API_URL_CART_COUNT, {userId: this.user.id}).then (res => {
        this.cartcount = res.data
      })
      this.productDetailList ()
      this.loadreviewsList ()
      this.getSkuList ()
    },
    methods: {
      productDetailList () {
        this.$get (this.$api.API_URL_CATALOG_PRODUCT_DETAILS + '/' + this.$route.params.id).then (res => {
          this.productDetail = res.data
        })
      },
      loadreviewsList () {
        this.$get (this.$api.API_URL_CATALOG_SHOW_REVIEW + '/' + this.$route.params.id).then (res => {
          this.reviewsList = res.data
        })
      },
      getSkuList () {
        this.$get (this.$api.API_URL_CATALOG_PRODUCT_SKU + '/' + this.$route.params.id).then (ret => {
          let sku = ret.data
          console.log (sku, Boolean (sku))
          if (sku.length) this.$get (this.$api.API_URL_CATALOG_PRODUCT_OPTION + '/' + this.$route.params.id)
          .then (res => {
            let item = res.data
            let data = []
            // 先开始遍历产品选项
            for (let i in item) {
              // 初始化数据
              let obj = {
                name: item[i].name,
                columns: item[i].optionValuesList.map (value => {
                  return value.name
                }),
                picked: 0,
                price: [],
                show: false,
                quantity: []
              }
              //比对sku列表中的映射关系 sku中的optionValueKeyGroup映射为option中的条目id
              for (let id of sku) {
                item[i].optionValuesList.forEach (value => {
                  if (parseInt (id.optionValueKeyGroup) == value.id) {
                    obj.price.push (id.price)
                    obj.quantity.push (id.quantity)
                  }
                })
              }
              data.push (obj)
            }
            this.optionList = data
          })
        })
      },
      optionSelect (picked, value, index) {
        this.optionList[this.optionIndex].picked = index
        this.productDetail.shopPrice = this.optionList[this.optionIndex].price[index]
      },
      submit (flag) {
        if (this.user) {
          if (this.cartcount >= 15) this.$dialog.alert ({message: '购物车已达上限!'})
          else if (this.count <= 0) this.$dialog.alert ({message: '请正确填写数量！'})
          else if (this.optionList.length && this.count > this.optionList[0].quantity[this.optionList[0].picked]) this.$notify ("库存不足!")
          else this.postForm (flag)
        } else this.$dialog.alert ({message: '请先登录再操作!'})
      },
      postForm (flag) {
        // 0 购物车 1 下单 2 评论
        if (flag == 2) {
          if (!(this.content.length && this.star)) this.$dialog.alert ({message: '请正确填写评论！'})
          else this.$form (this.$api.API_URL_CATALOG_ADD_REVIEW, {
            productId: this.$route.params.id,
            userId: this.user.id,
            content: this.content,
            stars: this.star
          }).then (ret => {
            if (ret.errorCode == 0) {
              this.content = ''
              this.loadreviewsList ()
              this.$dialog.alert ({message: '评价成功！等待管理员审核'})
            } else this.$dialog.alert ({message: '网络超时！'})
          })
          return
        }
        //todo 带商品选项提交未实现 不知道数据格式
        this.$form (this.$api.API_URL_CART_ADD, {
          productId: this.$route.params.id,
          userId: this.user.id,
          quantity: this.count
        }).then (ret => {
          if (ret.errorCode == 0) {
            if (flag == 0) this.$dialog.alert ({message: '添加成功！'})
            else this.$router.push ({path: '/samsara/payment'})
            this.$store.commit ('setStore', this.$store.state.count + this.count)
          } else this.$dialog.alert ({message: '添加失败！'})
        })
      }
    },
    components: {mHeader}
  }

</script>

<style scoped lang="stylus">
  .img
    width 100%

  .container
    .pannel
      padding-bottom 20px

      .comment
        .title
          text-align left
          margin 10px
          color #999

        .row
          padding 10px
          background white
          display flex
          align-items center
          justify-content space-between

          .vBtn
            padding 5px 10px
            height 2em
            line-height 1em

    .product
      .desc
        .title
          color black
          font-size 1.2em
          margin 20px

  .bottom
    position relative
    bottom 0
    width 100%

    .row
      display flex
      font-size 1.2em
      color white
      position relative

      .con1
        flex 3
        padding 10px
        background #eee

        .price1
          color #ff5000
          font-size 1em

        .price2
          font-size .6em
          color #999
          text-decoration line-through

      .con2
        flex 4
        padding 17px 0
        background-color #ff5000

      .con3
        flex 3
        padding 17px 0
        background-color #1aad19
</style>
