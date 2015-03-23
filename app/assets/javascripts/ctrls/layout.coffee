window.Layout =

  $(document).on 'click', '.navbar-toggle', ->
    $('body').toggleClass('show-nav')
