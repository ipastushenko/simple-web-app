@simpleWebApp.controller 'SignInCtrl', [
  '$scope',
  '$modalInstance',
  ($scope, $modalInstance) ->
    $scope.sign_in = () ->
      alert "sign in"
    $scope.cancel = () ->
      alert "cancel"
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

