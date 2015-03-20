var commentStorage = riot.observable({

  comments: null,

  load: function() {
    var self = this;

    if (self.comments === null) {
      this.comments = data.comments;
    }

    return self.comments;
  }

});

commentStorage.on('add_comment', function (comment) {
  commentStorage.comments.push(comment);
  commentStorage.trigger('comment_added');
});

var RiotApp = function(riotStartup) {
  var app = riot.observable({

    init: function () {
      var self = this;

      self.data = data;

      riotStartup(app);

      riot.mount('*');

      riot.route(function (chapter, index, action) {
        var event = chapter + '_' + action;
        self.trigger(event, index);
      });

      riot.route(location.hash.slice(1));

      return this;
    }

  });

  app.init();
}

