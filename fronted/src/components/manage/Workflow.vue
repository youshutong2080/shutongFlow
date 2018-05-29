<template>
  <div class="container">
    <Card>
      <Table :columns="workflowtable.columns" :data="workflowtable.data"></Table>
    </Card>
  </div>
</template>

<script>
export default {
  name: 'workflow',
  data () {
    return {
      workflowtable: {
        columns: [
          {key: 'name', title: '业务名称', align: 'center'},
          {key: 'description', title: '业务描述', align: 'center'},
          {key: 'creator', title: '创建人', align: 'center'},
          {key: 'gmt_created', title: '创建时间', align: 'center'}
        ],
        data: []
      },

    }
  },
  methods: {
    init () {
      this.$store.dispatch('api_workflows').then(resp => {
        this.workflowtable.data = resp.data.data.value
        console.log(resp.data.data)
      })
    }
  },
  mounted () {
    this.init()
  }
}
</script>
