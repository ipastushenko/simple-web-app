@simpleWebApp.controller 'HomeCtrl', ['$scope', ($scope) ->
  $scope.messages = []

  $scope.add = (message) ->
    if message
      message = message.trim()
    if message
      $scope.messages.unshift(message)
    else
      toastr.error "Message can't be blank"
    false
]
