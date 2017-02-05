class Player
  attr_accessor :move
  
  def initialize(player_type)
    @current_player = player_type
    @move = nil
  end
  
  def choose
    if human?
      loop do
        puts "Choose Rock, Paper, or Scissors"
        self.move = gets.chomp.downcase
        break if %w(rock paper scissors).include?(move)
        puts "Not a valid choice"
      end
    else
      self.move = %w(rock paper scissors).sample
    end
  end
  
  def human?
    @current_player == :human
  end
end

class RPSGame
  attr_accessor :human, :computer
  
  def initialize
    @human = Player.new(:human)
    @computer = Player.new(:computer)
  end
  
  def display_welcome_message
    puts "Welcome"
  end
  
  def display_goodbye_message
    puts "Goodbye"
  end
  
  def play
    display_welcome_message
    human.choose #part of "Player" class with "choose" method
    computer.choose #part of "Player" class with "choose" method
    display_winner
    display_goodbye_message
  end
end

RPSGame.new.play
