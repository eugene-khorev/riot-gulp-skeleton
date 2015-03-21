var commentStorage = new RiotStorage({
  comments: null,

  data: function() {
    if (this.comments === null) {
      this.comments = data.comments; // for now use global data variable
    }

    return this.comments;
  },

  events: {
    add_comment: function (data) {
      this.comments.push(data.comment);
      this.trigger({
        comment_added: data
      });
    }
  }
});
