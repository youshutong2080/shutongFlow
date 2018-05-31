<template>
  <Menu ref="sideMenu" width="auto" theme="dark" :active-name="$route.name" :open-names="openNames" :accordion="true" @on-select="changeMenu">
    <template v-for="(item, index) in menuList">
      <MenuItem v-if="item.children.length <= 1" :name="item.children[0].name" :key="index">
        <Icon :type="item.children[0].icon" size="22"></Icon>
        <span class="layout-text">{{item.children[0].title}}</span>
      </MenuItem>
      <Submenu v-else :name="item.name" :key="index">
        <template slot="title">
          <Icon :type="item.icon" :size="22"></Icon>
          <span class="layout-text">{{item.title}}</span>
        </template>
        <MenuItem v-for="(child, i) in item.children" :name="child.name" v-if="child.meta && !child.meta.hidden" :key="i">
          <Icon :type="child.icon" :size="22"></Icon>
          <span class="layout-text">{{child.title}}</span>
        </MenuItem>
      </Submenu>
    </template>
  </Menu>
</template>

<script>
export default {
  name: 'sidebar-menu',
  props: {
    openNames: {type: Array},
    menuList: {type: Array}
  },
  methods: {
    changeMenu (active) {
      this.$emit('on-change', active)
    }
  }
}
</script>
