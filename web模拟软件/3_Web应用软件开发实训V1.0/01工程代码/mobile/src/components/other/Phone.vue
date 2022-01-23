<template>
  <div class="div">
    <mHeader>常用联系人</mHeader>

    <van-address-list
      :list="list"
      @add="$router.push({path:'/samsara/address/0'})"
      @edit="onEdit"
      @select="select"
      v-model="chosenAddressId"
    />

  </div>
</template>

<script>
  import mHeader from './header'

  export default {
    methods: {
      onEdit (item, index) {
        this.$store.commit ('setAddress', item)
        this.$router.push ('/samsara/address/1')
      },
      select () {
        this.$form (this.$api.API_URL_CONTECT_DEFAULT, {
          id: this.chosenAddressId,
          userId: this.$store.getters.user.id
        }).then (res => {
          if (res.errorCode == 0) this.$toast ('设置成功')
          else this.$dialog.alert ({message: '网络超时'})
        })
      }
    },
    mounted () {
      this.$form (this.$api.API_URL_CONTECT, {
        userId: this.$store.getters.user.id
      }).then (res => {
        let list = []
        if (res.errorCode == 0) {
          res.data.data.forEach (value => {
            if (value.contactFlag) this.chosenAddressId = value.id
            let obj = Object.assign ({}, value)
            obj.tel = obj.mobile
            list.push (obj)
          })
          this.list = list
        } else this.$dialog.alert ({message: '网络超时'})
      })

    },
    components: {mHeader},
    data () {
      return {
        chosenAddressId: '1',
        list: [
          // {
          //   id: '1',
          //   name: '张三',
          //   tel: '13000000000',
          //   address: '浙江省杭州市西湖区文三路 138 号东方通信大厦 7 楼 501 室'
          // },
          // {
          //   id: '2',
          //   name: '李四',
          //   tel: '1310000000',
          //   address: '浙江省杭州市拱墅区莫干山路 50 号'
          // }
        ]
      }
    }
  }

</script>

<style lang="stylus" scoped>

</style>
