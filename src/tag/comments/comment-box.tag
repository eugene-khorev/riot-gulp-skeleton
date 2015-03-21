<comment-box>
  <h1>Comments</h1>
  <comment-list comments={ comments }></comment-list>
  <comment-form></comment-form>

  <script>
    var self = this;

    self.comments = commentStorage.init(app)
      .events({
        comment_added: function (data) {
          self.update({
            comments: commentStorage.data()
          });
        }
      })
      .data();
  </script>
</comment-box>
