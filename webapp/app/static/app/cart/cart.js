'use strict';

angular.module('cart', ['ngRoute'])
.config(['$routeProvider', function($routeProvider) {
  $routeProvider.when('/cart/:name/:price/:qty', {
    templateUrl: '/static/app/cart/cart.html',
    controller: 'CartCtl'
  });
}])

    // create the controller and inject Angular's $scope
    myApp.controller('CartCtl', function($routeParams, $scope, Service) {
        // create a message to display in our view
        $scope.message = 'Cart'; 

        console.log($scope.message);
        console.log("name=", $routeParams.name);
        console.log("price=", $routeParams.price);
        console.log("qty=", $routeParams.qty);

        function isEmpty(ob){
            for(var i in ob){
                if(ob.hasOwnProperty(i))
                {
                    //console.log("has property");
                    return false;
                }
            }
            //console.log("is empty");
            return true;
        }


        var orderdata =[];

        if (isEmpty(Service.get("order"))) {
            console.log("order is empty");
        }
        else {
            orderdata=Service.get("order");
            console.log("orderdata original=", orderdata);
        }

        if (orderdata == "null") {
            console.log("order is null");
            orderdata= {"name" : $routeParams.name, "price": $routeParams.price, "qty": $routeParams.qty};           
        }
        else {
            console.log("data exists");
            orderdata.push({"name" : $routeParams.name, "price": $routeParams.price, "qty": $routeParams.qty});
            Service.set(orderdata,"order")
        }
        //Service.set(orderdata,'order');
        $scope.orderdata = orderdata;
        console.log("final order=", orderdata);
    });

        
