Document.ready? do
  canvas = Canvas.new
  game = Game.new
  canvas.draw game
  
  Window.on :keydown do |event|
    case event.key_code
    when 38 then game.increase_angle
    when 40 then game.decrease_angle
    when 82 then game = Game.new 
    when 32 then
      if game.hit_test? game.shoot
        alert "win"
        game = Game.new
      else 
        game.turn 
      end
    else return 
    end
    canvas.draw game
  end
  
end