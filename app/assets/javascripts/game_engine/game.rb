class Game
    
  attr_accessor :alien, :alpha, :impact, :win
  
  def initialize 
    @alien = Alien.new
    @alpha = 30
    @win = false
  end
  
  def alien_position
    @alien.position
  end
  
  def shoot
    @impact = GameSettings.board_margin + (get_impact(@alpha) / max_range * GameSettings.board_width).round
    @win = hit_test? @impact
    @alien.turn unless @win 
  end
  
  def hit_test? impact
    @alien.position <= (impact + (GameSettings.impact_radius/2)) && @alien.position >= (impact - (GameSettings.impact_radius/2))
  end
  
  def increase_angle
    return if @alpha == 90
    @impact = nil
    @alpha += 1
  end
  
  def decrease_angle
    return if @alpha == 0
    @impact = nil
    @alpha -= 1
  end
  
  private
  
  def max_range
    get_impact(45)
  end
  
  def get_impact alpha
     (2*Math.cos(alpha.degrees)*Math.sin(alpha.degrees)*GameSettings.velocity**2) / GameSettings.gravity
  end

end