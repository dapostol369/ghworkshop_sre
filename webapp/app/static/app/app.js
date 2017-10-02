
'use strict';   // See note about 'use strict'; below

var myApp = angular.module('myApp', [
 'ngRoute',
 //'ngCart',
 'home',
 'product',
 'product_details',
 'cart',
 'cartsummary'
 
]);

myApp.config(['$routeProvider',
     function($routeProvider) {
         $routeProvider.
             when('/', {
                 templateUrl: '/static/app/home/home.html',
                 controller : 'HomeCtl'
             }).
             when('/home', {
                 templateUrl: '/static/app/home/home.html',
                 controller : 'HomeCtl'
             }).
            when('/cart/:name/:price/:qty', {
                 templateUrl: '/static/app/cart/cart.html',
                 controller:  'CartCtl'
             }).
            when('/cartsummary', {
                 templateUrl: '/static/app/cart/cart.html',
                 controller:  'CartSummaryCtl'
             }).
            when('/product', {
                 templateUrl: '/static/app/product/product.html',
                 controller:  'ProductCtl'
             }).
            when('/product_details/:num', {
                 templateUrl: '/static/app/product/product_details.html',
                 controller:  'ProductDetailsCtl'
             }).

             otherwise({
                 redirectTo: '/home'
             });
    }]);


  //Service to store the "services" used
  myApp.service('Service', function Service() {
    var data = {
      order: null

    };

    function set(value,field){
      data[field] = value;
    }

    function get(field) {
      return data[field];
    }

    return {
      set: set,
      get: get,
      value: data
    };


  });

