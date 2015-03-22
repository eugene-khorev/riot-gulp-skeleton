<comment-form>
  <form onsubmit={ onSubmit }>
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

    // bindings
    self.comment = opts.comment;

    // event handlers
    self.onSubmit = function () {
      if (!self.author.value || !self.text.value) {
        return;
      }

      self.add.disabled = true;

      riot.trigger('add_comment', {
        author: self.author.value,
        text: self.text.value
      });
    }

    self.onCommentAdded = function (data) {
      self.author.value = '';
      self.text.value = '';

      self.add.disabled = false;
    };

    // event bindings
    riot.on('comment_added', self.onCommentAdded);
  </script>
</comment-form>
