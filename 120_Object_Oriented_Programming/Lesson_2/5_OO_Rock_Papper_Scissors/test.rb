WIN_COMBOS = { :Rock     => { :Lizard   => "Rock crushes Lizard!",
                              :Scissors => "Rock crushes Scissors!" },
               :Paper    => { :Rock  => "Paper covers Rock!",
                              :Spock => "Paper disproves Spock!" },
               :Scissors => { :Paper  => "Scissors cuts Paper!",
                              :Lizard => "Scissors decapitates Lizard!" },
               :Lizard   => { :Spock => "Lizard poisons Spock!",
                              :Paper => "Lizard eats Paper!" },
               :Spock    => { :Scissors => "Spock smashes Scissors!",
                              :Rock     => "Spock vaporizes Rock!" } }.freeze

SHORTCUTS = { R: :Rock, P: :Paper, S: :Scissors, L: :Lizard, K: :Spock }

WIN_SCORE = 3

class Strategy
  def initialize
    @counter_moves = { Rock: 0, Paper: 0, Scissors: 0, Lizard: 0, Spock: 0}
  end
  
  def add_counter_moves(human_move)
  WIN_COMBOS[:paper]... [:scissor, :lizard].each do |element| 
                          counter_move[element] += 1
  
  human_moves = ["paper", "paper", "rock", "scissors", "spock", "rock"]
  rock = 2
  paper = 2
  scissors = 1
  spock = 1

  paper
  
  counter_moves = { Rock: 0, Paper: 0, Scissors: 0, Lizard: 0, Spock: 0}
  
  def add_counter_moves(human.move)
  WIN_COMBOS[:paper]... [:scissor, :lizard].each do |element| 
                          counter_move[element] += 1
  
  
  
  rock +
  paper +++
  scissors ++
  lizard +++
  spock +++
  
  20
  20
  20
  20
  20
  
  10
  25
  15
  25
  25
  
end

class Move
  attr_reader :value
  
  def initialize(value)
    @value = value
  end
  
  def >(other_player)
    WIN_COMBOS[value].keys.include?(other_player.value)
  end
  
  def <(other_player)
    WIN_COMBOS[other_player.value].keys.include?(value)
  end
  
  def to_s
    value.to_s
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
      break unless self.name.empty?
      puts "Please enter a value."
    end
  end
  
  def choose
    answer = nil
    loop do
      puts "Select one by typying in letter in ( )."
      puts "(R)ock, (P)aper, (S)cissors, (L)izard, Spoc(k)"
      answer = gets.chomp.upcase.to_sym
      break if SHORTCUTS.keys.include?(answer)
      puts "Sorry, that is not a valid choice."
    end
    self.move = Move.new(SHORTCUTS[answer])
  end
end

class Computer < Player
  def set_name
    self.name = ['Hal 9000', 'Holly', 'Skynet', 'Cortana'].sample
  end
  
  def choose
    self.move = Strategy.new
    self.move = Move.new(SHORTCUTS.values.sample)
  end
end

class Score
  def initialize(human, computer)
    @score_stats = { human => 0, computer => 0 }
  end
  
  def update(winner)
    @score_stats[winner] += 1 if !!winner
  end
  
  def display
    puts 'Current scores:'
    @score_stats.each { |k, v| puts "#{k} => #{v}" }
  end
  
  def max_reached?
    @score_stats.values.include?(WIN_SCORE)
  end
end

class History
  def initialize
    @moves = { :human => [], :computer => [], :winner => [] }
  end
  
  def update(human_move, computer_move, winner)
    @moves[:human] << human_move
    @moves[:computer] << computer_move
    @moves[:winner] << (!!winner ? winner : "none")
  end
  
  def display(human, computer)
    
  end
end

class RPSGame
  attr_reader :human, :computer, :history
  attr_accessor :winner, :score
  
  def initialize
    @computer = Computer.new
    @human = Human.new
    @history = History.new
  end
  
  def score_reset
    self.score = Score.new(human.name, computer.name)
  end
  
  def display_greeting
    puts "Hi #{human.name}! Welcome to the Rock, Paper, Scissors, Lizard, Spock."
    puts "Your are playing against #{computer.name}."
    puts "First to #{WIN_SCORE} wins!"
  end
  
  def display_goodbye
    puts "Thank you for playing. Goodbye."
  end
  
  def display_moves
    puts "#{computer.name} chose #{computer.move}."
    puts "#{human.name} chose #{human.move}."
  end
  
  def determine_winner
    self.winner = if human.move > computer.move
                    human.name
                  elsif human.move < computer.move
                    computer.name
                  end
                  nil
  end
  
  def display_match_result
    case winner
    when human.name
      puts WIN_COMBOS[human.move.value][computer.move.value]
      puts "#{human.name} won!"
    when computer.name
      puts WIN_COMBOS[computer.move.value][human.move.value]
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
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
  
  def log_history
    history.update(human.move.value, computer.move.value, winner)
  end
  
  def history_display
    history.display(human.name, computer.name)
  end
  
  def start_match
    score_reset
    loop do
      human.choose
      computer.choose
      display_moves
      determine_winner
      display_match_result
      log_history
      score.update(winner)
      score.display
      history_display
      break if score.max_reached?
    end
  end

  def play
    display_greeting
    loop do
      start_match
      break unless play_again?
    end
    display_goodbye
  end
end

RPSGame.new.play