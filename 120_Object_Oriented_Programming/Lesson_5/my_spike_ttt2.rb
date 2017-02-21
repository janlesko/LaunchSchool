require 'pry'

class Board
  INITIAL_MARKER = " "
  HUMAN_MARKER = "X"
  COMPUTER_MARKER = "O"
  
  attr_reader :squares
  
  def initialize
    @squares = {}
    (1..9).each { |key| @squares[key] = Square.new(INITIAL_MARKER) } 
  end
  
  def get_square_at(key)
    @squares[key]
  end
  
  def empty_squares
    squares.keys.select { |key| squares[key].marker == INITIAL_MARKER }
  end
  
  def set_square(key, square)
    squares[key].marker = square
    # binding.pry
  end
end

class Square
  attr_accessor :marker
  
  def initialize(marker)
    @marker = marker
  end
  
  def to_s
    @marker
  end
end

class Player
  attr_accessor :name, :move
  
  def initialize(marker)
    set_name
  end
end

class Human < Player
  def set_name
    loop do
      puts "What is your name?"
      self.name = gets.chomp
      break unless name.empty?
      puts "Please enter some value"
    end
  end
  
  def choose_square(empty_squares)
    answer = ""
    loop do
      puts "Chose a square: #{empty_squares}"
      answer = gets.chomp.to_i
      break if empty_squares.include?(answer)
      puts "Not a valid choice"
    end
    self.move = answer 
  end
end

class Computer < Player
  def set_name
    self.name = ["Hal 9000", "Cortana", "Skynet", "Holly"].sample
  end
  
  def choose_square(empty_squares)
    self.move = empty_squares.sample
  end
end

# orchestration engine

class TTTGame
  attr_reader :board, :human, :computer
  
  def initialize
    @board = Board.new
    @human = Human.new("X")
    @computer = Computer.new("O")
  end
  
  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
  end
  
  def display_goodbye_message
    puts "Thanks for playing. Goodbye!"
  end
  
  def human_moves
    human.choose_square(board.empty_squares)
    board_update(human.move, Board::HUMAN_MARKER)
    # binding.pry
  end
  
  def computer_moves
    computer.choose_square(board.empty_squares)
    board_update(computer.move, Board::COMPUTER_MARKER)
  end
  
  def board_update(move, marker)
    board.set_square(move, marker)
  end
  
  def display_board
    puts ""
    puts "     |     |"
    puts "  #{board.get_square_at(1)}  |  #{board.get_square_at(2)}  |  #{board.get_square_at(3)}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{board.get_square_at(4)}  |  #{board.get_square_at(5)}  |  #{board.get_square_at(6)}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{board.get_square_at(7)}  |  #{board.get_square_at(8)}  |  #{board.get_square_at(9)}"
    puts "     |     |"
    puts ""
  end
  
  def play
    display_welcome_message
    loop do
      display_board
      human_moves
      # break if someone_won? || board_full?
      
      computer_moves
      # break if someone_won? || board_full?
    end
    display_result
    display_goodbye_message
  end
end

game = TTTGame.new
game.play