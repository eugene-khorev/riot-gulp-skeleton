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

    // state
    self.comment = opts.comment;
    self.dataset = opts.dataset || 'comment-box';

    // handle form submition
    self.onSubmit = function () {
      if (!self.author.value || !self.text.value) {
        return;
      }

      self.add.disabled = true;

      riot.trigger('add_comment', self.dataset, {
        author: self.author.value,
        text: self.text.value
      });
    }

    // handle added comment
    self.onCommentAdded = function (dataset, comment) {
      if (dataset === self.dataset) {
        self.author.value = '';
        self.text.value = '';

        self.add.disabled = false;
      }
    };

    // event bindings
    riot.on('comment_added', self.onCommentAdded);
  </script>
</comment-form>
