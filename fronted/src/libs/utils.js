let Utils = {}

Utils.openNewPage = function (vm, name) {
  let openName = vm.$store.state.routers.filter(item => {
    if (item.children.length > 1) {
      for (let i = 0; i < item.children.length; i++) {
        if (item.children[i].name === name) {
          return true
        }
      }
    } else {
      return item.children[0].name === name
    }
  })[0]
  return openName
}

Utils.pagePath = function (vm, name) {
  let currentPath = []
  let pathArr = Utils.openNewPage(vm, name)
  if (pathArr.name === 'otherRouter') {
    for (let i = 0; i < pathArr.children.length; i++) {
      if (pathArr.children[i].name === name) {
        currentPath = [
          {path: '/', name: 'home', title: '首页'},
          {path: '', name: name, title: pathArr.children[i].meta.title}
        ]
      }
    }
  } else {
    if (pathArr.children.length > 1) {
      for (let i = 0; i < pathArr.children.length; i++) {
        if (pathArr.children[i].name === name) {
          currentPath = [
            {path: '/', name: 'home', title: '首页'},
            {path: '', name: pathArr.name, title: pathArr.meta.title},
            {path: '', name: name, title: pathArr.children[i].meta.title}
          ]
        }
      }
    } else {
      currentPath = [
        {path: '/', name: 'home', title: '首页'},
        {path: '', name: name, title: pathArr.children[0].meta.title},
      ]
    }
  }
  return currentPath
}

Utils.hasChild = (item) => {
  return item.children && item.children.length > 1
}

Utils.showMenuChild = (item, access) => {
  if (item.meta && item.meta.access && item.meta.access.length) {
    if (item.meta.access.includes(access)) {
      return true
    } else {
      return false
    }
  } else {
    return true
  }
}

Utils.getMenuList = (list, access) => {
  let res = []
  list.forEach((item, index) => {
    if (item.meta && !item.meta.hidden) {
      let obj = {
        name: item.name,
        meta: item.meta
      }
      if (Utils.hasChild(item) && Utils.showMenuChild(item, access)) {
        obj.children = Utils.getMenuList(item.children, access)
      }
      if (Utils.showMenuChild(item, access)) {
        res.push(obj)
      }
    }
  })
  return res
}


export default Utils