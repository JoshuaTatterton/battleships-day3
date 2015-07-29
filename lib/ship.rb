
class Ship

  attr_accessor :location, :size, :direction

  def initialize(size, direction)
   # @position = position
    @location = Array.new(size)
    @size = size
    @direction = direction
    @hit = Array.new(size){false}
    # @sunk = false
  end

  def hit(i)
    location[i][1] = (true)
    @hit[i] = true
  end

  def hits 
    @hit
  end

  def sunk?
  	# @sunk = hit? ? true : false
    !@hit.include?(false)
  end
  def set_location(x,y)
    i = 0 
    size.times do 
      location[i] = direction == "vertical" ? [[x,y+i], false] : [[(x.ord + i).chr,y], false]
      i += 1
    end
  end

end
