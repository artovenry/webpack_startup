module.exports= Backbone.View.extend
  template: require("./panelOne.jade")
  initialize: ->
    @setElement @template() 