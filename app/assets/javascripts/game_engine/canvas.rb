class Canvas
    
  attr_reader :width, :height, :animation_length

  def initialize
    @canvas  = `document.getElementById('canvas')`
    @context = `#@canvas.getContext('2d')`
    @height  = `#@canvas.height`
    @width   = `#@canvas.width`
    @animation_length = 10
    GameSettings.generate_board_width @width
  end
  
  def draw game
    clear
    draw_bullet game.impact*GameSettings.meter, game.alpha unless game.impact.nil? #game.bullet unless game.bullet.nil?
    draw_alien game.alien.position*GameSettings.meter
    draw_player game.alpha
  end
  
  def animate
    @animation_length -= 1
    if @animation_length > 0
      puts "hey"
      after_ms(500) { animate }
    end
  end

  private
  
  def clear
    draw_image `document.getElementById('background_img')`, 0, 0
  end
  
  def pixel(x, y)
    draw_rect(x, y, 10, 10, 'red')
  end

  def draw_rect(x, y, w, h, color)
    `#@context.fillStyle = #{color}`
    `#@context.fillRect(#{x}, #{y}, #{w}, #{h})`
  end
  
  def draw_bullet impact , alpha
      puts 'drawing bullet'
      `#@context.beginPath();`
      `#@context.moveTo(80, #{@height-70});`
      `#@context.bezierCurveTo(#{impact/4}, #{@height-70-alpha*5}, #{impact/1.2}, #{(@height-70-alpha*5)}, #{(impact)}, #{@height});`
      `#@context.lineWidth = 2;`
      `#@context.stroke();`
     #pixel(bullet.x,bullet.y)
  end
  
  def draw_alien x
    draw_image `document.getElementById('alien_img')`, x-(Element.find('#alien_img').width/2), @height-Element.find('#alien_img').height
  end
  
  def draw_player alpha
    draw_image `document.getElementById('player_img')`, 0, @height-Element.find('#player_img').height
    rotate_image `document.getElementById('gun_img')`, 50 , @height-Element.find('#gun_img').height-50, Element.find('#gun_img').width, Element.find('#gun_img').height, alpha 
  end
  
  def draw_image img, x, y
    `#@context.drawImage(#{img},#{x},#{y})`
  end
  
  def rotate_image img, x, y, width, height, alpha
    Element.find('#angle').html "angle : "+ alpha.to_s
    alpha = 360 - alpha
    `#@context.translate(#{x + width / 2},#{y + height / 2});`
    `#@context.rotate(#{alpha} * Math.PI / 180);`
    `#@context.drawImage(#{img},#{width / 2 * -1},#{height / 2 * -1},#{width},#{height});`
    `#@context.rotate((Math.PI/180) * #{alpha} * -1);`
    `#@context.translate(#{(x + width / 2) * -1},#{(y + height / 2) * -1});`
  end
end
