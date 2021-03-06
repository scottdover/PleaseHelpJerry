c=
  log: (mixed)->
    console.log mixed if window.console && window.console.log

App= ()->
  @init()

App::actions= ()->

  $('.posts li')
    .unbind('hover')
    .hover(
      ()->
        $(this).find('a').addClass('active')
      ()->
        $(this).find('a').removeClass('active')
    )

  $('.top-picker select')
    .unbind('change')
    .change ()->
      val = $(this).val()
      $('.top-picker a[data-cat="'+val+'"]').click()

  $('.posts li')
    .unbind('click')
    .click ()->
      $(this).find('a').click()

  $('.scroll')
    .unbind('click')
    .click (e)->
      e.preventDefault();
      $('body,html').animate({scrollTop: $(window).height()}, 'medium', 'swing')

  $('.yt-embed')
    .unbind('click')
    .click (e)->
      e.preventDefault()
      div = $(this).attr('data-rel')
      $.magnificPopup.open(
        mainClass: 'video-wrap'
        items:
          src: $('.' + div)
          type: 'inline'
        callbacks:
          open: ()->
            window.location.hash = '#!/' + div
          close: ()->
            window.location.hash = '#!/'
      )

  $('.top-picker a')
    .unbind('click')
    .click (e)->
      e.preventDefault()
      cat = $(this).attr('data-cat')
      $('.top-picker a').removeClass 'active'
      $(this).addClass 'active'
      $('.posts').fadeOut 'medium', ()->
        if cat == 'all'
          $('.posts li').show()
        else
          $('.posts li').hide()
          $('.posts li[data-cat="'+cat+'"]').show()
        $('.posts').fadeIn 'medium'
        return
      return

  return

App::init= ()->
  c.log 'PleaseHelpJerry is up and running'

  # Bind out popups
  $('.modal').magnificPopup(
    type: 'ajax'
    mainClass: 'volunteer-op-wrap'
    callbacks:
      open: ()->
        hash = this.currItem.src.split('/').pop().replace('.html','')
        window.location.hash = '#!/' + hash
      close: ()->
        window.location.hash = '#!/'
  )

  if $('.bottom-arrow').is(':visible')
    $('.content-wrapper').css('margin-top', $(window).height() + 'px')
    $('.page').swipe(
      swipe: (e, dir, dist, duration, fingerCount)->
        if dir == 'up'
          $('.bottom-arrow a').click()
    )

  if window.location.hash.search('thanks') != -1
    $.magnificPopup.open(
      mainClass: 'volunteer-op-wrap'
      items:
        src: $('<div><h2>Thank you</h2><p>Thank you for getting in touch. We\'ll contact you as soon as possible</p></div>')
        type: 'inline'
    )

  $(window).bind 'hashchange', ()->
    if window.location.hash != '#!/'
      ga('send', 'pageview', location.pathname + location.search  + location.hash)
      return



  @actions()
  this

window.app = new App()
