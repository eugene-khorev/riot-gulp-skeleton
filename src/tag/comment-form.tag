<comment-from>
  <form onsubmit={ submit }>
    <hr>
    <label>Author</label>
    <input type="text" name="author">

    <label>Comment</label>
    <textarea name="text"></textarea>

    <hr>
    <button>Add #{ parent.comments.length + 1 } comment</button>
  </form>

  <script>
    this.submit = function () {
      this.parent.add({
        author: this.author.value,
        text: this.text.value,
      });

      this.author.value = '';
      this.text.value = '';
    }
  </script>
</comment-from>
