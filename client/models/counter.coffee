class @Counter
  constructor: ->
    @match = Session.get('match')

  start: ->
    if @match.counter.started == false
      Matches.update({_id: @match._id}, {$set: {'counter.started': true}})

      @interval = Meteor.setInterval (->
        counter.count_down()
      ), 1000

  count_down: ->
    Matches.update {_id: @match._id}, {$inc: {'counter.time': -1}}
    @update_match()
    if @match.counter.time == 0
      Meteor.clearInterval @interval
      Matches.update {_id: @match._id}, {$set: {'counter.finished': true}}

  update_match: ->
    @match = Matches.findOne({_id: @match._id})
