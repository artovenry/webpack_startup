module.exports= Backbone.View.extend
  template: require("./modal.jade")
  initialize: ->
    @setElement @template() 