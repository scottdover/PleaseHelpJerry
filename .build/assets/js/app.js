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

  App.prototype.actions = function() {
    $('.posts li').unbind('hover').hover(function() {
      return $(this).find('a').addClass('active');
    }, function() {
      return $(this).find('a').removeClass('active');
    });
    $('.top-picker select').unbind('change').change(function() {
      var val;
      val = $(this).val();
      return $('.top-picker a[data-cat="' + val + '"]').click();
    });
    $('.posts li').unbind('click').click(function() {
      return $(this).find('a').click();
    });
    $('.scroll').unbind('click').click(function(e) {
      e.preventDefault();
      return $('body,html').animate({
        scrollTop: $(window).height()
      }, 'medium', 'swing');
    });
    $('.yt-embed').unbind('click').click(function(e) {
      var div;
      e.preventDefault();
      div = $(this).attr('data-rel');
      return $.magnificPopup.open({
        mainClass: 'video-wrap',
        items: {
          src: $('.' + div),
          type: 'inline'
        },
        callbacks: {
          open: function() {
            return window.location.hash = '#!/' + div;
          },
          close: function() {
            return window.location.hash = '#!/';
          }
        }
      });
    });
    $('.top-picker a').unbind('click').click(function(e) {
      var cat;
      e.preventDefault();
      cat = $(this).attr('data-cat');
      $('.top-picker a').removeClass('active');
      $(this).addClass('active');
      $('.posts').fadeOut('medium', function() {
        if (cat === 'all') {
          $('.posts li').show();
        } else {
          $('.posts li').hide();
          $('.posts li[data-cat="' + cat + '"]').show();
        }
        $('.posts').fadeIn('medium');
      });
    });
  };

  App.prototype.init = function() {
    c.log('PleaseHelpJerry is up and running');
    $('.modal').magnificPopup({
      type: 'ajax',
      mainClass: 'volunteer-op-wrap',
      callbacks: {
        open: function() {
          var hash;
          hash = this.currItem.src.split('/').pop().replace('.html', '');
          return window.location.hash = '#!/' + hash;
        },
        close: function() {
          return window.location.hash = '#!/';
        }
      }
    });
    if ($('.bottom-arrow').is(':visible')) {
      $('.content-wrapper').css('margin-top', $(window).height() + 'px');
      $('.page').swipe({
        swipe: function(e, dir, dist, duration, fingerCount) {
          if (dir === 'up') {
            return $('.bottom-arrow a').click();
          }
        }
      });
    }
    if (window.location.hash.search('thanks') !== -1) {
      $.magnificPopup.open({
        mainClass: 'volunteer-op-wrap',
        items: {
          src: $('<div><h2>Thank you</h2><p>Thank you for getting in touch. We\'ll contact you as soon as possible</p></div>'),
          type: 'inline'
        }
      });
    }
    $(window).bind('hashchange', function() {
      if (window.location.hash !== '#!/') {
        ga('send', 'pageview', location.pathname + location.search + location.hash);
      }
    });
    this.actions();
    return this;
  };

  window.app = new App();

}).call(this);