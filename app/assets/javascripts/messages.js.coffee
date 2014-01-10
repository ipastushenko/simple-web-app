appendMessage = (message) ->
  $("#list-messages").append "<li>" + message + "</li>"

$ ->
  $("#add-message-form").submit (event) ->
    appendMessage event.target.message.value
    false
