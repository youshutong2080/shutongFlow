<template>
  <div class="menu">
    <div class="ivu-shrinkable-menu">
      <slot name="top"></slot>
      <sidebar-menu v-if="!shrink" :menu-list="menuList" :open-names="openNames" @on-change="handleChange"></sidebar-menu>
      <sidebar-menu-shrink v-if="shrink" :menu-list="menuList" :open-names="openNames" @on-change="handleChange"></sidebar-menu-shrink>
    </div>
  </div>
</template>

<script>
import SidebarMenu from './SidebarMenu'
import SidebarMenuShrink from './SidebarMenuShrink'

export default {
  name: 'shrinkable-menu',
  components: {
    SidebarMenu,
    SidebarMenuShrink
  },
  props: {
    shrink: {type: Boolean, default: true},
    menuList: {type: Array},
    openNames: {type: Array}
  },
  methods: {
    handleChange (name) {
      this.$router.push({name: name})
      this.$emit('on-change', name)
    }
  }
}
</script>
