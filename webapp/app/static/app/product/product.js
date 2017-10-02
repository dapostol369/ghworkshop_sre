'use strict';

angular.module('product', ['ngRoute'])
.config(['$routeProvider', function($routeProvider) {
  $routeProvider.when('/product', {
    templateUrl: '/static/app/product/product.html',
    controller: 'ProductCtl'
  });
}])

// create the controller and inject Angular's $scope
myApp.controller('ProductCtl', function($scope, $http) {
    // create a message to display in our view
    $scope.message = 'PRODUCT';

    console.log($scope.message);

    var products;

    $http.get('productdata').success(function(data) {
        $scope.products = data;
        products=data;
        console.log($scope.products);
        console.log(data.length );
    }); 

   


});

        
