var riot = (function (riot) {
  // injection
  riot.dispatcher = {};

  // uri parser
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

  // uri handler
  riot.dispatcher.handler = function (event, data) {
    if (event) {
      riot.trigger(event, data);
    }
  };

  // riot router initialization
  riot.dispatcher.init = function () {
    riot.route.parser(riot.dispatcher.parser);
    riot.route(riot.dispatcher.handler);
  };

  // dispatch current uri
  riot.dispatcher.run = function () {
    riot.route(location.hash.slice(1));
  };

  return riot;
}(riot));
