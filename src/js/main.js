var app = riot.observable();

riot.mount('*', app);

riot.route(function (chapter, index, action) {
  var event = chapter + '_' + action;
  app.trigger(event, index);
});

(function () {
  riot.route(location.hash.slice(1));
})();
