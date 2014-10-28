// Generated by CoffeeScript 1.7.1
(function() {
  define(function(require, exports, module) {
    var app, appController, router;
    router = require('module/application_router');
    appController = {
      showDefault: function() {
        App.app.episode.Controller.execute();
        console.log(arguments);
        return console.log('play default');
      },
      playEpisode: function() {
        console.log(arguments);
        return console.log('play episode');
      },
      notFound: function() {
        App.app.episode.Controller.execute();
        console.log(arguments);
        return console.log('not found');
      }
    };
    app = new Marionette.Application();
    App.app = app;
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
    app.on('start', function(options) {
      if (Backbone.history) {
        return Backbone.history.start({
          pushState: true
        });
      }
    });
    return module.exprots = app;
  });

}).call(this);
