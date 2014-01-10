appendMessage = (message) ->
  $.ajax(
    url: "/messages/message_template"
    data: { message: message }
    type: "POST"
  ).done (html) ->
    $("#list-messages").prepend html
    updateRemoveEvent()

updateRemoveEvent = () ->
  $(".remove-message").click (event) ->
    event.target.parentElement.remove()

$ ->
  $("#add-message-form").submit (event) ->
    message = event.target.message.value.trim()
    if message
      appendMessage event.target.message.value
    else
      toastr.error("Message can't be blank")
    false
