appendMessage = (message) ->
  $.ajax(
    url: "/messages/message_template"
    data: { message: message }
    type: "POST"
  )
  .done (data) ->
    if data.success
      $("#list-messages").prepend data.html
      updateRemoveEvent()
    else
      toastr.error data.error
  .fail () ->
    toastr.error "Servise is not available"

updateRemoveEvent = () ->
  $(".remove-message").click (event) ->
    event.target.parentElement.remove()

$ ->
  $("#add-message-form").submit (event) ->
    message = event.target.message.value.trim()
    if message
      appendMessage event.target.message.value
    else
      toastr.error "Message can't be blank"
    false
