(function() {
    'use strict';

    angular.module('App')
        .controller("SignupController", SignupController);

    SignupController.$inject = ['$log', '$scope', '$routeParams', 'UsersResource', 'FileUploader'];

    function SignupController($log, $scope, $routeParams, UsersResource, FileUploader) {
        var vm = this;

        vm.registrationModel = getRegistrationModel();
        vm.addEntry = addEntry;

        ////////////////////////////////////////

        function getRegistrationModel() {
            return {
                email: "",
                password: "",
                city: ""
            }
        }

        function addEntry() {
            $log.debug("Send.");
        }

    }
})();
