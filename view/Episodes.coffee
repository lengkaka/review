define (require, exports, module) ->
    ViewHelper = require 'view_helper'

    EpisodeView = Marionette.ItemView.extend
        tagName: 'li'
        template: ViewHelper.compile '<div review_episode="1" data-src="{{vedioUrl}}"><img src="./assets/img/small/{{index}}.png"/><span class="watch">Watch</span><span class="episode-number">{{episodeNumber}}</span><span class="episode-title">{{name}}</span><span class="episode-description">{{description}}</span></div>'

    EpisodesListView = Marionette.CompositeView.extend
        className: 'episode-slider'
        template: ViewHelper.compile '<ul class="episode-list"></ul>'
        childViewContainer: '.episode-list'
        childView: EpisodeView


