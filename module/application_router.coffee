define (require, exports, module) ->
    AppRouter = Marionette.AppRouter.extend
        appRoutes:
            "review(/)(index)": "showDefault"
            "review/:episode_num": "playEpisode"
            "*notFound": "notFound"
        onRoute: (name, path, args) ->
            console.log arguments
