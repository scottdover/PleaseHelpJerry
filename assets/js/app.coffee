c=
  log: (mixed)->
    console.log mixed if window.console && window.console.log

App= ()->
  @init()

App::actions= ()->
  return

App::init= ()->
  c.log 'PleaseHelpJerry is up and running'

  # Bind out popups
  $('.modal').magnificPopup(
    type: 'ajax'
    mainClass: 'volunteer-op-wrap'
  )

  @actions()
  this

window.app = new App()
