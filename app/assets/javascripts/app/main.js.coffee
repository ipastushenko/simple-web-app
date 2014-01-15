@simpleWebApp = angular.module('simpleWebApp', ['ngRoute'])

@simpleWebApp.config(["$httpProvider", (provider) ->
  provider.defaults.headers
    .common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
])

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
