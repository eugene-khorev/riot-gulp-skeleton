<comment-box>
  <div show={ visible }>
    <h1>Comments ({ name })</h1>
    <comment-list comments={ comments }></comment-list>
    <comment-form dataset={ dataset }></comment-form>
  </div>

  <script>
    var self = this;

    // state
    self.name = opts.name || 'comment-box';
    self.dataset = opts.dataset || 'comment-box';
    self.visible = opts.visible;
    self.comments = riot.commentStorage.getComments(self.dataset);

    // handle tab switching
    self.onSwitchTab = function (tab) {
      self.update({
        visible: tab.name === self.name
      });
    }

    // handle added comment
    self.onCommentAdded = function (dataset, comment) {
      if (dataset === self.dataset) {
        self.update({
          comments: riot.commentStorage.getComments(self.dataset)
        });
      }
    };

    // event bindings
    riot.on('tab', self.onSwitchTab);
    riot.on('comment_added', self.onCommentAdded);
  </script>
</comment-box>
