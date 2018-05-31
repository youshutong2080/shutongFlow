import Vue from 'vue'
import Router from 'vue-router'
import iView from 'iview'
import store from '../store'
import {routers, appRouters, otherRouter} from './routers'
import Utils from '../utils/index'

Vue.use(Router)

export const router = new Router({
  mode: 'history',
  routes: routers
})


router.beforeEach((to, from, next) => {
  iView.LoadingBar.start()
  let now = new Date()
  if (!['login', '404'].includes(to.name)) {
    if (localStorage.token) {
      store.commit('decodeToken')
      if (store.state.expire >= now) {
        next()
      } else {
        router.push({name: 'login'})
      }
    } else {
      router.push({name: 'login'})
    }
  } else {
    next()
  }
})

router.afterEach(to => {
  let newPage = Utils.openNewPage(router.app, to.name)
  if (newPage) {
    if (newPage.children.length > 1) {
      router.app.$store.commit('setOpenNames', newPage.name)
    }
    let pathArr = Utils.pagePath(router.app, to.name)
    router.app.$store.commit('setCurrentPath', pathArr)
  }
  iView.LoadingBar.finish()
})