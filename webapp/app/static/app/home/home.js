'use strict';

angular.module('home', ['ngRoute'])
.config(['$routeProvider', function($routeProvider) {
  $routeProvider.when('/home', {
    templateUrl: '/static/app/home/home.html',
    controller: 'HomeCtl'
  });
}])

    // create the controller and inject Angular's $scope
    myApp.controller('HomeCtl', function($scope) {
        // create a message to display in our view
        $scope.message = 'HOME';
        console.log($scope.message);
    });
