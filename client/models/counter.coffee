class @Counter
  constructor: ->
    @data = Counters.findOne(match_id: Session.get('match')._id)

  start: ->
    if @data.started == false
      Counters.update {_id: @data._id}, {$set: {started: true}}

      @interval = Meteor.setInterval (->
        counter.count_down()
      ), 1000

  count_down: ->
    Counters.update {_id: @data._id}, {$inc: {time: -1}}
    @data = Counters.findOne {_id: @data._id}
    if @data.time == 0
      Meteor.clearInterval @interval
      Counters.update {_id: @data._id}, {$set: {finished: true}}
