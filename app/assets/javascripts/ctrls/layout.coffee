window.Layout =
  events: ->
    $(document).on 'click', '.navbar-toggle', ->
      $('body').toggleClass('show-nav')

  init: ->
    $('#property-slideshow').flexslider
      # smoothHeight: true
      animation: 'fade'
      # slideshow: true
      # slideshowSpeed: 5000
      # controlNav: false

Layout.events()

$(document).on 'page:update', ->
  Layout.init()