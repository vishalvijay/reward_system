$(document).on 'ready page:load', ->
  flashBlock = $('.flash-message-block')
  if flashBlock.length < 0
    return
  setTimeout (->
    $(flashBlock).slideUp()
  ), 5000
