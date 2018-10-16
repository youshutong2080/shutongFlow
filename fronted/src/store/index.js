
import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'
import urls from '@/store/urls'
import Utils from '@/libs/utils'
import { appRouters } from '@/router/routers'

Vue.use(Vuex)

const store = new Vuex.Store({
  state: {
    routers: [...appRouters],
    currentPath: [],
    openNames: []
  },
  getters: {
    menuList: state => {
      return Utils.getMenuList(appRouters)
    }
  },
  mutations: {
    setOpenNames: (state, name) => {
      state.openNames = [name]
    },
    setCurrentPath: (state, pathArr) => {
      state.currentPath = pathArr
    }
  },
  actions: {}
})

export default store