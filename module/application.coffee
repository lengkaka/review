define (require, exports, module) ->
    # app_router
    router = require 'module/application_router'
    appController =
        showDefault: ->
            do App.app.episode.Controller.execute
            console.log arguments
            console.log 'play default'
        playEpisode: ->
            console.log arguments
            console.log 'play episode'
        notFound: ->
            do App.app.episode.Controller.execute
            console.log arguments
            console.log 'not found'

    app = new Marionette.Application()
    App.app = app
    app.addRegions
        content: ".content"
        episodes: ".episode-block"

    app.navigate = (route, options) ->
        options = options || {}
        Backbone.history.navigate route, options

    app.addInitializer ->
        app.$scrollContainer = $('body')
        app.$header = $('.wrapper .header')
        app.$footer = $('.wrapper .footer')
        router = new router controller: appController

    app.on 'start', (options) ->
        if Backbone.history
            Backbone.history.start pushState: true

    module.exprots = app
