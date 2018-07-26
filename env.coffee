env= process.env

data=
  host    : env.npm_config_host ? "localhost"
  port    : env.npm_config_port ? "8080"
  staging : no
  optimized: no
switch process.env.NODE_ENV
  when "development"
    data.development= yes
  # when "optimized"
  #   data.development= yes
  #   data.extract_css= yes
  #   data.optimized= yes
  # when "production"
  #   data.production= yes
  #   data.extract_css= yes
  #   data.optimized= yes
  # when "staging"
  #   data.staging= yes
  #   data.extract_css= yes
  #   data.optimized= yes
  # when "extract_css"
  #   data.development= yes
  #   data.extract_css= yes
  # else
  #   data.development= yes
module.exports= data
