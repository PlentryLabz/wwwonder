(function() {

	App.controller("UsersCtrl", function ($scope, Users) {

		$scope.model = {
			users : Users.query(),
			newUser : new Users({name: "unknown"}),
			response : ""
		}

		$scope.create = function () {
			
			var newUser = $scope.model.newUser;
			newUser.$save(
				newUser, 
				function(response) {
					$scope.model.users.push(response);
					$scope.model.response = "SUCCESS";			
				},
				function(response) {
					$scope.model.response = response.data.errors;	
				}
			)
		};
	})

	

})()