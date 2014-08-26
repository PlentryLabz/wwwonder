'use strict'

App.controller("UserCtrl", function($scope, $routeParams, Users) {

    $scope.model = {}

    var user = Users.get({
        id: $routeParams.id
    });

    user.$promise.then(function(data) {
        $scope.model.lastName = data.last_name;
        $scope.model.firstName = data.first_name;
        $scope.model.instagram = data.instagram_link;
        $scope.model.vk = data.vk_link;
        $scope.model.twitter = data.twitter_link;
        $scope.model.avatar = data.pic;
        $scope.model.images = data.images;
        $scope.model.email = data.email;
        $scope.model.phone = data.phone_number;
        $scope.model.birthday = data.birthday;
        $scope.model.about = data.about;
        $scope.model.city = data.city.name_ru;
    })

});