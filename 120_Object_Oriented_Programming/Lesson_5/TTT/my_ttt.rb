class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], # rows
                   [1, 4, 7], [2, 5, 8], [3, 6, 9], # cols
                   [1, 5, 9], [3, 5, 7]]            # diagonals

  attr_reader :squares

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
  attr_accessor :score, :marker, :name

  def initialize
    @score = 0
  end
end

class Human < Player
  def set_name
    loop do
      puts "What is your name?"
      self.name = gets.chomp
      break unless name.empty? || name.match(/^ +$/)
      puts "Please enter a value."
    end
  end

  def set_marker
    loop do
      puts "Choose your marker (any single character)."
      self.marker = gets.chomp
      break unless marker.size != 1 || marker.match(/^ +$/)
      puts "Sorry. That is not a valid input."
    end
  end

  def moves(board)
    square = nil
    loop do
      puts "Chose a square: #{joinor(board.empty_squares)}"
      square = gets.chomp.to_i
      break if board.empty_squares.include?(square)
      puts "Not a valid choice"
    end
    board[square] = marker
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
end

class Computer < Player
  def set_name
    self.name = ["Cortana", "Hal9000", "Skynet", "Holly"].sample
  end

  def set_marker
    self.marker = ("A".."Z").to_a.sample
  end

  def moves(board, human_marker)
    square = attack_move(board, marker)
    square = defense_move(board, human_marker) if !square
    square = take_middle(board) if !square
    square = board.empty_squares.sample if !square
    board[square] = marker
  end

  def find_at_risk_square(line, board, marker)
    if board.squares.values_at(*line).map(&:marker).count(marker) == 2
      board.squares.select do |k, v|
        line.include?(k) && v.marker == Square::INITIAL_MARKER
      end.keys.first
    end
  end

  def attack_move(board, computer_marker)
    square = nil
    Board::WINNING_LINES.each do |line|
      square = find_at_risk_square(line, board, computer_marker)
      break if square
    end
    square
  end

  def defense_move(board, human_marker)
    square = nil
    Board::WINNING_LINES.each do |line|
      square = find_at_risk_square(line, board, human_marker)
      break if square
    end
    square
  end

  def take_middle(board)
    5 if board.empty_squares.include?(5)
  end
end

class TTTGame
  FIRST_TO_MOVE = :choose
  WIN_SCORE = 5

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Human.new
    @computer = Computer.new
  end

  def play
    clear
    display_welcome_message
    players_choose_names
    players_choose_markers
    choose_who_moves_first
    loop do
      start_match
      break unless play_again?
      game_reset
    end
    display_goodbye_message
  end

  private

  def start_match
    loop do
      players_move
      calculate_score
      display_result
      break if human.score == WIN_SCORE || computer.score == WIN_SCORE
      enter_to_continue
      match_reset
    end
  end

  def players_move
    loop do
      display_board
      current_player_moves
      break if someone_won? || board_full?
      clear
    end
  end

  def players_choose_names
    human.set_name
    computer.set_name
  end

  def players_choose_markers
    human.set_marker
    computer.set_marker
  end

  def choose_who_moves_first
    case FIRST_TO_MOVE
    when :human then @first_to_move = human.marker
    when :computer then @first_to_move = computer.marker
    when :choose then @first_to_move = user_move_choice
    end
    @current_marker = @first_to_move
  end

  def user_move_choice
    answer = nil
    loop do
      puts "Who should go first? (1 or 2)"
      puts "1) #{human.name}"
      puts "2) #{computer.name}"
      answer = gets.chomp
      break if %w(1 2).include?(answer)
      puts "Not a valid choice."
    end
    answer == "1" ? human.marker : computer.marker
  end

  def enter_to_continue
    puts "Press enter to continue."
    gets
  end

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
    @current_marker == human.marker
  end

  def current_player_moves
    if human_turn?
      human.moves(board)
      @current_marker = computer.marker
    else
      computer.moves(board, human.marker)
      @current_marker = human.marker
    end
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

  def match_reset
    board.reset
    @current_marker = @first_to_move
    clear
  end

  def game_reset
    match_reset
    human.score = 0
    computer.score = 0
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
