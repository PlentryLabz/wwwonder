'use strict';

App.directive("user", function(Users) {
    return {
        scope: {},
        restrict: "E",
        templateUrl: "user.html",
        replace: true,
        link: function(scope, element, attrs) {
            scope.model = {
                email: attrs.email,
                link: "#/users/" + attrs.id,
                avatar: "assets/" + attrs.pic,
            };
        }
    }
});