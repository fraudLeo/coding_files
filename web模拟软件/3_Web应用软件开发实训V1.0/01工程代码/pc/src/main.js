import Vue from 'vue'
import 'es6-promise/auto'
import Vuex from 'vuex'
import App from './App'
import router from './router'
import Storage from '@/utils/StorageUtil'
import API from '@/utils/APIUtil'
import Toastr from '@/assets/toastr/toastr.min'
import element from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css';
//定义提示框样式
Toastr.options={
  closeButton:true,
  positionClass:'toast-top-center',
  timeOut:1500
}
//定义全局变量
Vue.prototype.Storage = Storage;
Vue.prototype.API = API;
Vue.prototype.Toastr = Toastr;
//导入头、尾组件
import Header from '@/components/commons/Header'
import Footer from '@/components/commons/Footer'
//导入Toastr CSS样式
import '@/assets/toastr/toastr.min.css'

Vue.config.productionTip = false
//使用Vuex状态管理器
Vue.use(Vuex)
Vue.use(element)

const store = new Vuex.Store({
  state:{
      keyword:'',
      user:null,
      cartCount:null,
      cartProductId:null
  },
  mutations:{
    setKeyword(state,keyword){
      state.keyword = keyword
    },
    setUser(state,user){
      state.user = user
    },
    setCartCount(state,cartCount){
      state.cartCount = cartCount
    },
    setCartProductId(state,productId){
      state.cartProductId = productId
    }
  }
})


//路由拦截
router.beforeEach(function(to,from,next){
  var user = Storage.Local.get('User');
  if(!user){
    if(to.path.indexOf('/account')!=-1){
      router.push({
        path:'/login',
        name:'Login',
        params:{
          msg:'您还未登录，请登录！'
        }
      })
    }
  }
  next(true)
})

//注册组件
Vue.component('Header',Header);
Vue.component('Footer',Footer);

new Vue({
  el: '#app',
  store,
  router,
  components: {App},
  template:'<App/>'
})
