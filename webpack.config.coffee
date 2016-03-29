class fontawesome
  exts: "eot svg ttf woff woff2".split(" ")
  entries:
    ("font-awesome/fonts/fontawesome-webfont.#{ext}" for ext in fontawesome::exts)
  loader:
    test: new RegExp "\.(#{fontawesome::exts.join("|")})$"
    loader:"file?name=[name].[ext]"

class bootstrap
  path: "bootstrap-sass/assets/javascripts/bootstrap"
  entries:[
    "imports?jQuery=jquery!#{bootstrap::path}"
  ]

webpack= require "webpack"
ExtractTextPlugin= require "extract-text-webpack-plugin"

module.exports= 
  entry: ["./src/js/site.coffee"].concat [],
    fontawesome::entries,
    bootstrap::entries,
    ["./src/css/site.scss"]
  output:
    path: "./builds"
    filename: "site.js"
    publicPath: "/assets/"
  module:
    loaders:[
      {test: /\.coffee$/, loader: "coffee"}
      {test: /\.jade$/, loader: "jade"}
      {
        test: /\.scss$/
        loader:  ExtractTextPlugin.extract "style-loader", "css-loader?sourceMap!postcss-loader!sass-loader?sourceMap" 
          #"css"
          #"postcss-loader"
          #"sass"
        #]
        #loaders:[
        #  "file?name=[name].css"
        #  "extract"
        #  "css?sourceMap" #FIXME sourceMap doesnt work
        #  "postcss-loader"
        #  "sass?sourceMap" #FIXME sourceMap doesnt work
        #]
      }
      fontawesome::loader
    ]
  postcss: ->
    [
      (require "autoprefixer")
        browsers: ["> 5% in JP"]
    ]

  resolve:
    extensions:["", ".coffee", ".js", ".css"]

  plugins:[
    new webpack.ProvidePlugin
      Backbone: "backbone"
      $: "jquery"
      _: "underscore"
    new ExtractTextPlugin "site.css"
  ]

  devtool: "#source-map"
  devServer:
    contentBase: "./public"
    host: "showtarow.local"
    port: 3000
    #port: 30000
    #proxy:
    #  "/*":
    #    target: "http://showtarow.local:3000"