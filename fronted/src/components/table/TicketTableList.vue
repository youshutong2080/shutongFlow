<template>
  <div class="container">
    <Table :columns="columns" :data="data"></Table>
  </div>
</template>

<script>
export default {
  name: 'ticket-table-list',
  props: {
    columns: {type: Array},
    data: {type: Array}
  }
}
</script>
