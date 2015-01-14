class Canvas
    
  attr_reader :width, :height, :animation_length
  attr_accessor :game

  def initialize
    @canvas  = `document.getElementById('canvas')`
    @context = `#@canvas.getContext('2d')`
    @height  = `#@canvas.height`
    @width   = `#@canvas.width`
    @animation_frame = 0
    GameSettings.generate_board_width @width
  end
  
  def draw
    clear
    draw_player @game.alpha
    draw_alien @game.alien.position*GameSettings.meter
  end
  
  def animate  
    @animation_frame += 5
    if @animation_frame <= 100
      draw_bezier @game.impact , @game.alpha
      after_ms(30) { animate }
    else
      @animation_frame = 0
      draw
      if @game.win
        alert "You killed the alien with a banana. Impressive !" 
        @game = Game.new
        draw
      end
    end
  end
  
  def clear
    draw_image `document.getElementById('background_img')`, 0,0
  end
  
  private
  
  def draw_bezier impact, alpha
    return if impact.nil?
    impact = impact*GameSettings.meter
   `drawBezier(document.getElementById('banana_img'),#@context,new Array({x:80, y:#{@height-70}},{x:#{impact/4}, y:#{@height-70-alpha*5}},{x:#{impact/1.2}, y:#{(@height-70-alpha*5)}},{x:#{(impact)}, y:#{@height}}),#{@animation_frame/100});`
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
