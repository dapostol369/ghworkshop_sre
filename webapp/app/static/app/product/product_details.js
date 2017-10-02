'use strict';

angular.module('product_details', ['ngRoute'])
.config(['$routeProvider', function($routeProvider) {
  $routeProvider.when('/product_details/:num', {
    templateUrl: '/static/app/product/product_details.html',
    controller: 'ProductDetailsCtl'
  });
}])

// create the controller and inject Angular's $scope
myApp.controller('ProductDetailsCtl', function($scope, $http, $routeParams) {
    // create a message to display in our view
    $scope.message = 'PRODUCTDETAILS';

    console.log($scope.message)
    

    var productdetails;
    var qty;

    $http.get('productdata/'+ $routeParams.num).success(function(data) {
        $scope.productdetails = data;
        productdetails=data;
        console.log("productdetail=",$scope.productdetails);
        console.log("num=", productdetails[0].num);    
    });  

    //qty=$scope.qty;
    console.log("qty",$scope.qty );

    $scope.checkoptions = function () {
        //console.log("in checkoptions, inventory=" + vm.formData.inventory);
        $scope.msg="";

        //$state.go('wizardform.wizardresult', { 'servicename': $scope.servicename });
        
    };


});

        
