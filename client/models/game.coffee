class @Game
  constructor : (@match)->
    @width = 950
    @heigt = 450

    @board = d3.select('#board svg')
    @ball = new Ball(@, @match)

    window.ball = @ball

    @player1 = new Player_one(@, 'player_1')
    @player2 = new Player_two(@, 'player_2')

  start: ->
    @ball.move()
    if window.player == 'player_1'
      @check_player_2()
    else
      @check_player_1()

  check_player_1: ->
    Deps.autorun ->
      model = Matches.findOne(Session.get('match')._id)
      window.game.player1.move(model.player_1.y)

  check_player_2: ->
    Deps.autorun ->
      model = Matches.findOne(Session.get('match')._id)
      window.game.player2.move( model.player_2.y )
