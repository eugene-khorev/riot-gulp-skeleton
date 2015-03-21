var RiotApp = function (initTags) {
  var app = riot.observable();

  initTags(app);

  riot.mount('*');

  riot.route(function (chapter, index, action) {
    var event = chapter + '_' + action;
    app.trigger(event, index);
  });

  riot.route(location.hash.slice(1));
}

var RiotStorage = function (storage) {
  var self = this;
  self.app = null;

  return {
    init: function (app) {
      if (self.app === null) {
        self.app = app;
        storage.trigger = this.trigger;

        for (event in storage.events) {
          if ('function' === typeof storage.events[event]) {
            self.app.on(event, storage.events[event].bind(storage));
          }
        }
      }

      return this;
    },

    events: function (actions) {
      for (event in actions) {
        if ('function' === typeof actions[event]) {
          self.app.on(event, actions[event].bind(this));
        }
      }
      return this;
    },

    trigger: function (data) {
      for (event in data) {
        self.app.trigger(event, data[event]);
      }
    },

    data: function () {
      return storage.data();
    }
  }
}
