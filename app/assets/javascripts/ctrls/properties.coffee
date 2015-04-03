window.Property =
  events: ->

  init: ->


Property.events()

$(document).on 'page:update', ->
  Property.init()
