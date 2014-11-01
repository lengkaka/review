define (require, exports, module) ->
    ViewHelper = require 'view_helper'

    EpisodeView = Marionette.ItemView.extend
        tagName: 'li'
        template: ViewHelper.compile '<div class="episode-card" review_episode="1" data-src="{{vedioUrl}}"><img src="./assets/img/small/{{index}}.png"/><span class="watch">Watch</span><span class="episode-number">{{episodeNumber}}</span><span class="episode-title">{{name}}</span><span class="episode-description">{{description}}</span></div>'
        events:
            'mouseenter [review_episode]': 'enterEpisodeAction'
            'mouseleave [review_episode]': 'leaveEpisodeAction'
            'click': 'clickAction'

        enterEpisodeAction: ->
            console.log 111
            @$el.fadeTo(0, 1);
            do @$el.find('.watch').show

        leaveEpisodeAction: ->
            console.log 333
            @$el.fadeTo(0, 0.5);
            do @$el.find('.watch').hide

        clickAction: ->
            console.log 222
            @$el.fadeTo(0, 1);
            do @$el.find('.watch').show

    EpisodesListView = Marionette.CompositeView.extend
        className: 'episode-slider'
        template: ViewHelper.compile '<ul class="episode-list"></ul>'
        childViewContainer: '.episode-list'
        childView: EpisodeView


