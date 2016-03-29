module.exports= Backbone.View.extend
  el: ".container"
  initialize: ->
    @$el
      .append (new(require "./modal")).el
      .append (new(require "./panelOne")).el
      .append (new(require "./panelTwo")).el
