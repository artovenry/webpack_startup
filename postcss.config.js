module.exports={
  plugins: [
    require("autoprefixer")({
      // "browsers": ["> 0.5% in JP", "last 2 versions", "IE >= 9", "safari >= 4"]
      "browsers": ["> 0.5% in JP", "last 2 versions", "IE >= 9", "safari >= 6"]
    })
  ]
}
