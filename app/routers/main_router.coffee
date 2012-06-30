class exports.MainRouter extends Backbone.Router
  routes :
    "home"              : "home"
    "working"           : "working"
    "resting/:seconds"  : "resting"
    "stats"             : "stats"
    "small_timer"       : "small_timer"

  home: ->
    app.views.home.render()
    app.collections.notes.fetch()
    app.collections.columns.fetch()

    app.collections.states.setCurrentStateName('home')


  working: ->
    app.views.working.render()
    app.views.working.startTimer(if app.development == true then 10 else 25 * 60)

    app.collections.states.setCurrentStateName('working')

  resting: (seconds) ->
    app.views.resting.render()
    app.views.resting.startTimer(if app.development == true then 10 else parseInt(seconds))

    app.collections.states.setCurrentStateName('resting/' + seconds)

  stats: ->
    app.collections.pomodoros.fetch()
    app.views.stats.render()
    
  small_timer: ->
     $("#modal").modal("show")
     app.routers.main.navigate('home', true)
