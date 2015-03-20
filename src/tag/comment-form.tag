<comment-from>
  <form onsubmit={ submit }>
    <hr>
    <label>Author</label>
    <input type="text" name="author" value="{ comment.author }">

    <label>Comment</label>
    <textarea name="text" value="{ comment.text }"></textarea>

    <hr>
    <button>{ index ? 'save' : 'add' } #{ parent.comments.length + 1 } comment</button>
  </form>

  <script>
    var self = this;

    self.index = -1;
    self.comment = {
      author: null,
      text: null
    }

    self.load = function (index, comment) {
      self.index = index;
      self.comment = comment;
      self.update();
    }

    self.submit = function () {
      self.comment.author = self.author.value;
      self.comment.text = self.text.value;
      riot.route('comments/' + self.index + '/save');
    }
  </script>
</comment-from>
