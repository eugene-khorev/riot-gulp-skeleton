<comment-box>
  <h1>Comments</h1>
  <comment-list comments={ comments }></comment-list>
  <comment-from></comment-from>

  <script>
    this.comments = opts.comments;

    this.add = function (comment) {
      this.comments.push(comment);
      this.update();
    }
  </script>
</comment-box>
