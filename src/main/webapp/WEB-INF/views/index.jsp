<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css"> 
    <script src= "http://ajax.googleapis.com/ajax/libs/angularjs/1.3.16/angular.min.js"></script> 
    <script src="https://cdnjs.cloudflare.com/ajax/libs/angular-ui-router/0.3.1/angular-ui-router.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/angular-ui-router/0.3.1/angular-ui-router.min.js"></script>
</head>
<script>
    // Defining angularjs application.
    var postApp = angular.module('postApp', []);
    // Controller function and passing $http service and $scope var.
    postApp.controller('postController', function($scope, $http) {
      // create a blank object to handle form data.
        $scope.user = {};
      
      // calling our submit function.
    	$scope.register = function(){
    		  window.location = "registration.jsp";
    	} 
    	$scope.login = function(){
  		  window.location = "login.jsp";
  		}
    	$scope.chatPage = function(){
  		  window.location = "chatpage.jsp";
  		}
    	$scope.waindex = function(){
  		  window.location = "waindex.jsp";
  		}
    	$scope.allDetails = function(){
    		  window.location = "Alldata.jsp";
    	}  	
        
    });
</script>
<style>
h1 {
    text-shadow: 2px 2px 5px red;
}
</style>
<body ng-app="postApp" ng-controller="postController">
<div class="container">
<div class="col-sm-8 col-sm-offset-2">
    <div class="page-header">
    <h1>Friends Reunited</h1></div>
    
   
    <div >

</div>    
    <button type="button " ng-click="register()" >Registration form</button>
   
    <button type="button " ng-click="login()">Login</button>
  
    <button type="button " ng-click="chatPage()">Chat Page</button>
   
    <button type="button " ng-click="waindex()">Waindex</button>
      
    <button type="button " ng-click="allDetails()">All Details</button>
</div>

</body>
</html>