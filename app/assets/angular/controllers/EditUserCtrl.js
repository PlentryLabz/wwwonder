'use strict'

App.controller("EditUserCtrl", function($scope, Users) {
    $scope.model = {}

    var user = Users.current();

    user.$promise.then(function(data) {
        $scope.model.lastName = data.last_name || "asd";
        $scope.model.firstName = data.first_name;
        $scope.model.instagram = data.instagram_link;
        $scope.model.vk = data.vk_link;
        $scope.model.twitter = data.twitter_link;
        $scope.model.images = data.images;
        $scope.model.birthday = data.birthday;
        $scope.model.about = data.about;
        $scope.model.city = data.city.name_ru;
    })

    $scope.save = function() {
        user.last_name = $scope.model.lastName;
        user.$update(function(data) {});
    }

});