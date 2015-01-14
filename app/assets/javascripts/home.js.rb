Document.ready? do
  canvas = Canvas.new
  game = canvas.game = Game.new
  canvas.draw
  
  Window.on :keydown do |event|
    case event.key_code
    when 38 then game.increase_angle
    when 40 then game.decrease_angle
    when 82 then game = Game.new 
    when 32 then
      game.shoot
      canvas.animate
      return
    else return 
    end
    canvas.draw
  end
  
end