@simpleWebApp.controller 'SignInCtrl', [
  '$scope',
  '$modalInstance',
  ($scope, $modalInstance) ->
    $scope.sign_in = () ->
      toastr.info 'Autorization'
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
        backdrop: 'static'
      })
]

