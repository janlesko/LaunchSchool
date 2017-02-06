class Player
  attr_accessor :move, :name
  
  def initialize(player_type)
    @player_type = player_type
    @move = nil
    set_name
  end
  
  def set_name
    if human?
      answer = nil
      loop do
        puts "What's your name?"
        answer = gets.chomp
        break unless answer.empty?
        puts "Sorry, must enter a value."
      end
      self.name = answer
    else
      self.name = ['R2D2', 'Hal', 'Treminator', 'Number 5'].sample
    end
  end
  
  def choose
    if human?
      choice = nil
      loop do
        puts "Please choose rock, paper, or scissors:"
        choice = gets.chomp
        break if %w(rock paper scissors).include?(choice)
        puts "Sorry, invalid choice."
      end
      self.move = choice
    else
      self.move = ['rock', 'paper', 'scissors'].sample
    end
  end
  
  def human?
    @player_type == :human
  end
end

class RPSGame
  attr_accessor :human, :computer
  
  def initialize
    @human = Player.new(:human)
    @computer = Player.new(:computer)
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
    
    case human.move
    when 'rock'
      puts "It's a tie!" if computer.move == 'rock'
      puts "#{human.name} won!" if computer.move == 'scissors'
      puts "#{computer.name} won!" if computer.move == 'paper'
    when 'paper'
      puts "It's a tie!" if computer.move == 'paper'
      puts "#{human.name} won!" if computer.move == 'scissors'
      puts "#{computer.name} won!" if computer.move == 'rock'
    when 'scissors'
      puts "It's a tie!" if computer.move == 'scissors'
      puts "#{human.name} won!" if computer.move == 'paper'
      puts "#{computer.name} won!" if computer.move == 'rock'
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