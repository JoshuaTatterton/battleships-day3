
class Ship

  attr_accessor :position, :size, :direction

  def initialize(size, direction)
   # @position = position
    @size = size
    @direction = direction
    @hit = false
    @sunk = false
  end

  def hit
    @hit = true
  end

  def hit? 
    @hit
  end

  def sunk?
  	@sunk = hit? ? true : false
  end

end
