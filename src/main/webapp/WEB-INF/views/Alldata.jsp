<html>
<head>
<title>My Chat Application</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.3/angular.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.9/angular-resource.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="/WEB-INF/user_service.js"></script>


</head>
<body ng-app="myApp">
	<script>
		var app = angular.module('myApp', []);
		app.controller('customersCtrl', function($scope, $http) {
			
			$http.get("http://localhost:8080/collaboration/user").then(
					function(response) {
						$scope.names = response.data;
					});
			$scope.deleteInfo = function() {
				// Posting data to php file
				$http({
					method : 'DELETE',
					url : 'http://localhost:8080/collaboration/user/1001',
					data : $scope.user, //forms user object
					headers : {
						'Content-Type' : 'application/json'
					}
				}).success(function(data) {
					if (data.errors) {
						// Showing errors.
						$scope.errorName = data.errors.name;
						$scope.errorUserName = data.errors.username;
						$scope.errorEmail = data.errors.email;
						$scope.errorAddress = data.errors.email;
						$scope.errorPhone = data.errors.email;

					} else {
						window.location = "Alldata.jsp";
						//$scope.message = data.message;	
						alert("Data Inserted" + data.message);

					}
				});
			};

			
		});
		
		
		
		
	</script>
	<div ng-controller="customersCtrl" id="pdata">
		<h1>Details Of All Users</h1>
		<table border=2>
			<th>User Name</th>
			<th>address</th>
			<th>Email</th>
			<th>Phone Number</th>
			<th>Edit</th>
			<th>Delete</th>
			<tr ng-repeat="x in names">
				<td>{{ x.username }}</td>
				<td>{{ x.address }}</td>
				<td>{{ x.email }}</td>
				<td>{{ x.phno }}</td>
				<td><span><button class="btn btn-warning"
							ng-click="editInfo(detail)" title="Edit">
							<span class="glyphicon glyphicon-edit"></span>
						</button></td>
				<td><span><button class="btn btn-danger"
							ng-click="deleteInfo()" title="Delete">
							<span class="glyphicon glyphicon-trash"></span>
						</button></td>
			</tr>
		</table>
	</div>
</body>
</html>