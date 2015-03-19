<comment-list>
  <comment each={ comment, i in comments } index={ i } author={ comment.author } text={ comment.text }></comment>

  <script>
    this.comments = opts.comments;
  </script>
</comment-list>
