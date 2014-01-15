@simpleWebApp.controller 'MessageCtrl', ['$scope', ($scope) ->
  $scope.messages = []

  $scope.add = (message) ->
    if message
      $scope.messages.unshift(message)
    else
      toastr.error "Message can't be blank"
    false
]
