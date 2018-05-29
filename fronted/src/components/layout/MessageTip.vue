<template>
  <div class="message">
    <Tooltip :content="value > 0 ? `有${value}条未读消息` : '没有未读消息'">
      <Badge :count="value" dot>
        <Icon type="ios-bell" size="24"></Icon>
      </Badge>
    </Tooltip>
  </div>
</template>

<script>
export default {
  name: 'message-tip',
  data () {
    return {
      value: 0
    }
  }
}
</script>
