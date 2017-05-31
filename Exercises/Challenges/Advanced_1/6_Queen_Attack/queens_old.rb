class Queens
  class Position < Struct.new(:x, :y); end
  
  attr_accessor :white_queen_position, :black_queen_position, :board

  def initialize(white: [0, 3], black: [7, 3])
    raise ArgumentError, "can't place pieces on the same spot" if white == black
    @white_queen_position = Position.new(*white)
    @black_queen_position = Position.new(*black)
    @board = Array.new(8){ Array.new(8, '_') }
    place_pieces_on_board
  end

  def attack?
    same_row? || same_column? || same_diagonal?
  end

  def to_s
    board.map { |row| row.join(' ') + "\n" }.join.chomp
  end
  
  private

  def place_pieces_on_board
    board[white_queen_position.x][white_queen_position.y] = "W"
    board[black_queen_position.x][black_queen_position.y] = "B"
  end

  def same_row?
    white_queen_position.x == black_queen_position.x
  end
  
  def same_column?
    white_queen_position.y == black_queen_position.y
  end

  def same_diagonal?
    (white_queen_position.x - black_queen_position.x).abs == 
    (white_queen_position.y - black_queen_position.y).abs
  end
end

queens = Queens.new(white: [2, 4], black: [2, 7])

puts queens

p queens.attack?