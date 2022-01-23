<template>
  <div class="div">
    <mHeader>会员设置</mHeader>
    <van-cell-group style="margin-top: 20px;text-align: left">
      <van-cell title="完善基本信息"/>
      <van-field
        label="昵称"
        placeholder="请输入昵称"
        required
        type="text"
        v-model="name"/>
      <van-field
        label="Email"
        placeholder="请输入邮箱"
        required
        type="text"
        v-model="email"/>
    </van-cell-group>
    <van-button @click="updateUser" block class="cell" plain size="large" square style="margin-top: 20px"
                type="primary">修改用户信息
    </van-button>

    <van-cell-group style="margin-top: 20px;text-align: left">
      <van-cell title="密码修改"/>
      <van-field
        label="原始密码"
        placeholder="请输入密码"
        required
        type="text"
        v-model="pass_"
      />
      <van-field
        label="新密码"
        placeholder="请输入密码"
        required
        type="password"
        v-model="pass__"
      />
      <van-field
        label="确认密码"
        placeholder="请输入密码"
        required
        type="password"
        v-model="pass___"
      />
    </van-cell-group>
    <van-button @click="updatePass" block class="cell" plain size="large" square style="margin-top: 20px"
                type="primary">修改密码
    </van-button>

  </div>
</template>

<script>
  import mHeader from './header'

  export default {
    name: 'setting',
    components: {mHeader},
    data () {
      return {
        name: this.$store.getters.user.nickname,
        email: this.$store.getters.user.email,
        pass_: '',
        pass__: '',
        pass___: '',
      }
    },
    methods: {
      updateUser () {
        this.$form (this.$api.API_URL_UPDATE_CUSTOMER, {
          userId: this.$store.getters.user.id,
          nickname: this.name,
          email: this.email
        }).then (res => {
          if (res.errorCode == 0) this.$dialog.alert ({message: '修改成功'})
          else this.$dialog.alert ({message: '网络超时！'})
        })
      },
      updatePass () {
        if (this.pass__ == this.pass___ && this.pass__.length)
          this.$form (this.$api.API_URL_CHANGE_PASSWORD, {
            userId: this.$store.getters.user.id,
            oldpassword: this.pass_,
            rpassword: this.pass__
          }).then (res => {
            if (res.errorCode == 0) this.$dialog.alert ({message: '修改成功'})
            else this.$dialog.alert ({message: '当前密码不正确'})
          })
        else this.$dialog.alert ({message: '请重新核对新密码'})
      }
    },
    created () {


    },
  }

</script>

<style lang="stylus" scoped>

</style>
