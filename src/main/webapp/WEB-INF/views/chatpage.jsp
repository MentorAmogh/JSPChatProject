<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.16/angular.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/angular-ui-router/0.3.1/angular-ui-router.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/angular-ui-router/0.3.1/angular-ui-router.min.js"></script>

</head>
<style>
body {
	background-color: bisque;
}
</style>
<script>
	// Defining angularjs application.
	var postApp = angular.module("postApp", []);
	// Controller function and passing $http service and $scope var.

	

	postApp.controller('ChatController', function($scope) {
		$scope.chatMessages = [];
		$scope.formatChat = function(username, text, origDt) {
			var chat = {};
			chat.username = username;
			chat.text = text;
			chat.origDt = origDt;
			return chat;
		}
		$scope.addChat = function() {
			if ($scope.newChatMsg != "") {
				var chat = $scope.formatChat("Amogh Chitnis",
						$scope.newChatMsg, new Date());
				$scope.chatMessages.push(chat);
				$scope.newChatMsg = "";
			}

		}//old block of code
	});
	app.filter('reverse', function() {
		return function(items) {
			return items.slice().reverse();
		};
	});

</script>
<body ng-app="postApp">

	<div class="container">
		<div class="row">
			<div class="col-md-12">&nbsp;</div>
		</div>
		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<div class="row">
					<div class="col-md-12">

						<div class="panel panel-primary" ng-controller="ChatController">
							<!-- chatController -->
							<div class="panel-heading" style="padding: 0 0 0 8px;">
								<span class="glyphicon glyphicon-user"></span>
								<h6 class="panel-title" style="display: inline;">Chat</h6>
								<div class="btn-group btn-group-xs pull-right">
									<button type="button" class="btn btn-primary">
										<span class="glyphicon glyphicon-lock"></span>
									</button>
									<button type="button" class="btn btn-primary">
										<span class="glyphicon glyphicon-cog"></span>
									</button>
									<button type="button" class="btn btn-primary">
										<span class="glyphicon glyphicon-remove"></span>
									</button>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="panel-body" style="padding: 0 4px;">
								<div class="row">
									<div class="col-xs-12"
										style="max-height: 300px; max-width: 100%; overflow-y: auto; overflow-x: hidden;">
										<table class="table table-hover table-condensed" style="">
											<tr ng-hide="chatMessages.length === 0"
												ng-repeat="chat in chatMessages | orderBy:origDt "
												style="min-width: 100%; max-width: 100%; width: 100%;">

												<td>
													<h6>{{chat.username}}</h6>
												</td>
												<td>
													<p class="word-wrap:break-word">
														<small>{{chat.text}}</small>
													</p>
												</td>
											</tr>
											<tr ng-show="chatMessages.length === 0">
												<td>
													<p>
														Nothin' here. {{chat.username}}<strong>Say
															something!</strong>
													</p>
												</td>
											</tr>
										</table>
									</div>
								</div>
							</div>
							
							<!-- FORM -->
							<div class="panel-footer">
								<form name="userForm" ng-submit="submitForm()">
									<div class="input-group input-group-sm">
										<span class="input-group-addon">
									</span> <input type="text" class="form-control" ng-model="newChatMsg"
											placeholder="..." /> <span class="input-group-btn">
											<button class="btn btn-primary" type="submit"
												ng-click="addChat()">Send</button>
										</span>
									</div>
								</form>
							</div>
						</div>


					</div>
				</div>
			</div>
			<div class="col-md-4"></div>
		</div>
	</div>
</body>
</html>