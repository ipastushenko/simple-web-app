@simpleWebApp.controller 'SignInCtrl', [
  '$scope',
  '$modalInstance',
  ($scope, $modalInstance) ->
    $scope.sign_in = () ->
      alert "Sign In"
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

