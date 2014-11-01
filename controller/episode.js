// Generated by CoffeeScript 1.7.1
(function() {
  define(function(require, exports, module) {
    var EpisodeListView, PlayView;
    PlayView = require('view/play');
    EpisodeListView = require('view/episode');
    return App.app.module('episode', function(Module, App, Backbone, Marionette, $, _) {
      return Module.Controller = {
        execute: function() {
          App.content.show(new PlayView);
          return App.episodes.show(new EpisodeListView({
            collection: this.getEpisodes()
          }));
        },
        getEpisodes: function() {
          var collection, vedioDescriptions, vedioIndexs, vedioNumbers, vedioTitle, vedioUrls;
          collection = new Backbone.Collection;
          vedioUrls = ["http://player.youku.com/player.php/sid/XNzQ3Mjg5OTY4/v.swf", "http://player.youku.com/player.php/sid/XNzQ1MzQwNDY0/v.swf", "http://player.youku.com/player.php/sid/XNzM1MjExNDc2/v.swf", "http://player.youku.com/player.php/sid/XNzE4OTY2MDEy/v.swf"];
          vedioIndexs = [1, 2, 3, 4];
          vedioNumbers = [4, 3, 2, 1];
          vedioTitle = ['Timothy Tuttle', 'Timothy Tuttle', 'Garry Tan', 'Mike McCue'];
          vedioDescriptions = ['Part1，MindMeld创始人，针对特定的内容，我们能比Siri和Google Now做的更好。', 'Part2，MindMeld创始人，我们对星际迷航的想象，能通过由“语境”驱动的搜索实现。', 'Y Combinator合伙人，Make Something People Want，这就是最高准则。', 'Flipboard创始人，如果你不小心把Web删了，一切都得重来，你创造的Web还会是今天的模样吗？'];
          _.each(vedioUrls, function(url, index) {
            var episodeObj;
            episodeObj = {
              vedioUrl: url,
              index: vedioIndexs[index],
              episodeNumber: vedioNumbers[index],
              name: vedioTitle[index],
              description: vedioDescriptions[index]
            };
            return collection.add(episodeObj);
          });
          return collection;
        }
      };
    });
  });

}).call(this);
