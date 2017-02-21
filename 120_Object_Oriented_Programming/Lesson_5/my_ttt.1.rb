require 'pry'

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], # rows
                   [1, 4, 7], [2, 5, 8], [3, 6, 9], # cols
                   [1, 5, 9], [3, 5, 7]]            # diagonals

  def initialize
    @squares = {}
    reset
  end

  # rubocop:disable Metrics/AbcSize
  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
  end
  # rubocop:enable Metrics/AbcSize

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  def empty_squares
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      return squares.first.marker if three_identical_markers?(squares)
    end
    nil
  end

  def []=(square, player_marker)
    @squares[square].marker = player_marker
  end

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).map(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end
end

class Square
  INITIAL_MARKER = " "

  attr_accessor :marker

  def initialize(marker = INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end
end

class Player
  attr_reader :marker
  attr_accessor :score

  def initialize(marker)
    @marker = marker
    @score = 0
  end
end

class TTTGame
  HUMAN_MARKER = "X"
  COMPUTER_MARKER = "O"
  FIRST_TO_MOVE = HUMAN_MARKER

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @current_marker = FIRST_TO_MOVE
  end

  def play
    clear
    display_welcome_message

    loop do
      display_board

      loop do
        current_player_moves
        break if someone_won? || board_full?
        clear_screen_and_display_board
      end
      
      calculate_score
      display_result
      break unless play_again?
      reset
    end

    display_goodbye_message
  end

  private

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
  end

  def display_board
    puts "You're a #{human.marker}. Computer is a #{computer.marker}."
    puts ""
    puts "| Human score: #{human.score} | | Computer score: #{computer.score} |"
    puts ""
    board.draw
    puts ""
  end

  def human_turn?
    @current_marker == HUMAN_MARKER
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = COMPUTER_MARKER
    else
      computer_moves
      @current_marker = HUMAN_MARKER
    end
  end

  def human_moves
    square = nil
    loop do
      puts "Chose a square: #{joinor(board.empty_squares)}"
      square = gets.chomp.to_i
      break if board.empty_squares.include?(square)
      puts "Not a valid choice"
    end
    board[square] = human.marker
  end

  def joinor(ary, deliminator=", ", word="or")
    case ary.size
    when 0 then ""
    when 1 then ary.first
    when 2 then ary.join(" #{word} ")
    else
      ary[-1] = "#{word} #{ary.last}"
      ary.join(deliminator)
    end
  end

  def computer_moves
    board[board.empty_squares.sample] = computer.marker
  end

  def board_full?
    board.empty_squares.empty?
  end

  def someone_won?
    !!board.winning_marker
  end

  def calculate_score
    human.score += 1 if board.winning_marker == human.marker
    computer.score += 1 if board.winning_marker == computer.marker
  end

  def display_result
    clear_screen_and_display_board
    case board.winning_marker
    when human.marker    then puts "Human won!"
    when computer.marker then puts "Computer won!"
    else                      puts "It's a tie"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y yes n no).include?(answer)
      puts "Sorry, must be y or n"
    end
    %w(y yes).include?(answer)
  end

  def reset
    board.reset
    @current_marker = FIRST_TO_MOVE
    clear
  end

  def clear
    system("clear") || system("cls")
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing. Goodbye!"
  end
end

game = TTTGame.new
game.play
