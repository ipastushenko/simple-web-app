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
        $modalInstance.close()
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
      singInModal = $modal.open({
        templateUrl: 'sign_in.html',
        controller: 'SignInCtrl',
        backdrop: 'static',
        windowClass: 'signin'
      })
    $scope.sign_out = () ->
      $http.delete(
        "/api/signout"
      ).success( () ->
        toastr.error "Logout"
      ).error( () ->
        toastr.error "Request failed"
      )

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

