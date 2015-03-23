riot.init(function () {
  riot.mount('*');

  riot.dispatcher.init();
  riot.dispatcher.run();

  riot.trigger('start');
});
