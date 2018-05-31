<template>
  <div class="layout">
    <div class="sidebar-menu-con" :style="{width: shrink ? '60px' : '230px', overflow: shrink ? 'visible' : 'auto'}">
      <shrinkable-menu :shrink="shrink" :menu-list="menuList" :open-names="openNames" @on-change="handleChange">
        <div class="logo-con" slot="top">
          <span v-if="shrink" style="line-height: 60px; font-weight: 800; font-size: 20px; color: white;">Loon</span>
          <span v-if="!shrink" style="line-height: 60px; font-weight: 800; font-size: 20px; color: white;">LoonFlow</span>
        </div>
      </shrinkable-menu>
    </div>
    <div class="layout-header-con" :style="{paddingLeft: shrink ? '60px' : '230px'}">
      <div class="layout-header">
        <div class="navicon-con">
          <Button type="text" :style="{transform: 'rotateZ('+ (this.shrink ? '90' : '0') +'deg)'}" @click="toggleSidebar">
            <Icon name="navicon" type="navicon" size="32"></Icon>
          </Button>
        </div>
        <div class="header-middle-con">
          <div class="layout-breadcrumb">
            <breadcrumb-nav :currentPath="currentPath">
              <template slot="icon">
                <Icon type="arrow-down-b"></Icon>
              </template>
            </breadcrumb-nav>
          </div>
        </div>
        <div class="header-avator-con">
          <message-tip></message-tip>
          <div class="user-dropdown-menu-con">
            <Row type="flex" justify="end" align="middle" class="user-dropdown-innercon">
              <Dropdown transfer trigger="hover" @on-click="handleClickUserDropdown">
                <Avatar :src="avatar" style="background: #2d8cf0; margin-left: 10px; "></Avatar>
                <Icon type="arrow-down-b"></Icon>
                <DropdownMenu slot="list">
                  <DropdownItem name="ownspace">个人中心</DropdownItem>
                  <DropdownItem name="logout" divided>登出系统</DropdownItem>
                </DropdownMenu>
              </Dropdown>
            </Row>
          </div>
        </div>
      </div>
    </div>
    <div class="content-page-con" :style="{left: shrink ? '60px' : '230px'}">
      <div class="content-page">
        <router-view :shrink="shrink"></router-view>
      </div>
    </div>
  </div>
</template>

<script>
import ShrinkableMenu from './layout/ShrinkableMenu'
import BreadcrumbNav from './layout/BreadcrumbNav'
import MessageTip from './layout/MessageTip'

export default {
  name: 'layout',
  components: {
    ShrinkableMenu,
    BreadcrumbNav,
    MessageTip
  },
  data () {
    return {
      shrink: true
    }
  },
  computed: {
    menuList () {
      return this.$store.state.menuList
    },
    currentPath () {
      return this.$store.state.currentPath
    },
    openNames () {
      return this.$store.state.openNames
    },
    avatar () {
      return localStorage.avatar
    },
    username () {
      return localStorage.username
    }
  },
  methods: {
    toggleSidebar () {
      this.shrink = !this.shrink
    },
    handleChange (name) {
    },
    handleClickUserDropdown (name) {
      if (name === 'ownspace') {
        this.$router.push({name: 'ownspace_index'})
      } else {
        this.$store.dispatch('logout')
        this.$Notice.success({title: '登出成功，即将返回登陆页面！'})
        this.$router.push({name: 'login'})
      }
    }
  },
  created () {
  }
}
</script>

<style lang="less">
@import '../assets/css/layout.less';
</style>
