<template>
  <div class="car">
    <vHeader>我的购物车</vHeader>
    <div class="div" v-if="cartList">
      <van-notice-bar
        :text="'当前购物车:'+count+'件商品,合计金额:'+(cartList.price)/100"
        left-icon="volume-o"
      />
      <div :key="index0" class="cell0" style="margin-top: 20px;text-align: left"
           v-for="(item0,index0) of cartList.orderItemList">
        <div :key="index1" class="cell1" v-for="(item1,index1) of item0.productList">
          <van-swipe-cell :on-close="onClose" :right-width="65" @click="removeIndex=item0.id">
            <van-cell-group>
              <van-cell :value="item1.name" title="商品名称"/>
              <van-cell :value="(item1.price)/100" title="单价"/>
              <van-cell :value="item0.quantity" title="数量"/>
            </van-cell-group>
            <span slot="right">删除</span>
          </van-swipe-cell>
        </div>
      </div>
      <van-button @click="$router.push({path:'/samsara/payment'})" block class="cell" large size="large" square
                  style="margin-top: 20px" type="primary">立即支付
      </van-button>
      <van-button @click="removeAll" block class="cell" size="large" square style="margin-top: 20px" type="danger">清空购物车
      </van-button>
    </div>
  </div>
</template>

<script>
  import vHeader from './other/header'

  export default {
    components: {
      vHeader
    },
    data() {
      return {
        cartList: {},
        count: 0,
        removeIndex: '0'
      }
    },
    created() {
      if (!this.$store.getters.user) this.$router.push({path: '/login'})
      else this.getList()
    },
    methods: {
      getList() {
        this.$form(this.$api.API_URL_CART, {
          userId: this.$store.getters.user.id,
          type: 1
        }).then(res => {
          let i = 0
          if (res.data) res.data.orderItemList.forEach(value => {
            i += value.quantity
          })
          this.cartList = res.data
          this.count = i
        })
      },
      onClose(clickPosition, instance) {
        switch (clickPosition) {
          case 'left':
          case 'cell':
          case 'outside':
            instance.close();
            break;
          case 'right':
            this.$dialog.confirm({
              message: '确定删除吗？'
            }).then(() => {
              this.remove(this.removeIndex)
              instance.close();
            });
            break;
        }
      },
      removeAll() {
        this.$form(this.$api.API_URL_CART_ITEMS_REMOVEALL, {
          userId: this.$store.getters.user.id
        }).then(res => {
          if (res.errorCode == 0) this.$dialog.alert({message: '删除成功！'})
          else this.$dialog.alert({message: '删除失败！'})
          this.getList()
        })
      },
      remove(id) {
        this.$form(this.$api.API_URL_CART_ITEMS_REMOVE, {
          id: id,
          userId: this.$store.getters.user.id
        }).then(res => {
          if (res.errorCode == 0) this.$dialog.alert({message: '删除成功！'})
          else this.$dialog.alert({message: '删除失败！'})
          this.getList()
        })
      }
    }
  }

</script>

<style lang="stylus">
  .van-swipe-cell {
    &__left,
    &__right {
      color: white;
      font-size: 15px;
      width: 65px;
      padding-top 13%
      display: inline-block;
      text-align: center;
      line-height: 44px;
      background-color: red;
    }
  }
</style>
