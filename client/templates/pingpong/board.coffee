Template.pingpong_board.rendered = ->
  match = Session.get('match')
  if Matches.findOne({_id: match._id}).player_2._id
    window.game = new Game match

    if window.player == 'player_1'
      d3.select('body').
        on 'keydown', ->
          switch d3.event.keyCode
            when 38 then game.player1.up()
            when 40 then game.player1.down()
    else
      d3.select('body').
        on 'keydown', ->
          switch d3.event.keyCode
            when 38 then game.player2.up()
            when 40 then game.player2.down()
