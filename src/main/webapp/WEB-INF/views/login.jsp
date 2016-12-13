<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.16/angular.min.js"></script>
	
<script src="https://cdnjs.cloudflare.com/ajax/libs/angular-ui-router/0.3.1/angular-ui-router.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/angular-ui-router/0.3.1/angular-ui-router.min.js"></script>

</head>
<style>
body {
    background-color: bisque;
}
</style>
<script>
	// Defining angularjs application.

	var app = angular.module("app",[]);
	ap.ng-controller('loginController', function($scope, $http){
		
		$scope.checkLogin = function(result){
			$http({
				method : 'GET',
			//	url : 'http://localhost:8085/collaboration/user/{cAmogh}',
				url : 'http://localhost:8080/collaboration/users',
				data : $scope.user, //forms user object
				headers : {
					'Content-Type' : 'application/json'
				}
			})
			.success(function(response){
				$scope.myData = response;
				if(angular.isUndefined($scope.myData.name)){
					alert("valid");
				}else{
					if($scope.myData.fname!=$scope.passwd)
						alert("invalid pass");
				}
			})
			.error(function(){
				alert("opps..!!");
			})
		}		
	});	
	</script>

<body ng-app="app"  >
<div ng-controller="MainCtrl">
<form ng-submit = "users" method="get">
<table>
<tr>
<td> Enter name: </td>
<td><input type="text" id="user_name" name="user_name" ng-model="user_name"/></td>
</tr>
<tr>
<td> Enter Pass: </td>
<td><input type="password" id="passwd" name="passwd" ng-model="passwd"/></td>
</tr>
<tr>
<td colspan="2">
<input type="submit"/></td>
</tr>
</table>
</form>
</div>



          </div>
        </div>
      </div>
      <div class="col-md-4"></div>
    </div>
  </div>	
</body>
</html>