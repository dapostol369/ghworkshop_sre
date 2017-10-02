'use strict';

angular.module('cartsummary', ['ngRoute'])
.config(['$routeProvider', function($routeProvider) {
  $routeProvider.when('/cartsummary', {
    templateUrl: '/static/app/cart/cart.html',
    controller: 'CartSummaryCtl'
  });
}])

    // create the controller and inject Angular's $scope
    myApp.controller('CartSummaryCtl', function($routeParams, $scope, Service) {
        // create a message to display in our view
        $scope.message = 'CartSummary'; 
    
        console.log($scope.message);

        var orderdata =[];
        orderdata=Service.get("order");
        $scope.orderdata = orderdata;
        console.log("final order=", orderdata);
    });

        
