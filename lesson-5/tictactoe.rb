INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze
WHO_FIRST = 'choose'.freeze
WINNER_SCORE = 5

WINNING_LANES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You're the \"#{PLAYER_MARKER}\". Computer is the \"#{COMPUTER_MARKER}\""
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
end
# rubocop:enable Metrics/Abcsize

def first_turn
  if WHO_FIRST == "player"
    "player"
  elsif WHO_FIRST == "computer"
    "computer"
  else
    user_chooses_first
  end
end

def user_chooses_first
  loop do
    prompt "Choose who goes first: (P)layer, (C)omputer, (R)andom."
    answer = gets.chomp.upcase
    case answer
    when "P" then return "player"
    when "C" then return "computer"
    when "R" then return ["player", "computer"].sample
    else
      prompt "not a valid choice"
    end
  end
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def joinor(arr, deliminator=', ', word='or')
  case arr.size
  when 0 then ""
  when 1 then arr.first
  when 2 then arr.join(" #{word} ")
  else
    arr[-1] = "#{word} #{arr.last}"
    arr.join(deliminator)
  end
end

def player_pick_square!(brd)
  answer = ''
  loop do
    prompt "Select square: #{joinor(empty_squares(brd))}"
    answer = gets.chomp.to_i
    break if empty_squares(brd).include?(answer)
    prompt "Not a valid choice"
  end
  brd[answer] = PLAYER_MARKER
end

def computer_pick_square!(brd)
  square = attack_move(brd)
  square = defense_move(brd) if !square
  square = take_middle(brd) if !square
  square = empty_squares(brd).sample if !square
  brd[square] = COMPUTER_MARKER
end

def find_at_risk_square(line, brd, marker)
  if brd.values_at(*line).count(marker) == 2
    brd.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  end
end

def attack_move(brd)
  square = nil
  WINNING_LANES.each do |line|
    square = find_at_risk_square(line, brd, COMPUTER_MARKER)
    break if square
  end
  square
end

def defense_move(brd)
  square = nil
  WINNING_LANES.each do |line|
    square = find_at_risk_square(line, brd, PLAYER_MARKER)
    break if square
  end
  square
end

def take_middle(brd)
  5 if empty_squares(brd).include?(5)
end

def detect_winner(brd)
  WINNING_LANES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return "Player"
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return "Computer"
    end
  end
  nil
end

def display_winner(brd)
  if detect_winner(brd) == 'Player'
    prompt "Player won"
  elsif detect_winner(brd) == 'Computer'
    prompt "Computer won"
  elsif board_full?(brd)
    prompt "It's a tie"
  end
end

def somebody_won?(brd)
  !!detect_winner(brd)
end

def play_again?
  loop do
    prompt "Play again? y/n"
    answer = gets.chomp.downcase
    if answer == 'y'
      return true
    elsif answer == 'n'
      return false
    else
      prompt "Not a valid choice."
    end
  end
end

def place_piece!(brd, current_player)
  if current_player == "computer"
    computer_pick_square!(brd)
  else
    player_pick_square!(brd)
  end
end

def alternate_player(current_player)
  current_player == "player" ? "computer" : "player"
end

computer_score = 0
player_score = 0

loop do
  board = initialize_board
  current_player = first_turn
  loop do
    display_board(board)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if board_full?(board) || somebody_won?(board)
  end

  display_board(board)
  display_winner(board)

  computer_score += 1 if detect_winner(board) == 'Computer'
  player_score += 1 if detect_winner(board) == 'Player'

  prompt "Computer score is: #{computer_score}"
  prompt "Player score is: #{player_score}"

  break if computer_score == 5 || player_score == 5
  break unless play_again?
end

prompt "Game over. Thank you for playing."
