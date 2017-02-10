class Player
  MAXSCORE = 3
  
  attr_accessor :move, :name, :score

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
      break unless name.empty?
      puts "Sorry, you must enter value"
    end
  end

  def choose
    answer = nil
    loop do
      puts "Please choose rock, paper, scissors, spock, or lizard:"
      answer = gets.chomp
      break if Move::VALUES.include?(answer)
    end
    self.move = Move.new(answer)
  end
end

class Computer < Player
  def set_name
    self.name = ['Treminator', 'Number 5', 'RD8XX'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

class Move
  VALUES = %w(rock paper scissors lizard spock)

  attr_accessor :value

  def initialize(value)
    @value = value
  end

  def paper?
    @value == 'paper'
  end

  def rock?
    @value == 'rock'
  end

  def scissors?
    @value == 'scissors'
  end
  
  def spock?
    @value == 'spock'
  end
  
  def lizard?
    @value == 'lizard'
  end

  def >(other_move)
    (rock? && ((other_move.scissors?) || (other_move.lizard?))) ||
      (paper? && ((other_move.rock?) || (other_move.spock?))) ||
      (scissors? && ((other_move.paper?) || (other_move.lizard?))) ||
      (spock? && ((other_move.scissors?) || (other_move.rock?))) ||
      (lizard? && ((other_move.paper?) || (other_move.spock?)))
  end

  def <(other_move)
    (rock? && ((other_move.paper?) || (other_move.spock?))) ||
      (paper? && ((other_move.scissors?) || (other_move.lizard?))) ||
      (scissors? && ((other_move.spock?) || (other_move.rock?))) ||
      (spock? && ((other_move.paper?) || (other_move.lizard?))) ||
      (lizard? && ((other_move.rock?) || (other_move.paper?)))
  end
end

class Rock

end

class Paper
  
end

class Scissors
  
end

class Lizard
  
end

class Spock
  
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors."
  end

  def display_goodbye_message
    puts "Thank you for playing"
  end

  def display_moves
    puts "#{human.name} chose #{human.move.value}."
    puts "#{computer.name} chose #{computer.move.value}."
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won!"
    elsif human.move < computer.move
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
  end

  def display_score
    if human.move > computer.move
      human.score += 1
    else
      computer.score += 1
    end
    puts "#{human.name} score is #{human.score}."
    puts "#{computer.name} score is #{computer.score}."
  end

  def play_again?
    answer = ''
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y yes n no).include?(answer)
      puts "Sorry, must enter answer"
    end
    %w(y yes).include?(answer)
  end

  def max_score_reached
    if human.score == Player::MAXSCORE
      puts "#{human.name} won the game!"
      true
    elsif computer.score == Player::MAXSCORE
      puts "#{computer.name} won the game!"
      true
    end
  end

  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_moves
      display_winner
      display_score
      break if max_score_reached
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
