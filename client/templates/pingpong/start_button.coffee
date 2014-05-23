Template.pingpong_start_button.events(
  'click button': ->
    window.counter = new Counter
    counter.start()
)

Template.pingpong_start_button.counter = ->
  Matches.findOne(_id: Session.get('match')._id).counter
