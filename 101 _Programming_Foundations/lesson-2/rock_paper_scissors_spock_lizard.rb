VALID_CHOICES = %w(rock paper scissors spock lizard)

WINNER_SCORE = 5

SHORTCUTS = { r: "rock",
              p: "paper",
              s: "scissors",
              k: "spock",
              l: "lizard" }

WINNING_COMBINATION = { rock:     %w(scissors lizard),
                        paper:    %(rock spock),
                        scissors: %(paper lizard),
                        spock:    %(scissors rock),
                        lizard:   %(paper spock) }

def prompt(message)
  puts "=> #{message}"
end

def clear_screen
  system('clear') || system('cls')
end

def determine_winner(choice, computer_choice)
  if computer_choice == choice
    "tie"
  elsif WINNING_COMBINATION[choice.to_sym].include?(computer_choice)
    "player"
  else
    "computer"
  end
end

def display_results(winner)
  if winner == "player"
    prompt "You won this round!"
  elsif winner == "computer"
    prompt "Computer won this round!"
  else
    prompt "This round is a tie!"
  end
end

prompt "Welcome to the **Rock Paper Scissors Spock Lizard** Game"
prompt "First to reach #{WINNER_SCORE} points wins!"

your_score = 0
computer_score = 0
loop do
  choice = nil
  loop do
    shortcut_prompt = <<-MSG
      Make a choice by hitting a key:
          \"R\" for rock
          \"P\" for paper
          \"S\" for scissors
          \"K\" for spock
          \"L\" for lizard"
    MSG

    prompt(shortcut_prompt)
    ask_shortcut = gets.chomp.downcase.to_sym
    clear_screen
    choice = SHORTCUTS[ask_shortcut]

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt "That's not a valid choice."
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt "You chose: #{choice}; Computer chose: #{computer_choice}"
  display_results(determine_winner(choice, computer_choice))

  if determine_winner(choice, computer_choice) == "player"
    your_score += 1
  elsif determine_winner(choice, computer_choice) == "computer"
    computer_score += 1
  end

  prompt "Your score is: #{your_score} | Computer score is: #{computer_score}"

  if your_score == WINNER_SCORE
    prompt "You won the game!"
  elsif computer_score == WINNER_SCORE
    prompt "Computer won the game!"
  end

  next unless your_score == WINNER_SCORE || computer_score == WINNER_SCORE

  answer = nil
  loop do
    prompt "Do you want to play again? Hit \"Y\" if yes."
    answer = gets.chomp.downcase
    break if %w(y yes n no).include?(answer)
    prompt "Sorry, that is not a valid answer."
  end

  break unless %w(y yes).include?(answer)
  your_score = 0
  computer_score = 0
end

prompt "Thank you for playing the game!"
