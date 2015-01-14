{"filter":false,"title":"interval.rb","tooltip":"/app/assets/javascripts/game_engine/interval.rb","undoManager":{"mark":13,"position":13,"stack":[[{"group":"doc","deltas":[{"start":{"row":0,"column":0},"end":{"row":9,"column":3},"action":"insert","lines":["class Interval","  # Note that time is in ms.","  def initialize(time=0, &block)","    @interval = `setInterval(function(){#{block.call}}, time)`","  end"," ","  def stop","    `clearInterval(#@interval)`","  end","end"]}]}],[{"group":"doc","deltas":[{"start":{"row":2,"column":22},"end":{"row":2,"column":23},"action":"remove","lines":["0"]},{"start":{"row":2,"column":22},"end":{"row":2,"column":23},"action":"insert","lines":["G"]}]}],[{"group":"doc","deltas":[{"start":{"row":2,"column":23},"end":{"row":2,"column":24},"action":"insert","lines":["a"]}]}],[{"group":"doc","deltas":[{"start":{"row":2,"column":24},"end":{"row":2,"column":25},"action":"insert","lines":["m"]}]}],[{"group":"doc","deltas":[{"start":{"row":2,"column":25},"end":{"row":2,"column":26},"action":"insert","lines":["e"]}]}],[{"group":"doc","deltas":[{"start":{"row":2,"column":22},"end":{"row":2,"column":26},"action":"remove","lines":["Game"]},{"start":{"row":2,"column":22},"end":{"row":3,"column":2},"action":"insert","lines":["GameSettings","  "]}]}],[{"group":"doc","deltas":[{"start":{"row":3,"column":1},"end":{"row":3,"column":2},"action":"remove","lines":[" "]}]}],[{"group":"doc","deltas":[{"start":{"row":3,"column":0},"end":{"row":3,"column":1},"action":"remove","lines":[" "]}]}],[{"group":"doc","deltas":[{"start":{"row":2,"column":34},"end":{"row":3,"column":0},"action":"remove","lines":["",""]}]}],[{"group":"doc","deltas":[{"start":{"row":2,"column":34},"end":{"row":2,"column":35},"action":"insert","lines":["."]}]}],[{"group":"doc","deltas":[{"start":{"row":2,"column":35},"end":{"row":2,"column":36},"action":"insert","lines":["a"]}]}],[{"group":"doc","deltas":[{"start":{"row":2,"column":36},"end":{"row":2,"column":37},"action":"insert","lines":["n"]}]}],[{"group":"doc","deltas":[{"start":{"row":2,"column":35},"end":{"row":2,"column":37},"action":"remove","lines":["an"]},{"start":{"row":2,"column":35},"end":{"row":2,"column":47},"action":"insert","lines":["animation_ms"]}]}],[{"group":"doc","deltas":[{"start":{"row":0,"column":14},"end":{"row":1,"column":28},"action":"remove","lines":["","  # Note that time is in ms."]}]}]]},"ace":{"folds":[],"scrolltop":0,"scrollleft":0,"selection":{"start":{"row":1,"column":22},"end":{"row":1,"column":42},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":{"row":30,"mode":"ace/mode/ruby"}},"timestamp":1421181787104,"hash":"3e14656636e3e3892ab7d8179c2536581d41b49c"}