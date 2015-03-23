var riot = (function (riot) {
  riot.dispatcher = {};

  riot.dispatcher.parser = function (path) {
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
  };

  riot.dispatcher.handler = function (event, data) {
    if (event) {
      riot.trigger(event, data);
    }
  };

  riot.dispatcher.init = function () {
    riot.route.parser(riot.dispatcher.parser);
    riot.route(riot.dispatcher.handler);
  };

  riot.dispatcher.run = function () {
    riot.route(location.hash.slice(1));
  };

  return riot;
}(riot));
