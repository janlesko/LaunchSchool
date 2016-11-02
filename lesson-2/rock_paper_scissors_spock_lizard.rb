VALID_CHOICES = %w(rock paper scissors spock lizard)

def prompt(message)
  puts "=> #{message}"
end

def translate_shortcut(shortcut)
  case shortcut
  when "ro" then "rock"
  when "pa" then "paper"
  when "sc" then "scissors"
  when "sp" then "spock"
  when "li" then "lizard"
  end
end

def win?(first, second)
  (first == 'rock' && %w(scissors lizard).include?(second)) ||
    (first == 'paper' && %w(rock spock).include?(second)) ||
    (first == 'scissors' && %w(paper lizard).include?(second)) ||
    (first == 'spock' && %w(scissors rock).include?(second)) ||
    (first == 'lizard' && %w(paper spock).include?(second))
end

def display_results(player, computer)
  if win?(player, computer)
    prompt "You won the round!"
  elsif win?(computer, player)
    prompt "Computer won the round!"
  else
    prompt "It's a tie!"
  end
end

prompt "Welcome to the **Rock Paper Scissors Spock Lizard** Game"
prompt "First to reach 5 points wins!"

your_score = 0
computer_score = 0
loop do
  choice = nil
  loop do
    shortcut_prompt = <<-MSG
      Make a choice by hitting keys:
          \"RO\" for rock
          \"PA\" for paper
          \"SC\" for scissors
          \"SP\" for spock
          \"LI\" for lizard"
    MSG

    prompt(shortcut_prompt)
    ask_shortcut = gets.chomp.downcase
    choice = translate_shortcut(ask_shortcut)

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt "That's not a valid choice."
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt "You chose: #{choice}; Computer chose: #{computer_choice}"
  display_results(choice, computer_choice)

  your_score += 1 if win?(choice, computer_choice)
  computer_score += 1 if win?(computer_choice, choice)

  prompt "Your score is: #{your_score} | Computer score is: #{computer_score}"

  if your_score == 5
    prompt "You won the game!"
  elsif computer_score == 5
    prompt "Computer won the game!"
  end

  next unless your_score == 5 || computer_score == 5

  prompt "Do you want to play again? Hit \"Y\" if yes."
  answer = gets.chomp.downcase
  break unless %w(y yes).include?(answer)
  your_score = 0
  computer_score = 0
end

prompt "Thank you for playing the game!"
