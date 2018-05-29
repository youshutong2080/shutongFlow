import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'
import { otherRouter, appRouters } from '../router/routers'

Vue.use(Vuex)

const store = new Vuex.Store({
  state: {
    menuList: [...appRouters],
    routers: [otherRouter, ...appRouters],
    menulist: [],
    currentPath: [],
    openNames: [],
    userinfo: {}
  },
  getters: {},
  mutations: {
    updateToken: (state, token) => {
      state.token = token
      localStorage.token = token
    },
    setOpenNames: (state, name) => {
      state.openNames = [name]
    },
    setCurrentPath: (state, pathArr) => {
      state.currentPath = pathArr
    }
  },
  actions: {
    api_workflows: context => {
      return new Promise((resolve, reject) => {
        axios.get('/api/v1.0/workflows').then(resp => {
          resolve(resp)
        }).catch(error => {
          reject(error)
        })
      })
    },
    api_init_state: (context, workflow) => {
      return new Promise((resolve, reject) => {
        axios.get(`/api/v1.0/workflows/${workflow}/init_state?username=scm`).then(resp => {
          resolve(resp)
        }).catch(error => {
          reject(error)
        })
      })
    },
    api_post_ticket: (context, data) => {
      return new Promise((resolve, reject) => {
        axios.post('/api/v1.0/tickets', data).then(resp => {
          resolve(resp)
        }).catch(error => {
          reject(error)
        })
      })
    },
    api_get_ticket_list: (context, params) => {
      var url = ''
      let keys = Object.keys(params)
      var query = []
      if (keys.length > 0) {
        for (let i = 0; i < keys.length; i++) {
          query.push(`${keys[i]}=${params[keys[i]]}`)
        }
        url = `/api/v1.0/tickets?${query.join('&')}`
      } else {
        url = '/api/v1.0/tickets'
      }
      console.log(url)
      return new Promise((resolve, reject) => {
        axios.get(url).then(resp => {
          resolve(resp)
        }).catch(error => {
          reject(error)
        })
      })
    },
    api_get_ticket_detail: (context, params) => {
      return new Promise((resolve, reject) => {
        axios.get(`/api/v1.0/tickets/${params.id}?username=${params.username}`).then(resp => {
          resolve(resp)
        }).catch(error => {
          reject(error)
        })
      })
    },
    api_get_ticket_step_list: (context, ticket_id) => {
      return new Promise((resolve, reject) => {
        axios.get(`/api/v1.0/tickets/${ticket_id}/flowsteps?username=scm`).then(resp => {
          resolve(resp)
        }).catch(error => {
          reject(error)
        })
      })
    },
    api_get_ticket_transiton_list: (context, ticket_id) => {
      return new Promise((resolve, reject) => {
        axios.get(`/api/v1.0/tickets/${ticket_id}/flowlogs?username=scm`).then(resp => {
          resolve(resp)
        }).catch(error => {
          reject(error)
        })
      })
    }
  }
})

export default store