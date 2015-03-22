<comment-form>
  <form show={ visible } onsubmit={ onSubmit }>
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
    self.visible = opts.visible || true;

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

    self.onCommentAdded = function (comment) {
      self.author.value = '';
      self.text.value = '';

      self.add.disabled = false;
    };

    // event bindings
    riot.on('comment_added', self.onCommentAdded);
    riot.on('update_comment_form', function(data) {
      self.update(data);
    });
  </script>
</comment-form>
