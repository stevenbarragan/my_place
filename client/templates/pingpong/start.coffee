Template.pingpong_start.match = ->
   match = Session.get('match')
   if match
     !!Matches.findOne({_id: match._id}).player_2._id
   else
     false
