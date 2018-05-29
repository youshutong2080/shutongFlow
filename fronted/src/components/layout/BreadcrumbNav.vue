<template>
  <div class="breadcrumb-nav">
    <Breadcrumb>
      <BreadcrumbItem v-for="(item, index) in currentPath" :key="index" :href="item.path">{{item.title}}</BreadcrumbItem>
    </Breadcrumb>
  </div>
</template>

<script>
export default {
  name: 'breadcrumb-nav',
  props: {
    currentPath: {type: Array}
  }
}
</script>
