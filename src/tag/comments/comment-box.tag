<comment-box>
  <h1>Comments</h1>
  <comment-list comments={ comments }></comment-list>
  <comment-form></comment-form>

  <script>
    var self = this;

    // bindings
    self.comments = commentStorage.getComments();

    // event handlers
    self.onCommentAdded = function (comment) {
      self.update({
        comments: commentStorage.getComments()
      });
    };

    // event bindings
    riot.on('comment_added', self.onCommentAdded);
  </script>
</comment-box>
