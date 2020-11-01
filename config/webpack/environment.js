const { environment } = require('@rails/webpacker')

module.exports = environment

// AdminLTEのため追記 余力があれば管理ページのレイアウト整える
// const webpack = require('webpack')

// environment.plugins.prepend('Provide',
//   new webpack.ProvidePlugin({
//     $: 'admin-lte/plugins/jquery/jquery',
//     jQuery: 'admin-lte/plugins/jquery/jquery',
//   })
// )