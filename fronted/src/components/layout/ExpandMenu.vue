<template>
  <div class="wrapper">
    <Menu ref="menu"
    :active-name="activeName"
    :theme="theme"
    width="auto"
    :open-names="openedNames"
    :accordion="true"
    @on-select="changeSelect">
      <template v-for="(item, index) in menuList">
        <Submenu v-if="item.children && item.children.length > 1" :name="item.name" :key="index">
          <template slot="title">
            <font-awesome-icon :icon="item.meta.icon" />
            <span style="font-size: 16px;">&nbsp;{{item.meta.title}}</span>
          </template>
          <MenuItem v-for="(child, idx) in item.children" :name="child.name" :key="idx">
            <font-awesome-icon :icon="child.meta.icon"/>
            <span style="font-size: 16px;">&nbsp;{{child.meta.title}}</span>
          </MenuItem>
        </Submenu>
        <MenuItem v-else :name="item.name" :key="index">
          <font-awesome-icon :icon="item.meta.icon"/>
          <span style="font-size: 16px;">&nbsp;{{item.meta.title}}</span>
        </MenuItem>
      </template>
    </Menu>
  </div>
</template>

<script>
export default {
  name: 'expand-menu',
  props: {
    isCollapsed: Boolean,
    menuList: Array,
    theme: String
  },
  data () {
    return {
      openedNames: [],
      activeName: ''
    }
  },
  methods: {
    changeSelect (active) {
      this.$emit('on-select', active)
    }
  },
  watch: {
    '$route' () {
      this.openedNames = this.$route.matched.map(item => {
        return item.name
      })
      this.activeName = this.$route.name
    }
  },
  created () {
    this.activeName = this.$route.name
    this.openedNames = this.$route.matched.map(item => {
      return item.name
    })
  }
}  
</script>