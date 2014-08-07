(function() {
	App.directive("user", function(Users) {
		return {
			scope: {},
			restrict: "E",
			templateUrl : "user.html",
			replace: true,
			link: function (scope, element, attrs) {
				scope.model = {
					name: attrs.name,
	 				link : "#/users/" + attrs.id,
					avatar : "avatarstorage/" + attrs.id
				};
			}
		}
	})
})()