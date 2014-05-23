Template.pingpong_start_button.events(
  'click button': ->
    window.counter = new Counter
    counter.start()
)

Template.pingpong_start_button.counter = ->
  Counters.findOne(match_id: Session.get('match')._id)
