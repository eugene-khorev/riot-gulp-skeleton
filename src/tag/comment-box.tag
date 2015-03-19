<comment-box>
  <div className="commentBox">
    <h1>Comments</h1>
    <comment-list></comment-list>
    <comment-form></comment-form>
  </div>

  <script>
    this.comments = JSON.parse(this.root.innerHTML);
    this.root.innerHTML = '';
  </script>
</comment-box>
