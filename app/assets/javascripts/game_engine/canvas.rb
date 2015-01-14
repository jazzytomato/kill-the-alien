class Canvas
    
  attr_reader :width, :height, :animation_length

  def initialize
    @canvas  = `document.getElementById('canvas')`
    @context = `#@canvas.getContext('2d')`
    @height  = `#@canvas.height`
    @width   = `#@canvas.width`
    @animation_frame = 0
    GameSettings.generate_board_width @width
  end
  
  def draw game
    clear
    draw_bullet game.impact*GameSettings.meter, game.alpha unless game.impact.nil? #game.bullet unless game.bullet.nil?
    @animation_frame = 0
    draw_alien game.alien.position*GameSettings.meter
    draw_player game.alpha
  end
  
  def clear
    draw_image `document.getElementById('background_img')`, 0, 0
  end
  
  private
  
  def draw_rect(x, y, w, h, color)
    `#@context.fillStyle = #{color}`
    `#@context.fillRect(#{x}, #{y}, #{w}, #{h})`
  end
  
  def draw_bullet impact , alpha
    @animation_frame += 10
    if @animation_frame <= 100
     `drawBezier(#@context,new Array({x:80, y:#{@height-70}},{x:#{impact/4}, y:#{@height-70-alpha*5}},{x:#{impact/1.2}, y:#{(@height-70-alpha*5)}},{x:#{(impact)}, y:#{@height}}),#{@animation_frame/100});`
     after_ms(30) { draw_bullet impact , alpha }
    end
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
  
  def after_ms(n, &block)
    `setTimeout(function() {`
      block.call
    `}, n);`
  end
end
