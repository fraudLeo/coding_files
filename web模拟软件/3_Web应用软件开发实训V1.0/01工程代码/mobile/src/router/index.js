
/*global Vue*/
import Router from 'vue-router'
import Index from '@/components/Index'
import Home from '@/components/Home'
import Shopcar from '@/components/ShopCar'
import Mine from '@/components/Mine'
import Login from '@/components/Login'
import Register from '@/components/Register'
import Orderhistory from '@/components/other/Orderhistory'
import Collection from '@/components/other/Collection'
import Phone from '@/components/other/Phone'
import Vip from '@/components/other/Vip'
import Wallet from '@/components/other/Wallet'
import OrderlistDetail from '@/components/other/OrderlistDetail'
import ProductDetail from '@/components/ProductDetail'
import Category from '@/components/Category'
import Child from '@/components/Child'
import Main from '@/components/Main'
import Payment from '@/components/Payment'
import Address from '@/components/Address'
import Search from '@/components/Search'
import RecoverPwd from '@/components/RecoverPwd'
import CategoryList from '@/components/CategoryList'
//todo 子路由路径不能有/
export default new Router ({
  mode: 'hash',
  routes: [
    {
      path: '/',
      component: Main,
      children: [
        {
          path: '',
          component: Index
        },
        {
          path: 'home',
          component: Home
        },
        {
          path: 'car',
          component: Shopcar,
        },
        {
          path: 'me',
          component: Mine,
        },
        {
          path: 'login',
          component: Login,
        },
        {
          path: 'reg',
          component: Register
        },
        {
          path: 'recover',
          component: RecoverPwd
        }
      ]
    },
    {
      path: '/samsara',
      component: Child,
      children: [
        {
          path: 'productdetail/:id',
          name: 'ProductDetail',
          component: ProductDetail
        },
        {
          path: 'category/:id',
          name: 'Category',
          component: Category
        },
        {
          path: 'categoryList',
          name: 'CategoryList',
          component: CategoryList
        },
        {
          path: 'search/:name',
          component: Search
        },
        {
          path: 'payment',
          component: Payment
        },
        {
          path: 'history',
          component: Orderhistory
        },
        {
          path: 'collect',
          component: Collection
        },
        {
          path: 'concat',
          component: Phone
        },
        {
          path: 'wallet',
          component: Wallet
        },
        {
          path: 'setting',
          component: Vip
        },
        {
          path: 'order/:id',
          component: OrderlistDetail
        },
        {
          path: 'address/:id',
          component: Address
        }
      ]
    }
  ]
})
