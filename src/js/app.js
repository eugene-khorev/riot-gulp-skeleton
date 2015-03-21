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
  storage.app = null;

  return {
    load: function (app) {
      if (storage.app === null) {
        storage.app = app;

        for (event in storage.events) {
          if ('function' === typeof storage.events[event]) {
            storage.app.on(event, storage.events[event].bind(storage));
          }
        }
      }

      return storage.load();
    }
  }
}
