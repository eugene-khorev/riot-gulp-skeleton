var commentStorage = new RiotStorage({
  comments: null,

  load: function () {
    if (this.comments === null) {
      this.comments = data.comments; // for now use global data variable
    }
    return this.comments;
  },

  events: {
    add_comment: function (comment) {
      this.comments.push(comment);
      this.app.trigger('comment_added');
    }
  }
});
