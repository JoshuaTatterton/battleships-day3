require_relative 'ship'
class Board

  attr_reader :board, :fire_log

  def initialize(ships = 0)
    @board = Array.new(10){ Array.new(10){"w"} }
    @fire_log = []
    @ships = []
  end
  
  def place(ship, x, y)
  	fail "Out of bounds!" if board[y-1] == nil || board[y-1][x.ord-65] == nil || (ship.direction == "vertical" ? (board[y-2+ship.size.to_i] == nil) : (board[y-1][x.ord-66+ship.size.to_i] == nil))
  	range = ship_range(ship,x,y)
    fail "Already ship there!" if range.include?("s")
    set_location(ship,x,y)
    @ships << ship 
  end

  def fire(x,y)
  	fail "Out of bounds!" if board[y-1] == nil || board[y-1][x.ord-65] == nil
  	a = board[y-1][x.ord-65] != "w" ? shot_finder(x,y) : false 
    fire_log << [[x,y],a]
    a
  end

  private

  def ship_range (ship,x,y)
  	l=[]
  	i=0
  	ship.size.times {ship.direction == "vertical" ? l<<board[y+i-1][x.ord - 65] : l<<board[y+i-1][x.ord - 65] ; i+1}
		l
  end

  def set_location(ship,x,y)
    i = 0 
    ship.size.times do 
      ship.direction == "vertical" ? board[y+i-1][x.ord - 65] = "s" : board[y-1][x.ord + i - 65] = "s"
      i += 1
    end
    ship.set_location(x,y)
  end

  def shot_finder (x,y)
  	i=false
  	@ships.each do |ship|
  		sl = ship.location
  		sl.each_index { |n| sl[n][0]==[x,y] ? i = n : false }
  		i != false ? ship.hit(i) : false
  	end
  end
end