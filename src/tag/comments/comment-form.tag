<comment-form>
  <form onsubmit={ submit }>
    <hr>
    <label>Author</label>
    <input type="text" name="author" value="{ comment.author }">

    <label>Comment</label>
    <textarea name="text" value="{ comment.text }"></textarea>

    <hr>
    <button name="add">add</button>
  </form>

  <script>
    var self = this;

    self.comment = opts.comment;

    self.submit = function () {
      if (!self.author.value || !self.text.value) {
        return;
      }

      self.add.disabled = true;

      app.trigger('add_comment', {
        author: self.author.value,
        text: self.text.value
      });
    }

    app.on('comment_added', function (comment) {
      self.author.value = '';
      self.text.value = '';

      self.add.disabled = false;
    });
  </script>
</comment-form>
