'use strict';

App.directive('errSrc', function() {
    return {
        link: function(scope, element, attrs) {

            element.bind('error', function() {
                $log.warning("Error on image loading.");
                if (attrs.src != attrs.errSrc) {
                    attrs.$set('src', attrs.errSrc);
                }
            });
        }
    }
});
