class Numeric
  def degrees
    self * Math::PI / 180 
  end
  
  def round_to_closest multiple
    (self / multiple.to_f).round * multiple
  end
end