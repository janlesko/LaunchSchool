class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  def initialize
    @squares = {}
    reset
  end

# rubocop:disable Metrics/AbcSize
  def draw
    puts '     |     |'
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts '     |     |'
    puts '-----+-----+-----'
    puts '     |     |'
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts '     |     |'
    puts '-----+-----+-----'
    puts '     |     |'
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts '     |     |'
  end
# rubocop:enable Metrics/AbcSize

  def []=(num, marker)
    @squares[num].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  # returns winning marker or nil
  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      return squares.first.marker if three_identical_markers?(squares)
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  # Bonus feature method - Computer AI defense and offense
  def find_at_risk_squares(marker)
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if one_unmarked_and_two_identical?(squares, marker)
        return @squares.select do |k, v|
          line.include?(k) && v.unmarked?
        end.keys.first
      end
    end
    nil
  end

  # Bonus feature method - Computer AI defense and offense select center square
  def valuable_squares
    @squares[5].unmarked? ? 5 : nil
  end

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).map(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end

  # Bonus feature method - Computer AI defense and offense
  def one_unmarked_and_two_identical?(squares, marker)
    unmarked = squares.select(&:unmarked?)
    return false unless unmarked.size == 1

    markers = squares.select(&:marked?).map(&:marker)
    markers.count(marker) == 2
  end
end

class Square
  INITIAL_MARKER = ' '

  attr_accessor :marker

  def initialize(marker = INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def marked?
    marker != INITIAL_MARKER
  end

  def unmarked?
    marker == INITIAL_MARKER
  end
end

class Player
  attr_accessor :name, :marker
  attr_reader :points

  def initialize(marker = '')
    @marker = marker
    @points = 0
  end

  def to_s
    "#{name}(#{marker})"
  end

  def add_point
    @points += 1
  end

  def reset_points
    @points = 0
  end
end

class TTTGame
  COMPUTER_MARKER = 'O'
  FIRST_TO_MOVE = 'choose' # options are 'player', 'computer' or 'choose'
  POINTS_TO_WIN = 5        # points needed to win a 'match' within the game

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new
    @computer = Player.new(COMPUTER_MARKER)
    @current_marker = nil
  end

  def greet
    display_welcome_message
    sleep 1
    clear
  end

  def play
    greet
    setup_game_settings
    clear

    loop do
      display_board

      loop do
        current_player_moves
        break if board.someone_won? || board.full?
        clear_screen_and_display_board
      end

      award_point_to_winner if board.someone_won?
      display_result_and_scoreboard

      if match_complete?
        display_match_winner
        reset_points
      end

      break unless play_again?
      reset
      display_play_again_message
    end

    display_goodbye_message
  end

  private

  def display_welcome_message
    puts 'Welcome to Tic Tac Toe!'
  end

  def display_goodbye_message
    puts 'Thank you for playing. Goodbye.'
  end

  def display_board
    puts "#{human} vs. #{computer}"
    puts ''
    board.draw
    puts ''
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def display_result
    clear_screen_and_display_board

    case board.winning_marker
    when human.marker
      puts "#{human.name} wins!"
    when computer.marker
      puts "#{computer.name} wins!"
    else
      puts "It's a tie!"
    end
  end

  def human_turn?
    @current_marker == human.marker
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = computer.marker
    else
      computer_moves
      @current_marker = human.marker
    end
  end

  def human_moves
    puts "Choose a square (#{joinor(board.unmarked_keys)}): "
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts 'Invalid choice. Try again.'
    end
    board[square] = human.marker
  end

  def computer_moves
    move = board.find_at_risk_squares(computer.marker) # attack first
    move ||= board.find_at_risk_squares(human.marker)  # otherwise defense
    move ||= board.valuable_squares                    # otherwise center
    move ||= board.unmarked_keys.sample                # otherwise random move
    board[move] = computer.marker
  end

  def play_again?
    answer = nil
    loop do
      puts 'Would you like to play again? (y/n)'
      answer = gets.chomp.downcase
      break if %w(y n).include?(answer)
      puts 'Invalid choice'
    end

    answer == 'y'
  end

  def clear
    system 'clear'
  end

  def reset
    board.reset
    @current_marker = FIRST_TO_MOVE
    clear
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ''
  end

  # *****************************
  # TTTGame bonus feature methods
  # *****************************

  # 1. Improved join

  def joinor(arr, seperator = ', ', conjuction = 'or')
    arr[-1] = "#{conjuction} #{arr.last}" if arr.size > 1
    arr.size == 2 ? arr.join(' ') : arr.join(seperator)
  end

  # 2. Keep score

  def award_point_to_winner
    case board.winning_marker
    when human.marker then human.add_point
    when computer.marker then computer.add_point
    end
  end

  def display_scoreboard
    puts '------SCORE------'
    puts "#{human}: #{human.points}"
    puts "#{computer}: #{computer.points}"
    puts '-----------------'
  end

  def display_result_and_scoreboard
    display_result
    display_scoreboard
  end

  def match_complete?
    human.points == POINTS_TO_WIN || computer.points == POINTS_TO_WIN
  end

  def display_match_winner
    match_winner = human.points == POINTS_TO_WIN ? human.name : computer.name
    puts "#{match_winner} won #{POINTS_TO_WIN} games and wins the match!"
  end

  def reset_points
    human.reset_points
    computer.reset_points
  end

  # 3. Computer AI: Defense
  # 4. Computer AI: Offense
  # New methods are in class Board...
    # find_at_risk_squares(marker)
    # valuable_squares
    # one_unmarked_and_two_identical?(squares, marker)

  # ...and changes in TTTGame #computer_moves

  # 5. Computer turn refinements

  def first_to_move
    case FIRST_TO_MOVE
    when 'player' then human.marker
    when 'computer' then computer.marker
    when 'choose' then choose_starting_player
    else
      human.marker
    end
  end

  def choose_starting_player
    choice = nil
    loop do
      puts "Who moves first? Enter '1' or '2'."
      puts "1. #{human.name}"
      puts "2. #{computer.name}"
      choice = gets.chomp
      break if %w(1 2).include?(choice)
      puts 'Invalid choice.'
    end
    @current_marker = choice == '1' ? human.marker : computer.marker
  end

  # 2. Allow the player to pick any marker.
  # 3. Set a name for the player and computer.

  def setup_game_settings
    puts 'Please enter your name:'
    human.name = choose_a_name

    choose_human_marker

    puts "Please enter computer's name:"
    computer.name = choose_a_name

    choose_starting_player
  end

  def choose_a_name
    name = nil
    loop do
      name = gets.chomp
      break if name.size >= 1
      puts 'You must enter a name.'
    end
    name
  end

  def choose_human_marker
    marker = nil
    puts "#{human.name}, please choose your marker:"
    loop do
      marker = gets.chomp
      break if marker.size == 1 && marker != COMPUTER_MARKER
      puts "Your marker can be any one character except '#{COMPUTER_MARKER}'."
    end
    human.marker = marker
  end
end

game = TTTGame.new
game.play