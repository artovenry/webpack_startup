webpack= require "webpack"
autoprefixer= require "autoprefixer"

module.exports=
  cache: off
  entry:[
    "./src/js/site.coffee"
    "./src/css/site.scss"
    "imports?jQuery=jquery!bootstrap-sass/assets/javascripts/bootstrap"
  ]
  output:
    path: __dirname + "/builds"
    filename: "bundle.js"
    publicPath: "http://localhost:30000/assets/"
  module:
    loaders:[
      {test: /\.coffee$/, loader: "coffee"}
      {test: /\.scss$/, loader: "style!css?sourceMap!postcss!sass?sourceMap"}
      {test: /\.jade$/, loader: "jade"}
      {test: /\.png$/, loader: "url?mimetype=image/png&limit=10000"}
      {
        test: /\.woff2?(\?.+)?$/
        loader: "url?limit=10000&mimetype=application/font-woff"
      }
      {
        test: /\.ttf(\?.+)?$/
        loader: "url?limit=10000&mimetype=application/octet-stream"
      }
      {
        test: /\.svg(\?.+)?$/
        loader: "url?limit=10000&mimetype=image/svg+xml"
      }
      {
        test: /\.eot(\?.+)?$/
        loader: "file"
      }
    ]
  postcss: ->
    [
      autoprefixer
        browsers: ["> 5% in JP"]
    ]
  resolve:
    extensions:["", ".coffee", ".js",".jade", ".css"]
  plugins:[
    new webpack.ProvidePlugin
      $: "jquery"
      _: "underscore"
      Backbone: "backbone"
  ]
  devtool: "#source-map"