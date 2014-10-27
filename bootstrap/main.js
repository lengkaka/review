var App = App || {};
define(function(require, exports, module) {
    $(function() {
        console.log(111);
        var app = require('module/application');

        app.start();
    });
});
