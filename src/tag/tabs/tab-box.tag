<tab-box>
  <ul>
    <li each={ name, tab in tabs }><a href="#tab?name={ name }">{ tab.title }</a></li>
  </ul>

  <script>
    var self = this;

    // state
    self.name = opts.name || 'tab-box';
    self.dataset = opts.dataset || 'tab-box';
    self.tabs = riot.tabStorage.getTabs(self.dataset);
    self.activeTab = null;

    // handle application start
    self.onStart = function () {
      if (!self.activeTab) {
        riot.trigger('tab', {
          name: Object.keys(self.tabs).slice(0, 1)[0]
        });
      }
    }

    // handle tab switching
    self.onSwitchTab = function (tab) {
      self.update({
        activeTab: tab.name
      });
    }

    // event bindings
    riot.on('start', self.onStart);
    riot.on('tab', self.onSwitchTab);
  </script>
</tab-box>
