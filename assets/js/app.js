// Generated by CoffeeScript 1.7.1
(function() {
  var App, c;

  c = {
    log: function(mixed) {
      if (window.console && window.console.log) {
        return console.log(mixed);
      }
    }
  };

  App = function() {
    return this.init();
  };

  App.prototype.actions = function() {};

  App.prototype.init = function() {
    c.log('PleaseHelpJerry is up and running');
    $('.modal').magnificPopup({
      type: 'ajax',
      mainClass: 'volunteer-op-wrap'
    });
    this.actions();
    return this;
  };

  window.app = new App();

}).call(this);