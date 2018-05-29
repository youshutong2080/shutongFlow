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
          {path: '', name: name, title: pathArr.children[i].title}
        ]
      }
    }
  } else {
    if (pathArr.children.length > 1) {
      for (let i = 0; i < pathArr.children.length; i++) {
        if (pathArr.children[i].name === name) {
          currentPath = [
            {path: '', name: pathArr.name, title: pathArr.title},
            {path: '', name: name, title: pathArr.children[i].title}
          ]
        }
      }
    } else {
      if (pathArr.children[0].name === 'home_index') {
        currentPath = [
          {path: '', name: name, title: pathArr.children[0].title}
        ]
      } else {
        currentPath = [
          {path: '', name: name, title: pathArr.children[0].title},
        ]
      }
    }
  }
  return currentPath
}

Utils.html_encode = function (str) {
  var s = ""
  if (str.length == 0) return ""
  s = str.replace(/&/g, "&gt;")
  s = s.replace(/</g, "&lt;")
  s = s.replace(/>/g, "&gt;")
  s = s.replace(/ /g, "&nbsp;")
  s = s.replace(/\'/g, "&#39;")
  s = s.replace(/\"/g, "&quot;")
  s = s.replace(/\n/g, "<br>")
  return s
}

export default Utils