<template>
  <div style="text-align: center;">
    <template v-for="(item, index) in menuList">
      <Dropdown v-if="item.children.length <= 1" transfer placement="right-start" @on-click="changeMenu" :key="index">
        <Button style="widthL 70px; margin-left: 5px; padding: 10px 0;" type="text">
          <Icon color="white" :type="item.children[0].icon" size="22"></Icon>
        </Button>
        <DropdownMenu style="width: 230px;" slot="list">
          <DropdownItem :name="item.children[0].name" :key="index">
            <Icon :type="item.children[0].icon"></Icon>
            <span style="padding-left:10px;">{{item.children[0].title}}</span>
          </DropdownItem>
        </DropdownMenu>
      </Dropdown>
      <Dropdown v-else transfer placement="right-start" @on-click="changeMenu" :key="index">
        <Button style="width: 70px; margin-left: -5px; padding: 10px 0;" type="text">
          <Icon color="white" :type="item.icon" size="22"></Icon>
        </Button>
        <DropdownMenu style="width: 230px;" slot="list">
          <template v-for="(child, i) in item.children" v-if="!child.meta.hidden">
            <DropdownItem :name="child.name" :key="i">
              <Icon :type="child.icon"></Icon>
              <span class="layout-text">{{child.title}}</span>
            </DropdownItem>
          </template>
        </DropdownMenu>
      </Dropdown>
    </template>
  </div>
</template>

<script>
export default {
  name: 'sidebar-menu-shrink',
  props: {
    menuList: {type: Array},
    openNames: {type: Array}
  },
  methods: {
    changeMenu (active) {
      this.$emit('on-change', active)
    }
  }
}
</script>
