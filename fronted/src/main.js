// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import i18n from './locale'
import {router} from './router/index'
import iView from 'iview'
import tinymce from 'vue-tinymce-editor'
import {RadioGroup, Radio} from 'element-ui'
import 'iview/dist/styles/iview.css'
import axios from 'axios'
import store from './store/index'

Vue.component('tinymce', tinymce)
Vue.component(RadioGroup.name, RadioGroup)
Vue.component(Radio.name, Radio)

Vue.config.productionTip = false

Vue.use(iView)

axios.interceptors.request.use(config => {
  if (localStorage.token) {
    config.headers.Authorization = 'JWT ' + localStorage.token
  }
  return config
}, error => {
  return Promise.reject(error)
})

axios.interceptors.response.use(response => {
  return response
}, error => {
  if (error.response) {
    switch (error.response.status) {
      case 401:
        store.commit('removeStorage')
        router.push({
          path: '/login',
          query: {
            redirect: router.history.current.path
          }
        })
        break
      default:
        return Promise.reject(error)
    }
  }
  return Promise.reject(error)
})

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  store,
  i18n,
  components: { App },
  template: '<App/>'
})
