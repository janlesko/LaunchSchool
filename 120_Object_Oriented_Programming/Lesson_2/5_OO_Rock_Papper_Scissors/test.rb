class Player
  attr_accessor :move, :name
  
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
      puts "Sorry, you must enter value"
    end
  end
  
  def choose
    answer = nil
    loop do
      puts "Please choose rock, paper, or scissors:"
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
  VALUES = %w(rock paper scissors)
  
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
  
  def >(other_move)
    if rock?
      return true if other_move.scissors?
      return false
    elsif paper?
      return true if other_move.rock?
      return false
    elsif scissors?
      return true if other_move.paper?
      return false
    end
  end
  
  def <(other_move)
    if rock?
      return true if other_move.paper?
      return false
    elsif paper?
      return true if other_move.scissors?
      return false
    elsif scissors?
      return true if other_move.rock?
      return false
    end
  end
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
  
  def display_winner
    puts "#{human.name} chose #{human.move.value}."
    puts "#{computer.name} chose #{computer.move.value}."
    
    if human.move > computer.move
      puts "#{human.name} won!"
    elsif human.move < computer.move
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
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
  
  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play