module.exports= Backbone.View.extend
  template: require("./panelTwo.jade")
  initialize: ->
    @setElement @template
      title: "panelTwo"