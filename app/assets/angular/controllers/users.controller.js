(function() {
    'use strict';

    angular.module('App')
        .controller("UsersController", UsersController);

    UsersController.$inject = ['$scope', 'UsersResource'];

    function UsersController($scope, UsersResource) {
        var vm = this;

        vm.users = UsersResource.query();

        activate();
        ////////////////////////////////////////

        function activate() {
        }
    }
})();
