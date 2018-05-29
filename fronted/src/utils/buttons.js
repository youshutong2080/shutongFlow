let Buttons = {}

Buttons.detailButton = function (vm, h, params) {
  return h('Button', {
    props: {
      type: 'primary',
      size: 'small',
      icon: 'ios-paper'
    },
    style: {
      margin: '2px'
    },
    on: {
      click: () => {
        vm.$router.push({
          name: 'detail',
          params: {
            id: params.row.id
          }
        })
      }
    }
  }, '详情')
}

Buttons.modifyButton = function (vm, h, params, name) {
  return h('Button', {
    props: {
      type: 'warning',
      size: 'small',
      icon: 'ios-cog'
    },
    style: {
      margin: '2px'
    },
    on: {
      // click: () => {
      //   if (params.row.type === 'url') {
      //     vm.$router.push({
      //       name: 'ticket-url-modify',
      //       params: {id: params.row.id},
      //       query: {view: name}
      //     })
      //   } else if (params.row.type === 'group') {
      //     vm.$router.push({
      //       name: 'ticket-group-modify',
      //       params: {id: params.row.id},
      //       query: {view: name}
      //     })
      //   }
      // }
    }
  }, '修改')
}

Buttons.deleteButton = function (vm, h, params) {
  return h('Button', {
    props: {
      type: 'error',
      size: 'small',
      icon: 'trash-a'
    },
    on: {
      // click: () => {
      //   vm.deleteModal = true
      //   vm.row = params.row
      //   vm.index = params.index
      // }
    },
    style: {
      margin: '2px'
    }
  }, '删除')
}

Buttons.auditButton = function (vm, h, params) {
  return h('Button', {
    props: {
      type: 'primary',
      size: 'small',
      icon: 'hammer'
    },
    style: {
      margin: '2px'
    },
    on: {
      // click: () => {
        // vm.$router.push({
        //   name: 'audit-ticket',
        //   params: {
        //     id: params.row.id
        //   }
        // })
      // }
    }
  }, '审批')
}

export default Buttons