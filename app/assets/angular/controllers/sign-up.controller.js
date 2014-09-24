(function() {
    'use strict';

    angular.module('App')
        .controller("SignupController", SignupController);

    SignupController.$inject = ['$log', 'Auth', '$scope', '$routeParams', 'UsersResource', 'FileUploader'];

    function SignupController($log, Auth, $scope, $routeParams, UsersResource, FileUploader) {
        var vm = this;

        vm.credentials = getCredentialsObj();
        vm.register = register;

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
                city_id: null
            }
        }

        function register() {
            $log.log("GOGOG")
            Auth.register(vm.credentials).then(function(registeredUser) {
                console.log(registeredUser); // => {id: 1, ect: '...'}
            }, function(error) {
                // Registration failed...
                console.log(error);
            });

        }

    }
})();
