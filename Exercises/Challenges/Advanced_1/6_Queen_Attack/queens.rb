class Queens
  attr_accessor :white, :black, :board

  def initialize(white: [0, 3], black: [7, 3])
    raise ArgumentError, "can't place pieces on the same spot" if white == black
    @white, @black = white, black
    @board = Array.new(8) { Array.new(8, '_') }
    place_pieces_on_board
  end

  def attack?
    same_row? || same_column? || same_diagonal?
  end

  def to_s
    board.map { |row| row.join(' ') }.join("\n")
  end

  private

  def place_pieces_on_board
    board[white[0]][white[1]] = 'W'
    board[black[0]][black[1]] = 'B'
  end

  def same_row?
    white[0] == black[0]
  end

  def same_column?
    white[1] == black[1]
  end

  def same_diagonal?
    (white[0] - black[0]).abs == (white[1] - black[1]).abs
  end
end
