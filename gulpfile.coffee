gulp= require "gulp"
gutil= require "gulp-util"
config= require "./webpack.config.coffee"
webpack= require "webpack"
compiler= webpack(config)
webpackDevServer= require "webpack-dev-server"
_= require "underscore"

gulp.task "server", (cb)->
  config= _.clone config
  config.devtool= "#eval"
  config.debug= on
  new webpackDevServer webpack(config),
    publicPath: config.output.publicPath
    stats:
      colors: on
    contentBase: "./public"
    proxy:
      "*": "http://localhost:3000"
  .listen 30000, "localhost", (err)->
    throw new gutil.PluginError("webpack-dev-server", err) if err
    gutil.log("[webpack-dev-server]", "localhost")
