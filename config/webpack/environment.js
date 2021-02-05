const { environment } = require('@rails/webpacker')
const { VueLoaderPlugin } = require('vue-loader')
// const vue = require('./loaders/vue')  # これでデプロイうまくいくか

// jQueryとBootstapのJSを使えるように
const webpack = require('webpack')
environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: 'popper.js'
  })
)

// jquery-uiを使えるように
const aliasConfig = {
  'jquery': 'jquery-ui-dist/external/jquery/jquery.js',
  'jquery-ui': 'jquery-ui-dist/jquery-ui.js'
};

environment.config.set('resolve.alias', aliasConfig);


environment.plugins.prepend('VueLoaderPlugin', new VueLoaderPlugin())
// environment.loaders.prepend('vue', vue) # デプロイうまくいくか
environment.loaders.prepend('vue', {
 test: /\.vue$/,
      use: [{
        loader: 'vue-loader'
      }]
})
module.exports = environment
