@simpleWebApp = angular.module('simpleWebApp', ['ngRoute'])

@simpleWebApp.config(['$routeProvider', ($routeProvider) ->
  $routeProvider.otherwise({
    templateUrl: '/assets/home.html',
    controller: 'HomeCtrl'
  })
])

@simpleWebApp.directive('messages', () ->
  {
    restrict: 'E',
    templateUrl: '/assets/message.html'
  }
)
