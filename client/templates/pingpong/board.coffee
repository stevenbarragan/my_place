Template.pingpong_board.rendered = ->
  window.game = new Game Session.get('match')

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

  Meteor.setTimeout (->
    game.start()
  ), 1000

Template.pingpong_board.ball = ->
  Matches.findOne(_id: Session.get('match')._id).ball
