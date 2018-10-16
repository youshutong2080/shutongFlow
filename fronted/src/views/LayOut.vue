<template>
  <Layout class="layout-con">
    <Sider hide-trigger breakpoint="md" collapsible :width="230" :collapsed-width="64" v-model="isCollapsed">
      <sider-menu :isCollapsed="isCollapsed" :menu-list="menuList" :theme="theme" @on-select="changeSelect">
        <div class="logo" slot="top">
          <router-link :to="{path: '/'}" v-if="isCollapsed">flow</router-link>
          <router-link :to="{path: '/'}" v-else>ShutongFlow</router-link>
        </div>
      </sider-menu>
    </Sider>
    <Layout>
      <Header class="header-con">
        <header-con :isCollapsed="isCollapsed" :current="currentPath" @on-change="toggleChange"></header-con>
      </Header>
      <Content class="content-con">
        <router-view></router-view>
      </Content>
    </Layout>
  </Layout>
</template>

<script>
import SiderMenu from '@/components/layout/SiderMenu'
import HeaderCon from '@/components/layout/HeaderCon'

export default {
  name: 'layout',
  components: {
    SiderMenu,
    HeaderCon,
  },
  data () {
    return {
      isCollapsed: false,
      theme: 'dark'
    }
  },
  computed: {
    menuList () {
      return this.$store.getters.menuList
    },
    currentPath () {
      return this.$store.state.currentPath
    }
  },
  methods: {
    toggleChange (val) {
      this.isCollapsed = !this.isCollapsed
    },
    changeSelect (active) {
      console.log(active)
    }
  }
}
</script>

<style lang="less">
.layout-con {
  height: 100%;
  width: 100%;
  .logo {
    line-height: 64px;
    font-size: 23px;
    font-weight: 800;
    text-align: center;
    color: white;
  }
  .header-con {
    background: #fff;
    padding: 0 18px;
    box-shadow: 0 0 5px 5px rgb(219, 218, 219);
  }
  .content-con {
    padding: 15px 20px;
  }
}
</style>
