window.Poller = {
  poll: (timeout) ->
    if timeout is 0
      Poller.request()
    else
      this.pollTimeout = setTimeout ->
        Poller.request()
      , timeout || 5000
  clear: -> clearTimeout(this.pollTimeout)
  request: ->
    last_message_id = $('.message').last().data('id')
    conversation_id = $('#all_messages').data('id')
    $.get('/conversations/' + conversation_id + '/chat', after_id: last_message_id)
}

jQuery ->
  Poller.poll() if $('#all_messages').size() > 0
  return