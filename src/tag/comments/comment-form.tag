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
    commentStorage.init(app)
      .events({
        comment_added: function (data) {
          self.author.value = '';
          self.text.value = '';

          self.add.disabled = false;
        }
      });

    self.submit = function () {
      if (!self.author.value || !self.text.value) {
        return;
      }

      self.add.disabled = true;

      commentStorage.trigger({
        add_comment: {
          comment: {
            author: self.author.value,
            text: self.text.value
          }
        }
      });
    }
  </script>
</comment-form>
