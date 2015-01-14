Document.ready? do
  canvas = Canvas.new
  game = Game.new
  canvas.draw game
  
  Window.on :keydown do |event|
    game.increase_angle if event.key_code == 38 # up
    game.decrease_angle if event.key_code == 40 # down
    game = Game.new if event.key_code == 82 # r 
    
    if event.key_code == 32 # space
      impact = game.shoot
      if game.hit_test? impact
        alert "win"
        game = Game.new
      else
        game.turn
      end
    end
    canvas.draw game
  end
  
end