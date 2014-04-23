c=
  log: (mixed)->
    console.log mixed if window.console && window.console.log

App= ()->
  @init()

App::init= ()->
  c.log 'PleaseHelpJerry is up and running'

window.app = new App()
