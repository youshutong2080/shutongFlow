import LayOut from '../components/LayOut'

export const loginRouter = {
  path: '/login',
  name: 'login',
  component: () => import('../components/Login.vue'),
  meta: {isAdmin: true, hidden: true}
}

export const otherRouter = {
  path: '/',
  name: 'otherRouter',
  component: LayOut,
  redirect: '/ticket/new',
  children: [
    {path: 'ownspace', name: 'ownspace_index', title: '个人中心', component: () => import('../components/OwnSpace.vue')},
    {path: 'message', name: 'message_index', title: '消息中心', component: () => import('../components/Message.vue')},
  ],
  meta: {isAdmin: false, hidden: true}
}

export const appRouters = [
  {
    path: '/ticket',
    name: 'ticket',
    title: '工单系统',
    icon: 'clipboard',
    component: LayOut,
    children: [
      {path: 'new', name: 'new', title: '新建工单', icon: 'mic-c', component: () => import('../components/ticket/New.vue'), meta: {isAdmin: false, hidden: false}},
      {path: 'myself', name: 'myself', title: '我创建的', icon: 'ios-flame', component: () => import('../components/ticket/Myself.vue'), meta: {isAdmin: false, hidden: false}},
      {path: 'todo', name: 'todo', title: '我的待办', icon: 'android-attach', component: () => import('../components/ticket/Todo.vue'), meta: {isAdmin: false, hidden: false}},
      {path: 'audit', name: 'audit', title: '我相关的', icon: 'android-bookmark', component: () => import('../components/ticket/Audit.vue'), meta: {isAdmin: false, hidden: false}},
      {path: 'all', name: 'all', title: '所有工单', icon: 'android-list', component: () => import('../components/ticket/All.vue'), meta: {isAdmin: true, hidden: false}},
      {path: 'todo/:id', name: 'todo-detail', title: '工单详情', component: () => import('../components/ticket/TicketDetail.vue')},
      {path: 'detail/:id', name: 'detail', title: '工单详情', icon: 'android-list', component: () => import('../components/ticket/TicketDetail.vue'), meta: {isAdmin: true, hidden: true}},
    ],
    meta: {isAdmin: false, hidden: false}
  },
  {
    path: '/manage',
    name: 'manage',
    title: '系统管理',
    icon: 'ios-cog',
    component: LayOut,
    children: [
      {path: 'workflow', name: 'workflow', title: '流程管理', icon: 'network', component: () => import('../components/manage/Workflow.vue'), meta: {isAdmin: true, hidden: false}},
      {path: 'log', name: 'log', title: '任务日志', icon: 'ios-book', component: () => import('../components/manage/Log.vue'), meta: {isAdmin: true, hidden: false}}
    ],
    meta: {isAdmin: true}
  }
]

export const routers = [
  otherRouter,
  ...appRouters,
  loginRouter
]