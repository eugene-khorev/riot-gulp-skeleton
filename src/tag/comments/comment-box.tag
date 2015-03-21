<comment-box>
  <h1>Comments</h1>
  <comment-list comments={ comments }></comment-list>
  <comment-form></comment-form>

  <script>
    var self = this;

    self.comments = commentStorage.init(app)
      .events({
        comment_added: self.onCommentAdded
      })
      .data();

    self.onCommentAdded = function (data) {
      self.update({
        comments: commentStorage.data()
      });
    };
  </script>
</comment-box>
