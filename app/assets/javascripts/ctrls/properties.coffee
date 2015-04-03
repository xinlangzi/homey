window.Property =
  events: ->

  init: ->
    Dropzone.options.myAwesomeDropzone =
      paramName: "photo[file]",
      dictDefaultMessage: "Drop photos here to upload."
      
Property.events()

$(document).on 'page:update', ->
  Property.init()
