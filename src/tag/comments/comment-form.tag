<comment-form>
  <form class="pure-form pure-form-stacked" onsubmit={ onSubmit }>
    <fieldset>
      <legend>Add your comment</legend>
      <label for="author">Author</label>
      <input type="text" id="author" name="author" placeholder="Author" value="{ comment.author }">

      <label for="text">Comment</label>
      <textarea id="text" name="text" placeholder="Text" value="{ comment.text }"></textarea>

      <hr>
      <button type="submit" class="pure-button pure-button-primary" name="add">
        <i class="fa fa-cog"></i> Add comment
      </button>
    </fieldset>
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
