import Vue from 'vue'
import Vuex from 'vuex'

Vue.use (Vuex)

export default new Vuex.Store ({
  state: {
    keyword: '',
    user: null,
    count: 0,
    address: null
  },
  getters: {
    user (state) {
      return state.user ? state.user : JSON.parse (localStorage.getItem ('user'))
    }
  },
  mutations: {
    setUser (state, user) {
      if (user) {
        state.user = user
        localStorage.setItem ('user', JSON.stringify (user))
      } else {
        state.user = null
        localStorage.removeItem ('user')
      }

    },
    setStore (state, count) {
      state.count = count
    },
    setAddress (state, item) {
      state.address = {
        id: item.id,
        name: item.name,
        tel: item.mobile,
        addressDetail: item.address,
      }
    }
  },
  actions: {}
})
