
class Ship

  attr_accessor :location, :size, :direction

  def initialize(size, direction)
   # @position = position
    @location = Array.new(size)
    @size = size
    @direction = direction
    @hit = Array.new(size) { false }
    # @sunk = false
  end

  def hit
    @hit = true
  end

  def hit? 
    @hit
  end

  def sunk?
  	# @sunk = hit? ? true : false
    @hit.include?(false)
  end
  def set_location(x,y)
    i = 0 
    size.times do 
      location[i] = direction == "vertical" ? [x,y+i] : [(x.ord + i).chr,y]
      i += 1
    end
  end

end
