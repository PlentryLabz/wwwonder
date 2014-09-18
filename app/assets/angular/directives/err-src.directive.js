(function() {
    'use strict';

    angular.module('App')
        .directive('errSrc', errSrc);

    errSrc.$inject = [];

    function errSrc() {
        var directive = {
            link: link
        }

        return directive;
        ////////////////////////////////////////

        function link(scope, element, attrs) {

            element.bind('error', function() {
                $log.warning("Error on image loading.");
                if (attrs.src != attrs.errSrc) {
                    attrs.$set('src', attrs.errSrc);
                }
            });
        }
    }
})();
