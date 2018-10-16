<template>
  <div class="wrapper">
    <div class="nav-icon">
      <Button type="text" class="toggle" :style="{transform: 'rotateZ('+(isCollapsed ? '90' : '0')+'deg)'}" @click="toggleCollapse">
        <font-awesome-icon :icon="['fas', 'bars']" size="2x" />
      </Button>
    </div>
    <div class="nav-breadcrumb">
      <Breadcrumb>
        <BreadcrumbItem v-for="(item, index) in current" :key="index" :href="item.path">{{item.title}}</BreadcrumbItem>
      </Breadcrumb>
    </div>
    <div class="nav-avatar">
      <Avatar src="https://avatars0.githubusercontent.com/u/5885314?s=88&v=4" />
    </div>
  </div>
</template>

<script>
export default {
  name: 'header-con',
  props: {
    isCollapsed: Boolean,
    current: Array
  },
  methods: {
    toggleCollapse () {
      this.$emit('on-change', !this.isCollapsed)
    }
  }
}
</script>

<style lang="less" scoped>
.wrapper {
  .nav-icon {
    display: inline-block;
  }
  .nav-breadcrumb {
    display: inline-block;
    padding-left: 15px;
    font-size: 14px;
  }
  .nav-avatar {
    float: right;
  }
  .nav-icon, .nav-avatar {
    margin-bottom: 3px;
  }
}
</style>
