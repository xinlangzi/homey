window.Property =
  events: ->

  init: ->
    Property.slideImages()


  slideImages: ->
    $('.property .images').flexslider
      animation: "slide"
      controlNav: "thumbnails"
      slideshow: false


Property.events()

$(document).on 'page:update', ->
  Property.init()
