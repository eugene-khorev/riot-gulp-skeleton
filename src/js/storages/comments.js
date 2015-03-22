function CommentStorage() {
  var self = this;

  self.comments = data.comments;

  self.addComment = function (comment) {
    self.comments.push(comment);
    riot.trigger('comment_added', comment);
  }

  // event bindings
  riot.on('add_comment', self.addComment);

  return {
    getComments: function () {
      return self.comments;
    }
  };
}
