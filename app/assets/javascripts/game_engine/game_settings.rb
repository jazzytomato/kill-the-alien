class GameSettings
  @@meter = 5 # number of pixels that represent one meter
  @@alien_step = 5 # in meter
  @@gravity = 9.81
  @@velocity = 10
  @@impact_radius = 10 # in meter
  @@board_margin = 200 / @@meter # left margin so the board doesn't include the player
  @@board_width
  
  def self.meter
    @@meter
  end
  
  def self.alien_step
    @@alien_step
  end
  
  def self.gravity
    @@gravity
  end
  
  def self.velocity
    @@velocity
  end
  
  def self.impact_radius
    @@impact_radius
  end
  
  def self.board_margin
    @@board_margin
  end
  
  def self.generate_board_width canvas_width
    @@board_width = (canvas_width-@@board_margin*@@meter)/@@meter
  end
  
  def self.board_width
    return @@board_width
  end
end