define (require, exports, module) ->
    ViewHelper = require 'view_helper'
    VedioView = Marionette.LayoutView.extend
        className: 'vedio'
        template: ViewHelper.compile '<img src="./assets/img/big/1.png" alt="..." class="img-rounded"><img src="./assets/img/play_1.png" alt="..." class="img-rounded" style="margin-top: -500px">'
        events:
            'click': 'playCurrentEpisodeAction'
        onRender: ->
            _.bindAll this, 'playVideo'
            App.app.commands.setHandler 'play:vedio', @playVideo
        onDestroy: ->
            App.app.commands.removeHandler 'play:vedio', @playVideo
        playVideo: (vedioUrl = null)->
            return if not vedioUrl
            $vedioDom = $('<embed src="" allowFullScreen="true" quality="high" width="600" height="500" align="middle" allowScriptAccess="always" type="application/x-shockwave-flash" flashvars="isAutoPlay=true"></embed>')
            $vedioDom.attr 'src', vedioUrl
            @$el.html $vedioDom
            App.app.$scrollContainer.animate scrollTop: 0, 800
        playCurrentEpisodeAction: ->
            #get current episode
            curEpiVedioUrl = App.app.request 'get:curEpiVedioUrl'
            @playVideo curEpiVedioUrl