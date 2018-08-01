import Vue from "vue"
import Graphic from "Graphic.vue"
Vue.component "graphic", Graphic
require "index.scss"

document.addEventListener "DOMContentLoaded", ->
  new Vue
