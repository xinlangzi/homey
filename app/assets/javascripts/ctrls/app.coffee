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
    # need to disable autoDiscover otherwise non-AJAX will be discovered twice and throw JS exception
    # need to manually discover otherwise AJAX responses will not be discovered
    Dropzone.autoDiscover = false;
    Dropzone.discover()

  datepicker: ->
    $('input.date_picker').datetimepicker(
      pickTime: false
      defaultDate: ''
      useCurrent: false
      format: 'YYYY-MM-DD'
    ).on('dp.change', ->
      $(this).blur()
    )

  datetimepicker: ->
    $('input.date_time_picker').datetimepicker()

  fadeAlert: ->
    $(".flash .alert").delay(200).addClass("in").fadeOut(4000);

# events only run once to avoid the firing twice or more
App.events()

$(document).on 'page:update', ->
  App.init()