module.exports= Backbone.View.extend
  template: require "./panelOne/index.jade"
  initialize: ->
    @setElement @template
      title: "panelOne"