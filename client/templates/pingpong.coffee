Template.pingpong_start.rendered = ->
  Meteor.subscribe 'matches', ->
    unless Session.get('match')
      count = Matches.find("player_2._id": null).count()

      if count > 0
        window.player = 'player_2'

        match_id = Matches.findOne("player_2._id": null)._id

        Matches.update {_id: match_id},
          $set: 
            "player_2._id": Meteor.userId()
      else
        window.player = 'player_1'

        match_id = Matches.insert
          player_1:
            _id: Meteor.userId()
            y: 0
          player_2:
            _id: null
            y: 0
          ball:
            x: 450
            y: 200
          counter:
            started: false
            finished: false
            time: 3
          started: false
          direcction: 1

      Session.set 'match', Matches.findOne({_id: match_id })
