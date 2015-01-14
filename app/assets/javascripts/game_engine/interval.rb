class Interval
  def initialize(time=GameSettings.animation_ms, &block)
    @interval = `setInterval(function(){#{block.call}}, time)`
  end
 
  def stop
    `clearInterval(#@interval)`
  end
end