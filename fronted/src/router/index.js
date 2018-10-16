import Vue from 'vue'
import Router from 'vue-router'
import iView from 'iview'
import Utils from '@/libs/utils'
import { appRouters, otherRouters } from '@/router/routers'

Vue.use(Router)

export const router = new Router({
  mode: 'history',
  base: '/',
  routes: [
    ...appRouters,
    ...otherRouters
  ]
})

router.beforeEach((to, from, next) => {
  iView.LoadingBar.start()
  next()
})

router.afterEach(to => {
  let newPage = Utils.openNewPage(router.app, to.name)
  if (newPage) {
    if (newPage.children.length > 1) {
      router.app.$store.commit('setOpenNames', newPage.name)
    }
    let pathArr = Utils.pagePath(router.app, to.name)
    // console.log(pathArr)
    router.app.$store.commit('setCurrentPath', pathArr)
  }
  iView.LoadingBar.finish()

})