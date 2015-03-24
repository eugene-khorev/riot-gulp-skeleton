<tab-box>
  <div class="pure-menu pure-menu-horizontal" id="menu">
    <a href="/" class="pure-menu-heading">MENU</a>
    <ul class="pure-menu-list custom-can-transform">
      <li each={ name, tab in tabs } class="{ 'pure-menu-item': true, 'pure-menu-selected': tab.active }">
        <a href="#tab?name={ name }" class="pure-menu-link">{ tab.title }</a>
      </li>
    </ul>
  </div>

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
        var tab = Object.keys(self.tabs).slice(0, 1)[0];
        riot.trigger('tab', {
          name: tab
        });
      }
    }

    // handle tab switching
    self.onSwitchTab = function (tab) {
      if (self.activeTab) {
        self.tabs[self.activeTab].active = false;
      }

      self.activeTab = tab.name;
      self.tabs[self.activeTab].active = true;

      self.update();
    }

    // event bindings
    riot.on('start', self.onStart);
    riot.on('tab', self.onSwitchTab);
  </script>
</tab-box>
