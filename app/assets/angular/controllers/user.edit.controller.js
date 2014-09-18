(function() {
    'use strict';

    angular.module('App')
        .controller("EditUserController", EditUserController);

    EditUserController.$inject = ['$scope', 'UsersResource'];

    function EditUserController ($scope, UsersResource) {
        var vm = this;

        vm.model = new UsersResource();
        vm.model.user = {};
        vm.saveUser = saveUser;
        
        activate();
        ////////////////////////////////////////

        function activate() {
            var currentUser = UsersResource.current();

            currentUser.$promise.then(function(data) {
                vm.model.user.last_name = data.last_name;
                vm.model.user.first_name = data.first_name;
                vm.model.user.instagram_link = data.instagram_link;
                vm.model.user.vk_link = data.vk_link;
                vm.model.user.twitter_link = data.twitter_link;
                vm.model.user.birthday = data.birthday;
                vm.model.user.about = data.about;
            })
        }

        function saveUser(argument) {
            vm.model.$update();
        }

    }
})();
