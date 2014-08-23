App.controller("EditUserCtrl", function ($scope, Users) {
  $scope.model = {}

    var user = Users.get({id:$routeParams.id});
    
    user.$promise.then(function (data) {
      $scope.model.lastName = data.last_name;
      $scope.model.img = data.pic;
      $scope.model.email = data.email;
    })
})