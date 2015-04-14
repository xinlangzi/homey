window.Property =
  events: ->

  init: ->
    Property.slideImages()


  slideImages: ->
    window.Property.flexslider = $('.property .images').flexslider
      animation: "slide"
      controlNav: "thumbnails"
      slideshow: false
      animationLoop: false
    # console.log(window.Property.flexslider.data().flexslider.vars)


Property.events()

$(document).on 'page:update', ->
  Property.init()
