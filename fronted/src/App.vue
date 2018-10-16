<template>
  <div id="app">
    <router-view/>
  </div>
</template>

<style lang="less">
html, body, #app {
  width: 100%;
  height: 100%;
  margin: 0;
  padding: 0;
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
}
.ivu-btn, .ivu-input {
  box-shadow: none !important;
}
a {
  color: inherit;
}
</style>
