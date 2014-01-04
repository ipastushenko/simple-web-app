appendMessage = (message) ->
  $("#list-messages").append "<li>" + message + "</li>"

$ ->
  $("#add-message-button").click ->
    appendMessage $("#message").val()
