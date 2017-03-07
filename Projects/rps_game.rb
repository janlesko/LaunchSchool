WIN_COMBOS = { rock:     { lizard: "crushes",
                           scissors: "crushes" },
               paper:    { rock: "covers",
                           spock: "disproves" },
               scissors: { paper: "cuts",
                           lizard: "decapitates" },
               lizard:   { spock: "poisons",
                           paper: "eats" },
               spock:    { scissors: "smashes",
                           rock: "vaporizes" } }.freeze

MOVE_SYMS = { r: :rock, p: :paper, s: :scissors, l: :lizard, k: :spock }.freeze

WIN_SCORE = 5

class Move
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def >(other_player)
    WIN_COMBOS[value].keys.include?(other_player.value)
  end

  def to_s
    value.to_s.capitalize
  end
end

class Player
  attr_accessor :name, :move, :score

  def initialize
    set_name
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

  def choose
    answer = nil
    loop do
      puts "Select one by typying in letter in ( )."
      puts "(R)ock, (P)aper, (S)cissors, (L)izard, Spoc(k)"
      answer = gets.chomp.to_sym
      break if MOVE_SYMS.keys.include?(answer)
      puts "Sorry, that is not a valid choice."
    end
    self.move = Move.new(MOVE_SYMS[answer])
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
    self.move = Move.new(personality.strategy)
  end
end

# never rock
class Holly
  def strategy
    (MOVE_SYMS.values - [:rock]).sample
  end
end

# mainly scissors, rarely lizard
class Cortana
  def strategy
    (MOVE_SYMS.values + (MOVE_SYMS.values - [:lizard]) +
    [:scissors, :scissors]).sample
  end
end

# cheats
class Hal9000
  def initialize(human_move)
    @human_move = human_move
  end

  def strategy
    (MOVE_SYMS.values - WIN_COMBOS[@human_move].keys + MOVE_SYMS.values).sample
  end
end

# learns
class Skynet
  attr_accessor :moves
  attr_reader :human_moves

  def initialize(history)
    @human_moves = history[:human]
    @moves = MOVE_SYMS.values
  end

  def strategy
    return moves.sample if human_moves.empty?
    human_moves.each do |human_move|
      counter_moves = WIN_COMBOS[human_move.value].keys
      counter_moves.each { |counter| moves << WIN_COMBOS[counter].keys }
    end
    moves.flatten.sample
  end
end

class History
  attr_accessor :tracker
  attr_reader :human, :computer

  def initialize(human, computer)
    @tracker = { human: [], computer: [], winners: [] }
    @human = human
    @computer = computer
  end

  def update(winner_name)
    tracker[:human] << human.move
    tracker[:computer] << computer.move
    tracker[:winners] << winner_name
  end

  def display_match_result
    if tracker[:winners].last == "None"
      return puts "It's a tie. Both players chose #{human.move}."
    end
    puts "#{last_winner.name}'s #{last_winner.move} #{last_action} " \
         "#{last_looser.name}'s #{last_looser.move}"
  end

  def last_winner
    tracker[:winners].last == human.name ? human : computer
  end

  def last_looser
    last_winner == human ? computer : human
  end

  def last_action
    WIN_COMBOS[last_winner.move.value][last_looser.move.value]
  end

  def display_all
    rounds.times do |index|
      puts "Round #{index + 1}) #{human.name} chose " \
           "#{tracker[:human][index]}. #{computer.name} chose " \
           "#{tracker[:computer][index]}. Winner: #{tracker[:winners][index]}"
    end
    puts
  end

  def rounds
    tracker[:winners].size
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
      print "#{move} => "
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

  def display_result
    history.display_all
    history.display_match_result
  end

  def computer_choose
    computer.choose(human.move.value, @history.tracker)
  end

  def reset
    @history = History.new(human, computer)
    human.score = 0
    computer.score = 0
  end

  def display_score
    puts
    puts "| #{human.name}'s Score => #{human.score} | " \
         "| #{computer.name}'s Score => #{computer.score} |"
    puts
  end

  def update_score
    human.score += 1 if winner == human.name
    computer.score += 1 if winner == computer.name
  end

  def max_score_reached?
    human.score == WIN_SCORE || computer.score == WIN_SCORE
  end

  def start_match
    loop do
      human.choose
      clear_screen
      computer_choose
      determine_winner
      history.update(winner)
      display_result
      update_score
      display_score
      break if max_score_reached?
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
