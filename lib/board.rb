require_relative 'ship'
class Board

  attr_reader :board, :fire_log

  def initialize(ships = 0)
    @board = Array.new(10){ Array.new(10){"w"} }
    @fire_log = []
    @ships = []
  end
  
  def place(ship, x, y)
  	fail "Out of bounds!" if board[y-1] == nil || board[y-1][x.ord-65] == nil
    fail "Already ship there!" if board[y-1][x.ord-65] != "w"
    set_location(ship,x,y)
    ship.location.each { |l| @ships << l } 
  end

  def fire(x,y)
  	fail "Out of bounds!" if board[y-1] == nil || board[y-1][x.ord-65] == nil
  	a = board[y-1][x.ord-65] != "w" ? board[y-1][x.ord-65].hit : false 
    fire_log << [[x,y],a]
    a
  end
  def set_location(ship,x,y)
    i = 0 
    ship.size.times do 
      ship.direction == "vertical" ? board[y+i-1][x.ord - 65] = "s" : board[y-1][x.ord + i - 65] = "s"
      i += 1
    end
    ship.set_location(x,y)
  end
end