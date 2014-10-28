var App = App || {};
define(function(require, exports, module) {
    $(function() {
        require('module/application');
        require('controller/episode');

        App.app.start();
    });
});
