// Generated by CoffeeScript 1.7.1
(function() {
  define(function(require, exports, module) {
    var AppRouter;
    return AppRouter = Backbone.Marionette.AppRouter.extend({
      appRoutes: {
        "/:episode_num": "playEpisode",
        "*notFound": "notFound"
      },
      onRoute: function(name, path, args) {
        return console.log(arguments);
      }
    });
  });

}).call(this);