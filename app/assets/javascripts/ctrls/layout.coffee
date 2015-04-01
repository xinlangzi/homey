window.Layout =

  init: ->
    $(document).on 'click', '.navbar-toggle', ->
      $('body').toggleClass('show-nav')

    $('.flexslider').flexslider
      # smoothHeight: true
      animation: 'fade'
      # slideshow: true
      # slideshowSpeed: 5000
      # controlNav: false

$(document).on 'page:update', ->
  Layout.init()