window.NewsItem =
  events: ->
    if $(".block_copy")
      $(document).on 'copy', ->
        return false
    
  init: ->
    

NewsItem.events()

$(document).on 'page:update', ->
  NewsItem.init()
