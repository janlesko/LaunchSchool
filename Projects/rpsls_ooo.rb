WIN_COMBOS = { Rock:     { Lizard: "crushes",
                           Scissors: "crushes" },
               Paper:    { Rock: "covers",
                           Spock: "disproves" },
               Scissors: { Paper: "cuts",
                           Lizard: "decapitates" },
               Lizard:   { Spock: "poisons",
                           Paper: "eats" },
               Spock:    { Scissors: "smashes",
                           Rock: "vaporizes" } }.freeze

MOVE_SYMBOLS = { R: :Rock, P: :Paper, S: :Scissors, L: :Lizard, K: :Spock }

WIN_SCORE = 5

class Choice
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def >(other_player)
    WIN_COMBOS[value].keys.include?(other_player.value)
  end
end

class Player
  attr_accessor :name, :move

  def initialize
    set_name
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

  def choose
    answer = nil
    loop do
      puts "Select one by typying in letter in ( )."
      puts "(R)ock, (P)aper, (S)cissors, (L)izard, Spoc(k)"
      answer = gets.chomp.upcase.to_sym
      break if MOVE_SYMBOLS.keys.include?(answer)
      puts "Sorry, that is not a valid choice."
    end
    self.move = Choice.new(MOVE_SYMBOLS[answer])
  end
end

class Computer < Player
  def set_name
    self.name = ['Hal 9000', 'Holly', 'Skynet', 'Cortana'].sample
    puts "You are playing against #{name}."
    puts
  end

  def select_personality(human_move, history)
    case name
    when 'Holly'    then Holly.new
    when 'Cortana'  then Cortana.new
    when 'Hal 9000' then Hal9000.new(human_move)
    when 'Skynet'   then Skynet.new(history)
    end
  end

  def choose(human_move, history)
    personality = select_personality(human_move, history)
    self.move = Choice.new(personality.strategy)
  end
end

# never rock
class Holly
  def strategy
    (MOVE_SYMBOLS.values - [:Rock]).sample
  end
end

# mainly scissors, rarely lizard
class Cortana
  def strategy
    (MOVE_SYMBOLS.values + (MOVE_SYMBOLS.values - [:Lizard]) +
    [:Scissors, :Scissors]).sample
  end
end

# cheats
class Hal9000
  def initialize(human_move)
    @human_move = human_move
  end

  def strategy
    (MOVE_SYMBOLS.values - WIN_COMBOS[@human_move].keys +
    MOVE_SYMBOLS.values).sample
  end
end

# learns
class Skynet
  attr_accessor :moves
  attr_reader :human_moves

  def initialize(history)
    @human_moves = history.first.last
    @moves = MOVE_SYMBOLS.values
  end

  def strategy
    return moves.sample if human_moves.empty?
    human_moves.each do |human_move|
      counter_moves = WIN_COMBOS[human_move].keys
      counter_moves.each { |counter| moves << WIN_COMBOS[counter].keys }
    end
    moves.flatten.sample
  end
end

class Score
  def initialize(human, computer)
    @score_stats = { human => 0, computer => 0 }
  end

  def update(winner)
    @score_stats[winner] += 1 unless winner == "None"
  end

  def display
    puts
    @score_stats.each { |k, v| print "| #{k}'s Score => #{v} |  " }
    puts
    puts
  end

  def max_reached?
    @score_stats.values.include?(WIN_SCORE)
  end
end

class History
  attr_accessor :tracker

  def initialize(human, computer)
    @tracker = { human => [], computer => [], :winner => [] }
  end

  def update(human_move, computer_move, winner)
    hum, com, win = tracker.keys
    tracker[hum] << human_move
    tracker[com] << computer_move
    tracker[win] << winner
  end

  def find_action(winner_move, looser_move)
    WIN_COMBOS[winner_move][looser_move]
  end

  def display_match_result(human_move)
    winner = tracker[:winner].last
    if winner == "None"
      return puts "It's a tie. Both players chose #{human_move}."
    end
    winner_move = tracker[winner].last
    looser = (tracker.keys - [winner]).first
    looser_move = tracker[looser].last
    action = find_action(winner_move, looser_move)
    puts "#{winner}'s #{winner_move} #{action} #{looser}'s #{looser_move}"
  end

  def display_all
    human, computer, winner = tracker.keys
    rounds = tracker[winner].size
    output_row(human, computer, winner, rounds)
  end

  def output_row(human, computer, winner, rounds)
    rounds.times do |index|
      puts "Round #{index + 1}) #{human} chose #{tracker[human][index]}. " \
         "#{computer} chose #{tracker[computer][index]}. " \
         "Winner: #{tracker[winner][index]}"
    end
    puts
  end
end

class RPSGame
  attr_accessor :winner
  attr_reader :human, :computer, :score, :history

  def initialize
    display_intro_message
    @human = Human.new
    @computer = Computer.new
  end

  def determine_winner
    self.winner = if human.move > computer.move
                    human.name
                  elsif computer.move > human.move
                    computer.name
                  else
                    "None"
                  end
  end

  def clear_screen
    system('clear') || system('cls')
  end

  def display_intro_message
    clear_screen
    puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!"
    puts
    display_rules
    puts
    puts "First player to reach #{WIN_SCORE} points wins."
    puts
  end

  def display_rules
    puts "<<<Rules>>>".rjust(25)
    WIN_COMBOS.each do |move, other|
      print move.to_s + " => "
      other.each do |counter, action|
        print "#{action} #{counter} / "
      end
      puts
    end
  end

  def display_goodbye
    puts "Thank you for playing. Goodbye."
  end

  def play_again?
    answer = nil
    loop do
      puts "Game over. Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y yes n no).include?(answer)
      puts "Sorry, that is not a valid choice."
    end
    %w(y yes).include?(answer)
  end

  def history_update
    history.update(human.move.value, computer.move.value, winner)
  end

  def display_result
    history.display_all
    history.display_match_result(human.move.value)
  end

  def computer_choose
    computer.choose(human.move.value, @history.tracker)
  end

  def reset
    @score = Score.new(human.name, computer.name)
    @history = History.new(human.name, computer.name)
  end

  def start_match
    loop do
      human.choose
      clear_screen
      computer_choose
      determine_winner
      history_update
      display_result
      score.update(winner)
      score.display
      break if score.max_reached?
    end
  end

  def play
    loop do
      reset
      start_match
      break unless play_again?
      clear_screen
    end
    display_goodbye
  end
end

RPSGame.new.play
