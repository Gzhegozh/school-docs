$('#myTabs a').click (e) ->
  e.preventDefault()
  $(this).tab 'show'
  return

ready = ->
  $('.star').on 'click', ->
    $(this).toggleClass 'star-checked'
    return
  $('.ckbox label').on 'click', ->
    $(this).parents('tr').toggleClass 'selected'
    return
  return

$(document).ready ready
$(document).on 'page:load', ready

