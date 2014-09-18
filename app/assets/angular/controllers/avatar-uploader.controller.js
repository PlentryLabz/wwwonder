(function() {
    'use strict';

    angular.module('App')
        .controller("AvatarUploaderController", AvatarUploaderController);

    AvatarUploaderController.$inject = ['$log', '$scope', 'FileUploader'];


    function AvatarUploaderController($log, $scope, FileUploader) {
        var vm = this;

        vm.avatarUploader = new FileUploader({
            url: 'http://localhost:3000/api/v1/upload',
            alias: "pic"
        });

        vm.localAvatar = null;
        vm.avatarUploader.selectFile = selectFile;

        activate();
        ////////////////////////////////////////

        function activate() {
            vm.avatarUploader.filters.push({
                name: 'imageFilter',
                fn: function(item /*{File|FileLikeObject}*/ , options) {
                    var type = '|' + item.type.slice(item.type.lastIndexOf('/') + 1) + '|';
                    return '|jpg|png|jpeg|'.indexOf(type) !== -1;
                }
            });

            setUpCallbacks()

            $log.debug('avatarUploader', vm.avatarUploader);
        }

        // CALLBACKS
        function setUpCallbacks() {
            vm.avatarUploader.onWhenAddingFileFailed = function(item /*{File|FileLikeObject}*/ , filter, options) {
                $log.debug('onWhenAddingFileFailed', item, filter, options);
            };
            vm.avatarUploader.onAfterAddingFile = function(fileItem) {
                $log.debug('onAfterAddingFile', fileItem);
            };
            vm.avatarUploader.onAfterAddingAll = function(addedFileItems) {
                vm.avatarUploader.uploadAll();
                $log.debug('onAfterAddingAll', addedFileItems);
            };
            vm.avatarUploader.onBeforeUploadItem = function(item) {
                $log.debug('onBeforeUploadItem', item);

                vm.localAvatar = null;
            };
            vm.avatarUploader.onProgressItem = function(fileItem, progress) {
                $log.debug('onProgressItem', fileItem, progress);
            };
            vm.avatarUploader.onProgressAll = function(progress) {
                $log.debug('onProgressAll', progress);
            };
            vm.avatarUploader.onSuccessItem = function(fileItem, response, status, headers) {
                $log.debug('onSuccessItem', fileItem, response, status, headers);
                console.log("HEEE", vm.avatarUploader.queue[0])
                vm.localAvatar = vm.avatarUploader.queue[0];
            };
            vm.avatarUploader.onErrorItem = function(fileItem, response, status, headers) {
                $log.debug('onErrorItem', fileItem, response, status, headers);
            };
            vm.avatarUploader.onCancelItem = function(fileItem, response, status, headers) {
                $log.debug('onCancelItem', fileItem, response, status, headers);
            };
            vm.avatarUploader.onCompleteItem = function(fileItem, response, status, headers) {
                $log.debug('onCompleteItem', fileItem, response, status, headers);
            };
            vm.avatarUploader.onCompleteAll = function() {
                $log.debug('onCompleteAll');

                vm.avatarUploader.clearQueue();
            };
        }

        // hack for selecting file by clicking on a div
        function selectFile() {
            // ToDo: if CurrentUser isn't an owner of the profile, don't do nothing
            // code somthing like this: if (!vm.currentUser.is_owner_of_profile) return;
            document.getElementById('avatar-uploader').click();
        };
    }
})();
