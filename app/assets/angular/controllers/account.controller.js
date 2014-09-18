(function() {
    'use strict';

    angular.module('App')
        .controller("AccountController", AccountController);

    AccountController.$inject = ['$scope', 'AuthResource'];

    function AccountController($scope, AuthResource) {
        var vm = this;

        vm.logout = logout;

        ////////////////////////////////////////

        function logout(argument) {
            AuthResource.logout(function() {
                location.reload();
            });
        }
    }
})();
