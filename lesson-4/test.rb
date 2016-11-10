GAME_WIDTH            = 51
SEPARATOR             = ("-" * GAME_WIDTH)
MARKER_USER           = 'X'.freeze
MARKER_COMPUTER       = 'O'.freeze
MARKER_EMPTY          = ' '.freeze
GRID_LINE_FULL        = "-----+-----+-----".freeze.center(GAME_WIDTH)
GRID_LINE_EMPTY       = "     |     |     ".freeze.center(GAME_WIDTH)
GRID_CROSS_BARS       = GRID_LINE_EMPTY + "\n" +
                        GRID_LINE_FULL + "\n" +
                        GRID_LINE_EMPTY
WINNING_LINES         = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                        [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                        [[1, 5, 9], [3, 5, 7]]              # diagonals
USER                  = "You".freeze
COMPUTER              = "Computer".freeze
NONE                  = "None".freeze
WHO_GOES_FIRST        = NONE
WINNER_USER           = "#{USER} win!".freeze
WINNER_COMPUTER       = "#{COMPUTER} wins!".freeze
WINNER_NONE           = "It's a tie!".freeze
SCORE_LIMIT           = 5
ALLOWED_RESPONSES     = ['Y', 'YES', 'N', 'NO', 'R', 'RANDOM'].freeze
CENTER_SPACE          = 5

def prompt(msg)
  puts "=> " + msg
end

def clear_screen
  system('clear') || system('cls')
end

def display_score_banner(user_score, comp_score)
  user_score  = "#{USER} : #{user_score}"
  comp_score  = "#{COMPUTER} : #{comp_score}"
  limit_msg   = "First to #{SCORE_LIMIT} wins!"
  zone_width  = (GAME_WIDTH / 3)
  puts SEPARATOR
  puts user_score.ljust(zone_width) +
       limit_msg.center(zone_width) +
       comp_score.rjust(zone_width)
  puts SEPARATOR
end

# rubocop:disable Metrics/AbcSize
def display_grid(brd)
  puts GRID_LINE_EMPTY
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  ".center(GAME_WIDTH)
  puts GRID_CROSS_BARS
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  ".center(GAME_WIDTH)
  puts GRID_CROSS_BARS
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  ".center(GAME_WIDTH)
  puts GRID_LINE_EMPTY
  puts
end
# rubocop:enable Metrics/AbcSize

def refresh_display(brd, user_score, comp_score)
  clear_screen
  display_score_banner(user_score, comp_score)
  display_grid(brd)
end

def initialze_board
  new_board = {}
  (1..9).each { |n| new_board[n] = MARKER_EMPTY }
  new_board
end

def empty_squares(board)
  board.keys.select { |k| board[k] == MARKER_EMPTY }
end

def joinor(arr, delim=',', word_before_last='or')
  arr[-1] = "#{word_before_last} #{arr.last}" if arr.size > 1
  arr.size == 2 ? arr.join(' ') : arr.join("#{delim} ")
end

def alternate_player(current_player)
  current_player == USER ? COMPUTER : USER
end

def place_piece!(board, current_player)
  if current_player == USER
    user_places_piece!(board)
  else
    computer_places_piece!(board)
  end
end

def user_places_piece!(board)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(board))})"
    square = gets.chomp.to_i
    break if empty_squares(board).include?(square)
    prompt "Sorry, that's not a valid choice"
  end
  board[square] = MARKER_USER
end

def computer_places_piece!(board)
  square = find_square_to_win(board)
  square = find_square_to_block(board) if !square
  square = try_center_square(board) if !square
  square = empty_squares(board).sample if !square

  board[square] = MARKER_COMPUTER
end

def board_full?(board)
  empty_squares(board).empty?
end

def someone_won?(board)
  !!detect_winner(board)
end

def detect_winner(board)
  WINNING_LINES.each do |line|
    if board.values_at(*line).count(MARKER_USER) == 3
      return WINNER_USER
    elsif board.values_at(*line).count(MARKER_COMPUTER) == 3
      return WINNER_COMPUTER
    end
  end
  nil
end

def find_at_risk_square(board, marker_type)
  WINNING_LINES.each do |line|
    next unless board.values_at(*line).count(marker_type) == 2
    at_risk = board.select { |k, v| line.include?(k) && v == MARKER_EMPTY }
    at_risk = at_risk.keys.first
    return at_risk if at_risk
  end
  nil
end

def find_square_to_win(board)
  find_at_risk_square(board, MARKER_COMPUTER)
end

def find_square_to_block(board)
  find_at_risk_square(board, MARKER_USER)
end

def try_center_square(board)
  board[CENTER_SPACE] == MARKER_EMPTY ? CENTER_SPACE : nil
end

def choose_first_player
  prompt "Would you like to go first? (Y)es, (N)o, or (R)andom?"

  user_response = ''
  loop do
    user_response = gets.chomp.upcase
    break if ALLOWED_RESPONSES.include?(user_response)
    prompt "Please enter (Y), (N), or (R)..."
  end
  user_response = ['Y', 'N'].sample if ['R', 'RANDOM'].include?(user_response)

  ['Y', 'YES'].include?(user_response) ? USER : COMPUTER
end

def continue?
  yes_no = ''
  prompt("Continue? (Y/N)")
  loop do
    yes_no = gets.chomp.downcase
    break if yes_no == 'y' || yes_no == 'n'
    prompt("Please reply with 'Y' or 'N'...")
  end
  yes_no == 'y' ? TRUE : FALSE
end

def display_final_scores(user_score, comp_score)
  if user_score > comp_score
    vs_score = "#{user_score} to #{comp_score}"
    prompt("You won the tournament, #{vs_score}! Nice job!")
    prompt("Congrats! You're smarter than a programmer!")
  else
    vs_score = "#{comp_score} to #{user_score}"
    prompt("The computer won the tournament, #{vs_score}.")
    prompt("Oh no, the machines are taking over!!!")
  end
end

user_score = 0
comp_score = 0
current_player = if WHO_GOES_FIRST == NONE
                   refresh_display(initialze_board, 0, 0)
                   prompt "Welcome to Tic-Tac-Toe!"
                   choose_first_player
                 else
                   WHO_GOES_FIRST
                 end
loop do
  board = initialze_board

  loop do
    refresh_display(board, user_score, comp_score)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end

  refresh_display(board, user_score, comp_score)

  if someone_won?(board)
    detect_winner(board) == WINNER_USER ? user_score += 1 : comp_score += 1
    refresh_display(board, user_score, comp_score)
    prompt detect_winner(board)
  else
    prompt WINNER_NONE
  end

  if (user_score < SCORE_LIMIT) && (comp_score < SCORE_LIMIT)
    break unless continue?
  else
    display_final_scores(user_score, comp_score)
    break
  end
end