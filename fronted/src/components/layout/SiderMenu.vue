<template>
  <div class="wrapper">
    <slot name="top"></slot>
    <collapsed-menu v-if="isCollapsed" :menu-list="menuList" :theme="theme" @on-select="changeSelect"></collapsed-menu>
    <expand-menu v-if="!isCollapsed" :menu-list="menuList" :theme="theme" @on-select="changeSelect"></expand-menu>
  </div>
</template>

<script>
import CollapsedMenu from '@/components/layout/CollapsedMenu'
import ExpandMenu from '@/components/layout/ExpandMenu'

export default {
  name: 'sider-menu',
  components: {
    CollapsedMenu,
    ExpandMenu,
  },
  props: {
    isCollapsed: Boolean,
    menuList: Array,
    theme: String
  },
  data () {
    return {}
  },
  methods: {
    changeSelect (active) {
      this.$router.push({ name: active })
      this.$emit('on-select', active)
    }
  }
}
</script>

<style lang="less" scoped>

</style>
