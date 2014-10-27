var App = App || {};
define(function(require, exports, module) {
    $(function() {
        App.app = require('module/application');

        App.app.start();
    });
});
