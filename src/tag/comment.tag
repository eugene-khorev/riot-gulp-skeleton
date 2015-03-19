<comment>
  <div className="comment">
    <h2 className="commentAuthor">
      { author }
    </h2>
    { text }
  </div>

  <script>
    this.text = this.root.innerHTML;
    this.root.innerHTML = '';
  </script>
</comment>
