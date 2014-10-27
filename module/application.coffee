define (require, exports, module) ->
    # app_router
    router = require 'module/application_router'
    VedioView = require 'view/Vedio'
    EpisodeListView = require 'view/Episodes'
    appController =
        showDefault: () ->
            App.app.content.show new VedioView
            console.log arguments
            console.log 'play default'
        playEpisode: () ->
            console.log arguments
            console.log 'play episode'
        notFound: () ->
            console.log arguments
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

    app.on 'start', (options) ->
        if Backbone.history
            Backbone.history.start pushState: true

    module.exprots = app
