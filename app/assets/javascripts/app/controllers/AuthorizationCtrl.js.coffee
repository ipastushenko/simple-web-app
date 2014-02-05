@simpleWebApp.controller 'SignInCtrl', [
  '$scope',
  '$http',
  '$modalInstance',
  ($scope, $http, $modalInstance) ->
    $scope.sign_in = (user) ->
      $http.post(
        '/api/signin',
        {user: user}
      ).success( (data) ->
        if data.success
          $modalInstance.close(data)
        else
          toastr.error data.error
      ).error( () ->
        toastr.error "Request failed"
      )
    $scope.cancel = () ->
      $modalInstance.dismiss('cancel')
]

@simpleWebApp.controller 'AuthorizationCtrl', [
  '$scope',
  '$http',
  '$modal',
  '$templateCache',
  ($scope, $http, $modal, $templateCache) ->
    $scope.sign_in = () ->
      signInModal = $modal.open({
        templateUrl: 'sign_in.html',
        controller: 'SignInCtrl',
        backdrop: 'static',
        windowClass: 'signin'
      })
      signInModal.result.then( (data) ->
        if data.success
          toastr.info data.info
      )

    $scope.sign_out = () ->
      $http.delete(
        "/api/signout"
      ).success( (data) ->
        if data.success
          toastr.info data.info
        else
          toastr.error data.error
      ).error( () ->
        toastr.error "Request failed"
      )

    #TODO
    $scope.init = () ->
      $http.get(
        "/api/current_user"
      ).success( (data, status) ->
        if !data.success
          $scope.sign_in()
      ).error( (data, status) ->
        if status == 401
          $scope.sign_in()
        else
          toastr.error "Request failed"
      )
]

