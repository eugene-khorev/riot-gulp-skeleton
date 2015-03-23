<comment-list>
  <comment each={ comments } app={ app } author={ author } text={ text }></comment>

  <script>
    var self = this;

    // state
    self.comments = opts.comments;
  </script>
</comment-list>
