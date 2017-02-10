class Player
  WINNING_SCORE = 3
  
  attr_accessor :move, :name, :score
  
  def initialize
    set_name
    @score = 0
  end
end

class Computer < Player
  def set_name
    self.name = ['Skynet', 'Hal 9000', 'Holly', 'Cortana'].sample
  end
  
  def choose
    self.move = Move.new(Move::VALUES.keys.sample)
  end
end

class Human < Player
  def set_name
    loop do
      puts "What is your name?"
      self.name = gets.chomp
      break unless self.name.empty?
      puts "Sorry, must enter value."
    end
  end
  
  def choose
    answer = nil
    loop do
      puts "Please select one by typing in letter in ( )"
      puts "(R)ock, (P)aper, (S)cissors, (L)izard, (S)pock"
      answer = gets.chomp.upcase.to_sym
      break if Move::VALUES.keys.include?(answer)
      puts "Sorry, that is not a valid choice."
    end
    self.move = Move.new(answer)
  end
end

class Move
  VALUES = { R: 'rock', P: 'paper', S: 'scissors', K: 'spock', L: 'lizard' }
  
  attr_accessor :move
  
  def initialize(value)
    @move = value
  end
  
  def rock?
    self.move == :R
  end
  
  def paper?
    self.move == :P
  end
  
  def scissors?
    self.move == :S
  end
  
  def spock?
    self.move == :K
  end
  
  def lizard?
    self.move == :L
  end
  
  def >(other_player)
    case
    when :R then Rock.new(other_player)
    when :P then Paper.new(other_player)
    when :S then Scissors.new(other_player)
    when :K then Spock.new(other_player)
    when :L then Lizard.new(other_player)
    end
  end
    
    # (rock? && (other_player.scissors? || other_player.lizard?)) ||
    # (paper? && (other_player.rock? || other_player.spock?)) ||
    # (scissors? && (other_player.paper? || other_player.lizard?)) ||
    # (spock? && (other_player.rock? || other_player.scissors?)) ||
    # (lizard? && (other_player.spock? || other_player.paper?))
  
  def <(other_player)
    (rock? && (other_player.spock? || other_player.paper?)) ||
    (paper? && (other_player.scissors? || other_player.lizard?)) ||
    (scissors? && (other_player.rock? || other_player.spock?)) ||
    (spock? && (other_player.lizard? || other_player.paper?)) ||
    (lizard? && (other_player.scissors? || other_player.rock?))
  end
  
  def to_s
    VALUES[move]
  end
end

class Rock
  def initialize(other_player)
    
  end
end

class RPSGame
  attr_accessor :human, :computer
  
  def initialize
    @human = Human.new
    @computer = Computer.new
  end
  
  def display_greeting
    puts "Hi #{human.name}. Welcome to Rock, Paper, Scissors, Spock, Lizard!"
    puts "You are playing against #{computer.name}."
    puts "First to reach score #{Player::WINNING_SCORE} wins the game."
  end
  
  def display_goodbye
    puts "Thank you for playing. Goodbye!"
  end
  
  def display_moves
    puts "You chose: #{human.move}"
    puts "Computer chose: #{computer.move}"
  end
  
  def display_winner
    if human.move > computer.move
      puts "You won!"
    elsif human.move < computer.move
      puts "Computer won!"
    else
      puts "It's a tie"
    end
  end
  
  def adjust_score
    if human.move > computer.move
      human.score += 1
    elsif human.move < computer.move
      computer.score += 1
    end
  end
  
  def display_score
    puts "#{human.name}'s score is: #{human.score}"
    puts "#{computer.name}'s score is: #{computer.score}"
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
  
  def max_score_reached?
    (human.score == Player::WINNING_SCORE) || 
      (computer.score == Player::WINNING_SCORE)
  end
  
  def reset_score
    human.score = 0
    computer.score = 0
  end

  def start_match
    reset_score
    loop do
      human.choose
      computer.choose
      display_moves
      display_winner
      adjust_score
      display_score
      break if max_score_reached?
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