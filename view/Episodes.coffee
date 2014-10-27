define (require, exports, module) ->
    ViewHelper = require 'view_helper'

    EpisodeView = Marionette.ItemView.extend
        template: ViewHelper.compile '<li><div review_episode="1" data-src="{{vedioUrl}}"><img src="./assets/img/small/{{index}}.png"/><span class="watch">Watch</span><span class="episode-number">{{episodeNumber}}</span><span class="episode-title">{{name}}}</span><span class="episode-description">{{description}}</span></div></li>'

    EpisodesListView = Marionette.CompositeView.extend
        template: ViewHelper.compile '<div class="episode-slider"><ul class="episode-list"></ul></div>'
        childViewContainer: '.episode-list'
        childView: EpisodeView


