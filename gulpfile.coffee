#minimist= require "minimist"
#knownOptions=
#  string: "env"
#  default:
#    env: process.env.NODE_ENV || 'development'
#options= minimist process.argv.slice(2), knownOptions

gulp= require "gulp"
gutil= require "gulp-util"

config= require "./src/config/webpack.coffee"
webpack= require "webpack"
compiler= webpack(config) 

webpackDevServer= require "webpack-dev-server"
_= require "underscore"

gulp.task "bundle", (cb)->
  compiler.run (err, stats)->
    throw new gutil.PluginError("webpack", err) if err
    gutil.log "[webpack-#{process.env.NODE_ENV}]", stats.toString()
    cb()
gulp.task "default", (cb)->
  _config= _.clone config
  _config.devtool= "#eval"
  _config.debug= on
  new webpackDevServer webpack(_config),
    publicPath: _config.output.publicPath
    stats:
      colors: on
    contentBase: "./public"
    proxy:
      "*": "http://localhost:3000"
  .listen 30000, "localhost", (err)->
    throw new gutil.PluginError("webpack-dev-server", err) if err
    gutil.log("[webpack-dev-server]", "localhost")
