require_relative 'ship'
class Board

  attr_reader :board

  def initialize(ships = 0)
    @board = Array.new(10){ Array.new(10){"w"} }
  end
  
  def place(ship, x, y)
  	fail "Out of bounds!" if board[y-1] == nil || board[y-1][x.ord-65] == nil
    fail "Already ship there!" if board[y-1][x.ord-65] != "w"
    board[y-1][x.ord-65] = ship
  end

end