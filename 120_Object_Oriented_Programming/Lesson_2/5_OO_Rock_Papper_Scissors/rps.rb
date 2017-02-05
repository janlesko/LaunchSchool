WINNING_COMBINATIONS = { "r" => "s",
                         "p" => "r",
                         "s" => "p" }

def computer_turn
  %w(r p s).sample
end

def player_turn
  choice = ''
  loop do
    puts "Your choice: (r)ock, (p)aper, (s)cissors"
    choice = gets.chomp.downcase
    break if %w(r p s).include?(choice)
    puts "Not a valid choice"
  end
  choice
end

def determine_winner(computer_choice, player_choice)
  if WINNING_COMBINATIONS[player_choice] == computer_choice
    return "player"
  end
  if WINNING_COMBINATIONS[computer_choice] == player_choice
    return "computer"
  end
  "tie"
end

computer_choice = computer_turn
player_choice = player_turn

p computer_choice
p determine_winner(computer_choice, player_choice)




