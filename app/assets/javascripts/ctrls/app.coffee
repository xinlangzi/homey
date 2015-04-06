window.App =

  events: ->
    App.disableWith()

  init: ->
    App.dropzone()
    App.datepicker()
    App.datetimepicker()
    App.fadeAlert()
  

##### BEGIN EVENTS#####
  disableWith: ->
    $(document).on 'mouseenter', 'input[type=submit]', ->
      $(this).attr('data-disable-with', 'Please Waiting...')

##### END EVENTS#######

  dropzone: ->
    Dropzone.discover()

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
    
  fadeAlert: ->
    $(".alert").delay(200).addClass("in").fadeOut(4000);

# events only run once to avoid the firing twice or more
App.events()

$(document).on 'page:update', ->
  App.init()