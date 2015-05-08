window.Request =
  events: ->
    $(document).on 'change', '#request_intention', ->
      if $(this).val() == "rent"
        $(".rentable").show()
      else
        $(".rentable").hide()

  init: ->

Request.events()

$(document).on 'page:update', ->
  Request.init()
