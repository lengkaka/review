define (require, exports, module) ->
    # app_router
    router = require 'module/application_router'
    appController =
        playEpisode: () ->
            console.log arguments
            console.log 'play vedio'
        notFound: () ->
            console.log arguemnts
            console.log 'not found'
    app = new Marionette.Application()
    app.addRegions
        content: ".content"
        episodes: ".episode-block"

    app.navigate = (route, options) ->
        options = options || {}
        Backbone.history.navigate route, options

    app.addInitializer ->
        router = new router controller: appController

    app.on 'initialize:after', (options) ->
        if Backbone.history
            do Backbone.history.start

    module.exprots = app
