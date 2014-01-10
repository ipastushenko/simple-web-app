appendMessage = (message) ->
  $("#list-messages").append "<li>" + message + "</li>"

$ ->
  $("#add-message-form").submit (event) ->
    message = event.target.message.value.trim()
    if message
      appendMessage event.target.message.value
    else
      toastr.error("Message can't be blank")
    false
