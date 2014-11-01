define (require, exports, module) ->
    ViewHelper = require 'view_helper'
    VedioView = Marionette.LayoutView.extend
        className: 'vedio'
        template: ViewHelper.compile '<img src="./assets/img/big/1.png" alt="..." class="img-rounded"><img src="./assets/img/play_1.png" alt="..." class="img-rounded" style="margin-top: -500px">'
