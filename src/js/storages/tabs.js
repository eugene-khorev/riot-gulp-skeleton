var riot = (function (riot) {
  // injection
  riot.tabStorage = new function () {
    var self = this;

    // init data
    self.tabs = data.tabs;

    // methods & event handlers
    self.getTabs = function (dataset) {
      return self.tabs[dataset];
    };

    // return public interface
    return {
      getTabs: self.getTabs
    };
  };

  return riot;
}(riot));
