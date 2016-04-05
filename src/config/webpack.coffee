webpack= require "webpack"
autoprefixer= require "autoprefixer"
loaders= require "./loaders.coffee"

module.exports=
  cache: off
  entry:[
    "./src/js/site.coffee"
    "./src/css/site.scss"
    "imports?jQuery=jquery!bootstrap-sass/assets/javascripts/bootstrap"
  ]
  output:
    path: __dirname + "/../builds"
    filename: "bundle.js"
    publicPath: "http://localhost:30000/assets/"

  module:
    loaders:loaders
  sassLoader: 
    data: "$ENV: " + process.env.NODE_ENV + ";"
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