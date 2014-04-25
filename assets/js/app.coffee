c=
  log: (mixed)->
    console.log mixed if window.console && window.console.log

App= ()->
  @init()

App::actions= ()->

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
  )

  $('.content-wrapper').css('margin-top', $(window).height() + 'px')

  if window.location.hash.search('thanks') != -1
    $.magnificPopup.open(
      mainClass: 'volunteer-op-wrap'
      items:
        src: $('<div><h2>Thank you</h2><p>Thank you for getting in touch. We\'ll contact you as soon as possible</p></div>')
        type: 'inline'
    )

  @actions()
  this

window.app = new App()
