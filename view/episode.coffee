define (require, exports, module) ->
    ViewHelper = require 'view_helper'

    EpisodeView = Marionette.ItemView.extend
        tagName: 'li'
        template: ViewHelper.compile '<div class="episode-card" review_episode="1" data-src="{{vedioUrl}}"><img src="./assets/img/small/{{index}}.png"/><span class="watch">Watch</span><span class="episode-number">{{episodeNumber}}</span><span class="episode-title">{{name}}</span><span class="episode-description">{{description}}</span></div>'
        events:
            'mouseenter [review_episode]': 'enterEpisodeAction'
            'mouseleave [review_episode]': 'leaveEpisodeAction'

        triggers:
            'click': 'episode:selected'

        modelEvents:
            "change:current": "modelSelecteStatusChanged"

        onRender: ->
            console.log 123

        enterEpisodeAction: ->
            do @_showSelectedEffect

        leaveEpisodeAction: ->
            if not @model.get('current')
                do @_showUnselectedEffect

        modelSelecteStatusChanged: ->
            if not @model.get('current')
                do @_showUnselectedEffect
            else
                do @_showSelectedEffect

        _showSelectedEffect: ->
            @$el.fadeTo(0, 1);
            do @$el.find('.watch').show

        _showUnselectedEffect: ->
            @$el.fadeTo(0, 0.5);
            do @$el.find('.watch').hide

    EpisodesListView = Marionette.CompositeView.extend
        className: 'episode-slider'
        template: ViewHelper.compile '<ul class="episode-list"></ul>'
        childViewContainer: '.episode-list'
        childView: EpisodeView

        childEvents:
            'episode:selected': (childView, options)->
                @playEpisode childView, options

        onRender: ->
            _.bindAll this, 'getCurEpiVedioUrl'
            App.app.reqres.setHandler 'get:curEpiVedioUrl', @getCurEpiVedioUrl
            if not @options.currentEpisode
                @currentEpisodeModel = @options.collection.at 0
                @currentEpisodeModel.set 'current', true if @currentEpisodeModel
        onDestroy: ->
            App.app.reqres.removeHanlder 'get:curEpiVedioUrl', @getCurEpiVedioUrl
        getCurEpiVedioUrl: ->
            @currentEpisodeModel.get('vedioUrl') if @currentEpisodeModel

        playEpisode: (childView, options) ->
            if options?.model?
                if @currentEpisodeModel is options.model and @currentEpisodeModel.get('isPlaying')
                    return
                if @currentEpisodeModel isnt options.model
                    if @currentEpisodeModel
                        @currentEpisodeModel.set 'current', false
                    @currentEpisodeModel = options.model
                    @currentEpisodeModel.set 'current', true
                @currentEpisodeModel.set 'isPlaying', true
                # commond to play
                App.app.commands.execute 'play:vedio', @currentEpisodeModel.get 'vedioUrl'


