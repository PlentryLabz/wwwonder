'use strict';

App.controller("UserCtrl", function($log, $scope, $routeParams, Users, FileUploader) {

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
        $scope.model.avatar_tmp = data.pic_tmp;
        $scope.model.images = data.images;
        $scope.model.email = data.email;
        $scope.model.phone = data.phone_number;
        $scope.model.birthday = data.birthday;
        $scope.model.about = data.about;
        $scope.model.city = data.city.name_ru;
    })


    /**
     * Avatar uploader section
     */

    var avatarUploader = $scope.avatarUploader = new FileUploader({
        url: 'http://localhost:3000/api/v1/upload',
        alias: "pic"
    });

    // hack for selecting file by clicking on a div
    avatarUploader.selectFile = function () {
       // ToDo: if CurrentUser isn't an owner of the profile, don't do nothing
       // code somthing like this: if (!$scope.currentUser.is_owner_of_profile) return;
       document.getElementById('avatar-uploader').click();
    };

    // CALLBACKS

    avatarUploader.onWhenAddingFileFailed = function(item /*{File|FileLikeObject}*/, filter, options) {
        $log.debug('onWhenAddingFileFailed', item, filter, options);
    };
    avatarUploader.onAfterAddingFile = function(fileItem) {
        $log.debug('onAfterAddingFile', fileItem);
    };
    avatarUploader.onAfterAddingAll = function(addedFileItems) {
        avatarUploader.uploadAll();
        $log.debug('onAfterAddingAll', addedFileItems);
    };
    avatarUploader.onBeforeUploadItem = function(item) {
        $log.debug('onBeforeUploadItem', item);
    };
    avatarUploader.onProgressItem = function(fileItem, progress) {
        $log.debug('onProgressItem', fileItem, progress);
    };
    avatarUploader.onProgressAll = function(progress) {
        $log.debug('onProgressAll', progress);
    };
    avatarUploader.onSuccessItem = function(fileItem, response, status, headers) {
        $log.debug('onSuccessItem', fileItem, response, status, headers);
    };
    avatarUploader.onErrorItem = function(fileItem, response, status, headers) {
        $log.debug('onErrorItem', fileItem, response, status, headers);
    };
    avatarUploader.onCancelItem = function(fileItem, response, status, headers) {
        $log.debug('onCancelItem', fileItem, response, status, headers);
    };
    avatarUploader.onCompleteItem = function(fileItem, response, status, headers) {
        $log.debug('onCompleteItem', fileItem, response, status, headers);
    };
    avatarUploader.onCompleteAll = function() {
        $log.debug('onCompleteAll');
    };

    $log.debug('avatarUploader', avatarUploader);

});