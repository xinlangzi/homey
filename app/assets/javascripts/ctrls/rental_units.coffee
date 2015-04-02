window.RentalUnit =
  events: ->

  init: ->
    Dropzone.options.myAwesomeDropzone =
      paramName: "photo[file]",
      dictDefaultMessage: "Drop photos here to upload."
      
RentalUnit.events()

$(document).on 'page:update', ->
  RentalUnit.init()
