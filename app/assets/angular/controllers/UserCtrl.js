(function() {

	App.controller("UserCtrl", function($scope, $routeParams, Users) {
		$scope.model = {
			user : Users.$get($routeParams.id),
		}
	})

})()