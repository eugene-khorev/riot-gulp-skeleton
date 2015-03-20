<comment-box>
  <h1>Comments</h1>
  <comment-list comments={ comments }></comment-list>
  <comment-from></comment-from>

  <script>
    var self = this;
    var app = opts;
    self.comments = app.comments;

    app.on('comments_edit', function (index) {
      var form = self.tags['comment-from'];
      var comment = self.comments[index];
      form.load(index, comment);
    });

    app.on('comments_save', function (index) {
      var form = self.tags['comment-from'];

      if (form.comment.author && form.comment.text) {
        if (form.index >= 0) {
          self.comments[form.index] = form.comment;
        } else {
          self.comments.push(form.comment);
        }
      }
      form.load();
      self.update();
    });
  </script>
</comment-box>
