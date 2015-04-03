window.App =

  events: ->
    App.disableWith()

  init: ->
    App.datepicker()
    App.datetimepicker()

##### BEGIN EVENTS#####
  disableWith: ->
    $(document).on 'mouseenter', 'input[type=submit]', ->
      $(this).attr('data-disable-with', 'Please Waiting...')

##### END EVENTS#######

  datepicker: ->
    $('input.date_picker').datetimepicker(
      pickTime: false
      defaultDate: ''
      useCurrent: false
      format: 'MM/DD/YYYY'
    ).on('dp.change', ->
      $(this).blur()
    )

  datetimepicker: ->
    $('input.date_time_picker').datetimepicker()


# events only run once to avoid the firing twice or more
App.events()

$(document).on 'page:update', ->
  App.init()