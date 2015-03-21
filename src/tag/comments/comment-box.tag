<comment-box>
  <h1>Comments</h1>
  <comment-list comments={ comments }></comment-list>
  <comment-form></comment-form>

  <script>
    var self = this;

    self.comments = commentStorage.load(app);

    app.on('comment_added', function (comment) {
      self.update({
        comments: commentStorage.comments
      });
    });
  </script>
</comment-box>
