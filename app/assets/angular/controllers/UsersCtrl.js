(function() {

	App.controller("UsersCtrl", function ($scope, Users) {

		$scope.model = {
			users : Users.query(),
		}
		
	})

})()