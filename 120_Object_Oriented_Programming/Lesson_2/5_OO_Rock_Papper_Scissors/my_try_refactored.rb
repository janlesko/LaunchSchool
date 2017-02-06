class Player
  attr_accessor :move, :name
  
  def initialize(player_type)
    @current_player = player_type
    @move = nil
    set_name
  end
  
  def set_name
    if human?
      loop do
        puts 'What is your name?'
        self.name = gets.chomp
        break unless name.empty?
        puts 'Please enter some value'
      end
    else
      self.name = %w(Treminator Number5 EC3CX).sample
    end
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

class Rule < Player
  WINNING_COMBINATIONS = { "rock"     => "scissors",
                           "paper"    => "rock",
                           "scissors" => "paper" }
  
  def determine_winner(computer_choice, player_choice)
    if WINNING_COMBINATIONS[player_choice] == computer_choice
      return "#{human.name} won!"
    end
    if WINNING_COMBINATIONS[computer_choice] == player_choice
      return "#{computer.name} won!"
    end
    "It's a tie!"
  end
end

class RPSGame < Rule
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
    puts "#{computer.name} chose: #{computer.move}"
    puts "#{human.name} chose: #{human.move}"
    puts determine_winner(computer.move, human.move)
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

