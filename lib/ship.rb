
class Ship

  attr_accessor :location, :size, :direction

  def initialize(size)
    ship_sizes = [2,3,4,5]
    fail "Not a valid ship size" if !ship_sizes.include?(size)
    @location = Array.new(size)
    @size = size
    @direction = "vertical"
    @hit = Array.new(size){false}
  end

  def hit(i)
    @hit[i] = true
  end

  def hits 
    @hit
  end

  def sunk?
    !@hit.include?(false)
  end

  def set_location(x,y)
    i = 0 
    size.times do 
      location[i] = direction == "vertical" ? [x,y+i] : [(x.ord + i).chr,y]
      i += 1
    end
  end

  def rotate
    @direction == "vertical" ? @direction= "horizontal" : @direction= "vertical"
  end
end
