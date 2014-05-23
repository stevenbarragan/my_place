Template.pingpong_counter.counter = ->
  Counters.findOne(match_id: Session.get('match')._id)
