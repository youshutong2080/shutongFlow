
module.exports = {
  productionSourceMap: false,
  devServer: {
    host: '0.0.0.0',
    port: 6060,
    open: true
  },

  css: {
    loaderOptions: {
      less: {
        loader: 'less-loader',
        javascriptEnabled: true
      }
    }
  },
}