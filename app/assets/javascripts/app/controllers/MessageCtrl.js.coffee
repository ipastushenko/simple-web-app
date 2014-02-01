@simpleWebApp.controller 'MessageCtrl', ['$scope', '$http', ($scope, $http) ->
  $scope.messages = []

  $scope.add = (message) ->
    if message
      $http.post(
        "/api/message/create",
        { message: message }
      ).success( (data) ->
        if data.success
          $scope.messages.unshift(message)
        else
          toastr data.error
      ).error( () ->
        toastr.error "Request failed"
      )
    else
      toastr.error "Message can't be blank"
    false
]
