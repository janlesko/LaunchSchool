class Move
  VALUES = %w(rock paper scissors)
  
  def initialize(value)
    @value = value
  end
  
  def scissors?
    @value == 'scissors'
  end
  
  def rock?
    @value == 'rock'
  end
  
  def paper?
    @paper == 'paper'
  end
  
  def >(other_move)
    case @value
    when rock?
      return true if other_move.scissors?
      return false
    when paper?
      return true if other_move.rock?
      return false
    when scissors?
      return true if other_move.paper?
      return false
    end
end

class Player
  attr_accessor :move, :name
  
  def initialize
    set_name
  end
end

class Human < Player
  def set_name
    answer = nil
    loop do
      puts "What's your name?"
      answer = gets.chomp
      break unless answer.empty?
      puts "Sorry, must enter a value."
    end
    self.name = answer
  end
  
  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, or scissors:"
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Treminator', 'Number 5'].sample
  end
  
  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

class RPSGame
  attr_accessor :human, :computer
  
  def initialize
    @human = Human.new
    @computer = Computer.new
  end
  
  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!"
  end
  
  def display_goodbye_message
    puts "Thanks for playing Rock, Plaper, Scissors. Good bye!"
  end
  
  def display_winner
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
    
    if human.move > computer.move
      puts "#{human.name} won!"
    elsif human.move < computer.move
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
  end
  
  def play_again?
    answer = nil
      loop do
        puts "Play again? (yes/no)"
        answer = gets.chomp.downcase
        break if %w(y yes n no).include?(answer)
        puts "Not a valid choice."
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