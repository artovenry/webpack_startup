console.log process.env.NODE_ENV
module.exports=[
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