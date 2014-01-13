@simpleWebApp = angular.module('simpleWebApp', ['ngRoute'])

@simpleWebApp.config(['$routeProvider', ($routeProvider) ->
  $routeProvider.otherwise({
    templateUrl: '/assets/home.html',
    controller: 'HomeCtrl'
  })
])
