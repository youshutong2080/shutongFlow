<template>
  <div class="wrapper">
    <template v-for="(item, index) in menuList">
      <Dropdown v-if="item.children && item.children.length > 1" visible transfer placement="right-start" @on-click="changeMenu" :key="index">
        <Button type="text"class="btn-sider">
          <font-awesome-icon :icon="item.meta.icon" />
        </Button>
        <DropdownMenu style="width: 150px;" slot="list">
          <template v-for="(child, i) in item.children" v-if="!child.meta.hidden">
            <DropdownItem :name="child.name" :key="i">
              <font-awesome-icon :icon="child.meta.icon"/>
              <span class="layout-text">&nbsp;{{child.meta.title}}</span>
            </DropdownItem>
          </template>
        </DropdownMenu>
      </Dropdown>
      <Button v-else type="text"class="btn-sider" @click="changeMenu('about')">
        <font-awesome-icon :icon="item.meta.icon"/>
      </Button>
    </template>
  </div>
</template>

<script>
export default {
  name: 'scollapsed-menu',
  props: {
    menuList: Array,
    openNames: Array
  },
  methods: {
    changeMenu (active) {
      this.$emit('on-select', active)
    }
  }
}
</script>

<style lang="less" scoped>
.logo {
  cursor: pointer;
}
.btn-sider {
  width: 64px;
  border-radius: 0;
  color: #fff;
}
.btn-sider:hover {
  color: #001529;
}
</style>