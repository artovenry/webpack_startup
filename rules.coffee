_   = require "underscore"
env = require "./env.coffee"
MiniCssExtractPlugin = require("mini-css-extract-plugin")

cssLoaders= (opts={vue: no, indented: no})->
  _.compact _.values
    STYLE: if not env.extract_css
      loader: if opts.vue then "vue-style-loader" else "style-loader"
    EXTRACT: if env.extract_css
      loader: MiniCssExtractPlugin.loader
    Css:
      loader: "css-loader"
      options:
        minimize: env.optimized
        sourceMap: env.development
    PostCss:
      loader: "postcss-loader"
      options:
        sourceMap: env.development
    Sass:
      loader: "sass-loader"
      options:
        indentedSyntax: opts.indented
        sourceMap: env.development
        data: "$ENV: #{env};"

module.exports=  _.values _.flatten _.compact
  JS:
    test: /\.js$/, loader: "babel-loader", exclude: /node_modules/

  COFFEE:
    test: /\.coffee$/, loader: "babel-loader!coffee-loader"

  VUE:
    test: /\.vue$/, loader: "vue-loader",
    options:
      loaders:
        js     : "babel-loader"
        coffee : "babel-loader!coffee-loader"
        sass   : cssLoaders(indented: yes, vue: yes)
        scss   : cssLoaders(indented: no, vue: yes)

  HtmlPug:
    test: /html\.pug$/, loader: "pug-loader"

  Pug:
    test: /\.pug$/
    exclude: /html\.pug/
    use: _.compact _.flatten _.values
      FILE:
        loader: "file-loader", options: name: "[name].html"
      EXTRACT:
        loader: "extract-loader"
      HTML:
        loader: "html-loader"
        options:
          interpolate: on
          attrs: ["img:src", "link:href", "script:src"]
      PUG:
        loader: "pug-html-loader"
  Css:
    test: /\.css$/, use: cssLoaders()

  Sass:
    test: /\.sass$/, use: cssLoaders(indented: yes)

  Scss:
    test: /\.scss$/, use: cssLoaders(indented: no)

  Media:
    test: /\.(png|jpe?g|gif|svg)$/i , loader: "url-loader", options: limit: 10000, name: "[name].[ext]"
