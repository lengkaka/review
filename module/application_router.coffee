define (require, exports, module) ->
    AppRouter = Backbone.Marionette.AppRouter.extend
        appRoutes:
            "/:episode_num": "playEpisode"
            "*notFound": "notFound"
        onRoute: (name, path, args) ->
            console.log arguments
