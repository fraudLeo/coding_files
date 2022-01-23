<template>
  <div class="Address">
    <mHeader>地址编辑</mHeader>
    <van-address-edit
      :address-info="info"
      :area-list="areaList"
      @delete="onDelete"
      @save="onSave"
      show-delete
    />
  </div>
</template>

<script>
  import mHeader from './other/header'
  import areaList from './other/area'

  export default {
    name: 'Address',
    data() {
      return {
        areaList,
        info: {
          id: '1',
          name: '张三',
          tel: '13000000000',
          addressDetail: '浙江省杭州市西湖区文三路 138 号东方通信大厦 7 楼 501 室',
          isDefault: true
        }
      }
    },
    props: {},
    methods: {
      onSave(res) {
        if (parseInt(this.$route.params.id)) this.$form(this.$api.API_URL_CONTECT_UPDATE, {
          userId: this.$store.getters.user.id,
          id: res.id,
          name: res.name,
          mobile: res.tel,
          address: `${res.province}-${res.city}-${res.county}-${res.addressDetail}`
        }).then(res => {
          if (res.errorCode == 0) this.$router.push({path: '/samsara/concat'})
          else this.$dialog.alert({message: '网络超时'})
        })
        else this.$form(this.$api.API_URL_CONTECT_ADD, {
          userId: this.$store.getters.user.id,
          name: res.name,
          mobile: res.tel,
          address: `${res.province}-${res.city}-${res.county}-${res.addressDetail}`
        }).then(res => {
          if (res.errorCode == 0) this.$router.push({path: '/samsara/concat'})
          else this.$dialog.alert({message: '网络超时'})
        })
      },
      onDelete(res) {
        if (res.id) this.$form(this.$api.API_URL_CONTECT_REMOVE, {
          id: res.id,
          userId: this.$store.getters.user.id
        }).then(res => {
          if (res.errorCode == 0) this.$router.push({path: '/samsara/concat'})
          else this.$dialog.alert({message: '网络超时'})
        })
        else this.$router.push({path: '/samsara/concat'})
      }
    },
    components: {mHeader},
    mounted() {
      if (parseInt(this.$route.params.id)) this.info = this.$store.state.address
      else this.info = {}
    },
    beforeDestroy() {
    }
  }
</script>

<style scoped lang='stylus'>

</style>
