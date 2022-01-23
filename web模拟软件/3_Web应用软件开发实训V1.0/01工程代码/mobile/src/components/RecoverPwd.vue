<template>
  <div class="wrapper">
    <m-header>找回密码</m-header>
    <div class="container">
      <van-cell-group class="cell">
        <van-field
          label="电话号"
          type="number"
          v-model="phone"
          left-icon="phone-o"
        >
          <van-button slot="button" size="small" @click="send" type="primary">发送验证码</van-button>
        </van-field>

        <van-field
          v-model="sms"
          center
          clearable
          type="number"
          label="短信验证码"
          left-icon="sign"
          placeholder="请输入短信验证码"
        />

        <van-field
          label="密码"
          left-icon="closed-eye"
          type="password"
          v-model="userPassword"
        />
        <van-field
          label="确认密码"
          left-icon="closed-eye"
          type="password"
          v-model="rePassword"
        />
      </van-cell-group>
      <van-button @click="recovery" block class="cell" large size="large" square type="primary">找回密码</van-button>
    </div>
  </div>
</template>

<script>
  import header from './other/header.vue'

  export default {
    components: {'m-header': header},
    data () {
      return {
        sms: '',
        userPassword: '',
        rePassword: '',
        phone: '',
        test: /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/
      }


    },
    methods: {
      recovery () {
        if (!this.phone) this.$dialog.alert ({message: '请填写手机号❤'})
        else if (!this.userPassword) this.$dialog.alert ({message: '请填写密码❤'})
        else if (!this.test.test (this.phone)) this.$dialog.alert ({message: '请正确填写您的手机号码❤'})
        else if (this.phone.length > 11) this.$dialog.alert ({message: '手机号码必须为11位❤'})
        else if (!this.sms) this.$dialog.alert ({message: '请填写验证码❤'})
        else if (!this.userPassword) this.$dialog.alert ({message: '请填写密码❤'})
        else if (!this.rePassword) this.$dialog.alert ({message: '请重复密码❤'})
        else if (this.userPassword != this.rePassword) this.$dialog.alert ({message: '两次密码输入不一致❤'})
        else this.$form (this.$api.API_URL_USER_RECOVERY, {
            userName: this.phone,
            pwd: this.userPassword,
            confirmPassword: this.userPassword
          }).then (res => {
            if (res.errorCode == '0') {
              this.$dialog.alert ({message: '找回成功,请用新密码登录'}).then (ree => {
                this.$router.push ({path: '/login'})
              })
            } else this.$dialog.alert ({message: '找回失败'})
          })
      },
      send () {
        if (!this.phone) this.$dialog.alert ({message: '请填写手机号❤'})
        else if (!this.test.test (this.phone)) this.$dialog.alert ({message: '请正确填写您的手机号码❤'})
        else if (this.phone.length > 11) this.$dialog.alert ({message: '手机号码必须为11位❤'})
        else this.$form (this.$api.API_URL_CUSTOMER, {userName: this.phone}).then (res => {
            if (res.errorCode == '-3') this.$form (this.$api.SEND_SMS, {userName: this.phone}).then (ret => {
              if (ret.errorCode == '0') this.$dialog.alert ({message: '短信已发送'}).then (() => this.sms = ret.data)
              else this.$dialog.alert ({message: '短信发送失败'})
            })
            else this.$dialog.alert ({message: '您已注册,请登录'})
          })
      },

    }
  }

</script>

<style scoped lang="stylus">
  .container
    margin 20vh 10px

    .cell
      margin-bottom 20px
</style>
