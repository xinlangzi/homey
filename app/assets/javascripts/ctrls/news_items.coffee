window.NewsItem =
  restrictCopy: ->
    return false
    
  events: ->
    
  init: ->
    if $(".block_copy").length > 0
      $(document).on 'copy', NewsItem.restrictCopy
    else
      $(document).off 'copy', NewsItem.restrictCopy
    

NewsItem.events()

$(document).on 'page:update', ->
  NewsItem.init()
