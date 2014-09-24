(function() {
    'use strict';

    angular.module('App')
        .controller("SignupController", SignupController);

    SignupController.$inject = ['$log', '$location', 'Auth', '$scope', '$routeParams', 'UsersResource', 'FileUploader'];

    function SignupController($log, $location, Auth, $scope, $routeParams, UsersResource, FileUploader) {
        var vm = this;

        vm.credentials = getCredentialsObj();
        vm.register = register;
        vm.errors = null;

        activation();
        ////////////////////////////////////////
        
        function activation () {
            // Watchers:
            $scope.$on('devise:new-registration', function(event, user) {
                $log.log(event, user);
            });
        }
        
        function getCredentialsObj() {
            return {
                email: '',
                password: '',
                password_confirmation: '',
                city_id: 1
            }
        }

        function register() {
            $log.log("GOGOG")
            // if (vm.credentials.password != vm.credentials.password_confirmation) {
                // vm.errors["password"] = vm.errors["password_confirmation"] = "Passwords do not match.";
                // return;
            // };

            Auth.register(vm.credentials).then(function(registeredUser) {
                console.log(registeredUser); // => {id: 1, ect: '...'}
                $location.path('/users/' + registeredUser.id)
            }, function(respond) {
                $log.error(respond);

                vm.errors = respond.data.errors;
            });

        }

    }
})();
