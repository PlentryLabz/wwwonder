App.controller("AccountCtrl", function ($scope, Auth) {
  $scope.logout = function () {
    Auth.logout(function () {
      location.reload();
    });
  }
})