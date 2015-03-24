var riot = (function (riot) {
  // injection
  riot.commentStorage = new function () {
    var self = this;

    // init data
    self.comments = data.comments;

    // methods & event handlers
    self.addComment = function (dataset, comment) {
      self.comments[dataset].push(comment);

      setTimeout(function () {
        riot.trigger('comment_added', dataset, comment);
      }, 500);
    }

    self.getComments = function (dataset) {
      return self.comments[dataset];
    };

    // bind events
    riot.on('add_comment', self.addComment);

    // return public interface
    return {
      getComments: self.getComments
    };
  };

  return riot;
}(riot));
