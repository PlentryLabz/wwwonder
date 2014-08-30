'use strict';

App.controller("EditUserCtrl", function ($scope, Users) {
    $scope.model = new Users();
    $scope.model.user = {};

    var currentUser = Users.current();

    currentUser.$promise.then(function (data) {
        $scope.model.user.last_name = data.last_name;
        $scope.model.user.first_name = data.first_name;
        $scope.model.user.instagram_link = data.instagram_link;
        $scope.model.user.vk_link = data.vk_link;
        $scope.model.user.twitter_link = data.twitter_link;
        $scope.model.user.birthday = data.birthday;
        $scope.model.user.about = data.about;
    })

    $scope.save = function () {
        $scope.model.$update();
    }
});
