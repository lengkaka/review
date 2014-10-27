// Generated by CoffeeScript 1.7.1
(function() {
  define(function(require, exports, module) {
    var app, appController, router;
    router = require('module/application_router');
    appController = {
      playEpisode: function() {
        console.log(arguments);
        return console.log('play vedio');
      },
      notFound: function() {
        console.log(arguemnts);
        return console.log('not found');
      }
    };
    app = new Marionette.Application();
    app.addRegions({
      content: ".content",
      episodes: ".episode-block"
    });
    app.navigate = function(route, options) {
      options = options || {};
      return Backbone.history.navigate(route, options);
    };
    app.addInitializer(function() {
      return router = new router({
        controller: appController
      });
    });
    app.on('initialize:after', function(options) {
      if (Backbone.history) {
        return Backbone.history.start();
      }
    });
    return module.exprots = app;
  });

}).call(this);
