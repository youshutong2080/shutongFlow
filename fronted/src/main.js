import Vue from 'vue'
import iView from 'iview'
import './assets/theme/index.less'
// import 'iview/dist/styles/iview.css'
import App from './App.vue'
import { router } from '@/router/index'
import store from '@/store/index'
import '@/libs/fontawesome5.js'

Vue.config.productionTip = true
Vue.use(iView)

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
