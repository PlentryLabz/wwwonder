(function () {
	
	App.service('Users', function ($resource) {
		var users = $resource('http://localhost:3000/api/v1/users/:id', 
			{
				id : '@id'
			},
			{
				update : { 
					method: "PUT" 
				}
			}
		);

		return users;
	})

})()