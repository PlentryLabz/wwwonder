(function() {
    'use strict';

    angular.module('App')
        .controller("UserController", UserController);

    UserController.$inject = ['$log', '$routeParams', 'UsersResource', 'FileUploader'];

    function UserController($log, $routeParams, UsersResource, FileUploader) {
        var vm = this;

        vm.model = {}

        vm.user = UsersResource.get({
            id: $routeParams.id
        });

        vm.user.$promise.then(function(data) {
            vm.model.lastName = data.last_name;
            vm.model.firstName = data.first_name;
            vm.model.instagram = data.instagram_link;
            vm.model.vk = data.vk_link;
            vm.model.twitter = data.twitter_link;
            vm.model.avatar = data.pic;
            vm.model.avatar_tmp = data.pic_tmp;
            vm.model.images = data.images;
            vm.model.email = data.email;
            vm.model.phone = data.phone_number;
            vm.model.birthday = data.birthday;
            vm.model.about = data.about;
            vm.model.city = data.city.name_ru;
        })

        ////////////////////////////////////////
    }
})();
