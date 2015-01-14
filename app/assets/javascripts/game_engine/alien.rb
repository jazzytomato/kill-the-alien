class Alien
    
  attr_accessor :position
  
  def initialize
    initialize_position
  end
  
  def turn
      move
  end
  
  private
  
  def move
      step = random_step
      step *= -1 unless valid_position? @position + step 
      @position += step
      log
  end
  
  def random_step
    [GameSettings.alien_step*-1,GameSettings.alien_step].sample
  end
  
  def valid_position? position
    position < GameSettings.board_width && position > GameSettings.board_margin
  end
  
  def initialize_position
     @position = GameSettings.board_margin + rand(GameSettings.board_width)
     log
  end
  
  def log 
      puts 'alien position : ' + @position.to_s
  end

end