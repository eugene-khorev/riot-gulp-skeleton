riot.observable(riot);

var commentStorage = new CommentStorage();

riot.init();
riot.mount('*');

riot.route.parser(function (path) {
  var raw = path.split('?'),
    uri = raw[0].split('/'),
    qs = raw[1],
    params = {}

  if (qs) {
    qs.split('&').forEach(function (v) {
      var c = v.split('=')
      params[c[0]] = c[1]
    })
  }

  uri.push(params)

  return uri;
});

riot.route(function (event, data) {
  if (event) {
    riot.trigger(event, data);
  }
});

riot.route(location.hash.slice(1));
