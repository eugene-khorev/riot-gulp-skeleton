riot.observable(riot);

var commentStorage = new CommentStorage(riot);

riot.init();
riot.mount('*');

riot.route(function () {
  riot.trigger('route', arguments);
});

riot.route(location.hash.slice(1));

