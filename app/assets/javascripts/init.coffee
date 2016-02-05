window.App ||= {}

App.init = ->
  $("a, span, i, div").tooltip()
  Dropzone.autoDiscover = false

$(document).on "page:change", ->
  App.init()