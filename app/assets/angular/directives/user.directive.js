(function() {
    'use strict';

    angular.module('App')
        .directive("user", user);

    user.$inject = [];

    function user(UsersResource) {
        var directive = {
            scope: {},
            restrict: "E",
            templateUrl: "/web/user",
            replace: true,
            link: link
        };

        return directive;
        ////////////////////////////////////////

        function link(scope, element, attrs) {
            scope.model = {
                email: attrs.email,
                link: "#/users/" + attrs.id,
                avatar: "assets/" + attrs.pic,
            };
        }
    }
})();
