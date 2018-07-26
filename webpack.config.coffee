path= require "path"
_   = require "underscore"
env = require "./env.coffee"
rules= require "./rules.coffee"
HtmlWebpackPlugin = require "html-webpack-plugin"
module.exports=
  devtool: "inline-source-map" if env.development
  mode: process.env.NODE_ENV
  entry:
    index: ["index.coffee"]
    # "webpack-hot-middleware/client?path=http://#{env.host}:#{env.port}/__webpack_hmr?noInfo=true&quite=true&reload=true"]

  output:
    filename      : if env.development then "[name].js" else "[name]-[hash:6].js"
    chunkFilename : "[id].chunk.js"
    path          : path.resolve("__bundled__")
    publicPath    : if env.development then "http://#{env.host}:#{env.port}/" else "/bundled/"
  devServer:
    compress: on
    hot: if env.development then on
  resolve:
    modules: [path.resolve("src"), "node_modules"]
    extensions:[".js", ".coffee" ,".json"]
    alias:
      vue: path.resolve("node_modules/vue/dist/vue.esm.js")
      vuex: path.resolve("node_modules/vuex/dist/vuex.esm.js")
  module:
    rules: rules
  plugins: _.compact _.flatten _.values
    HWP: new HtmlWebpackPlugin chunk: on
