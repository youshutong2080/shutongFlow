export const otherRouters = [
  {
    path: '/',
    name: 'layout',
    component: () => import('@/views/LayOut.vue'),
    redirect: { name: 'index' },
    meta: {auth: false},
    children: [
      {
        path: '/index',
        name: 'index',
        component: () => import('@/views/Index.vue'),
        meta: { auth: false }
      }
    ]
  }
]

export const appRouters = [
  {
    path: '/ticket',
    name: 'ticket',
    component: () => import('@/views/LayOut.vue'),
    redirect: { name: 'ticket-new' },
    meta: { auth: false, hidden: false, title: '工单系统', icon: ['fas', 'file-signature'] },
    children: [
      {
        path: 'new',
        name: 'ticket-new',
        component: () => import('@/views/ticket/New.vue'),
        meta: { auth: false, hidden: false, title: '新建工单', icon: ['fas', 'pen-alt'] }
      },
      {
        path: 'todo',
        name: 'ticket-todo',
        component: () => import('@/views/ticket/Todo.vue'),
        meta: { auth: false, hidden: false, title: '待办工单', icon: ['fas', 'paperclip'] }
      },
      {
        path: 'related',
        name: 'ticket-related',
        component: () => import('@/views/ticket/Related.vue'),
        meta: { auth: false, hidden: false, title: '关联工单', icon: ['fas', 'bookmark'] }
      },
      {
        path: 'all',
        name: 'ticket-all',
        component: () => import('@/views/ticket/All.vue'),
        meta: { auth: false, hidden: false, title: '所有工单', icon: ['fas', 'clipboard-list'] }
      }
    ]
  },
  {
    path: '/scm',
    name: 'scm',
    component: () => import('@/views/LayOut.vue'),
    meta: { auth: false, hidden: false, title: '配置管理', icon: ['fab', 'whmcs'] },
    children: [
      {
        path: 'node',
        name: 'node',
        component: () => import('@/views/scm/Node.vue'),
        meta: { auth: false, hidden: false, title: '节点管理', icon: ['fas', 'cube'] }
      },
      {
        path: 'flow',
        name: 'flow',
        component: () => import('@/views/scm/Flow.vue'),
        meta: { auth: false, hidden: false, title: '流程管理', icon: ['fas', 'project-diagram'] }
      }
    ]
  },
  {
    path: '/log',
    name: 'action',
    component: () => import('@/views/LayOut.vue'),
    redirect: { name: 'log-action' },
    meta: { auth: false, hidden: false, title: '日志管理', icon: ['fas', 'receipt']},
    children: [
      {
        path: 'operation',
        name: 'operation',
        component: () => import('@/views/log/Operation.vue'),
        meta: { auth: false, hidden: false, title: '操作日志', icon: ['far', 'hand-point-down'] }
      },
      {
        path: 'task',
        name: 'task',
        component: () => import('@/views/log/Task.vue'),
        meta: { auth: false, hidden: false, title: '任务日志', icon: ['fas', 'scroll']}
      }
    ]
  }
]