import Vue from 'vue'
import Router from 'vue-router'
import Home from '@/components/Home'
import Login from '@/components/Login'
import Register from '@/components/Register'
import Forgot from '@/components/Forgot'
import Categories from '@/components/Categories'
import Category from '@/components/Category'
import Product from '@/components/Product'

import OrderList from '@/components/account/OrderList' //订单历史
import OrderDetail from '@/components/account/OrderDetail' //订单历史
import WishList from '@/components/account/Wishlist'  //收藏夹
import ContactList from '@/components/account/ContactList'
import UserSetting from '@/components/account/UserSetting'
import EWallet from '@/components/account/EWallet'
import Cart from '@/components/Cart'
import Payment from '@/components/Payment'
import PaymentResult from '@/components/PaymentResult'
import Search from '@/components/Search'

import NotFound from '@/components/NotFound'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Home',
      component: Home
    },
    {
      path: '/login',
      name: 'Login',
      component: Login
    },
    {
      path: '/register',
      name: 'Register',
      component: Register
    },
    {
      path: '/forgot',
      name: 'Forgot',
      component: Forgot
    },
    {
      path: '/product',
      name: 'Product',
      component: Product
    },
    {
      path:'/category',
      name:'Category',
      component:Category
    },
    {
      path:'/categories',
      name:'Categories',
      component:Categories
    },
    {
      path: '/account/order/list', //订单历史
      name: 'OrderList',
      component: OrderList
    },
    {
      path: '/account/order/detail', //订单详情
      name: 'OrderDetail',
      component: OrderDetail
    },
    {
      path: '/account/wishlist',  //收藏夹
      name: 'WishList',
      component: WishList
    },
    {
      path: '/account/contact/list', //常用联系人
      name: 'ContactList',
      component: ContactList
    },
    {
      path: '/account/setting', //个人设置
      name: 'UserSetting',
      component: UserSetting
    },
    {
      path: '/account/ewallet',
      name: 'EWallet',
      component: EWallet
    },
    {
      path: '/account/paymentResult',
      name: 'PaymentResult',
      component: PaymentResult
    },
    {
      path: '/account/cart',
      name: 'Cart',
      component: Cart
    },
    {
      path: '/account/payment',
      name: 'Payment',
      component: Payment
    },
    {
      path: '/search',
      name: 'Search',
      component: Search
    },{
      path: '*',
      name:'NotFound',
      component:NotFound
    }
  ]
})
