SUITS = { 'H' => 'Hearts', 'D' => 'Diamonds',
          'S' => 'Spades', 'C' => 'Clubs' }.freeze
VALUES = %w(2 3 4 5 6 7 8 9 10 J Q K A).freeze
WIN_SCORE = 21
DEALER_LIMIT = (WIN_SCORE - 4)
WIN_ROUNDS = 5

def prompt(msg)
  puts "=> #{msg}"
end

def clear_screen
  system('clear') || system('cls')
end

def initialize_deck
  SUITS.keys.product(VALUES).shuffle
end

def card_value(value)
  if value == 'A'
    11
  elsif value.to_i.zero?
    10
  else
    value.to_i
  end
end

def total(cards)
  values = cards.map { |card| card[1] }
  sum = 0
  values.each do |value|
    sum += card_value(value)
  end

  values.count('A').times do
    sum -= 10 if sum > WIN_SCORE
  end

  sum
end

def busted?(cards)
  total(cards) > WIN_SCORE
end

def detect_result(dealer_cards, player_cards)
  player_total = total(player_cards)
  dealer_total = total(dealer_cards)

  if player_total > WIN_SCORE
    :player_busted
  elsif dealer_total > WIN_SCORE
    :dealer_busted
  elsif dealer_total < player_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

def display_result(dealer_cards, player_cards)
  result = detect_result(dealer_cards, player_cards)

  case result
  when :player_busted
    prompt "You busted! Dealer wins"
  when :dealer_busted
    prompt "Dealer busted! You win"
  when :player
    prompt "You win!"
  when :dealer
    prompt "Dealer wins!"
  when :tie
    prompt "It's a tie!"
  end
end

def press_to_continue
  prompt "Press enter to continue"
  gets
end

def play_again?
  loop do
    puts "Play again? y/n"
    answer = gets.chomp.downcase
    if answer == 'y'
      return true
    elsif answer == 'n'
      return false
    else
      puts "Not a valid choice."
    end
  end
end

def initial_round(player_cards, dealer_cards, deck)
  2.times do
    player_cards << deck.pop
    dealer_cards << deck.pop
  end
end

def display_round_summary(dealer_cards, player_cards, display_mode=:all)

  case display_mode
  when :all
    puts "==========="
    prompt "Dealer has #{dealer_cards}, for a total of: #{total(dealer_cards)}"
    prompt "You have #{player_cards}, for a total of: #{total(player_cards)}"
  when :hidden
    puts "==========="
    prompt "Dealer has #{dealer_cards[0]} and ?"
    prompt "You have #{player_cards}, for a total of: #{total(player_cards)}"
  end
end

player_score = 0
dealer_score = 0

loop do
  clear_screen

  prompt "First to #{WIN_ROUNDS} wins"
  prompt "Player score: #{player_score} / Dealer_score: #{dealer_score}"

  deck = initialize_deck
  player_cards = []
  dealer_cards = []

  initial_round(player_cards, dealer_cards, deck)

  display_round_summary(dealer_cards, player_cards, :hidden)

  loop do
    player_turn = nil
    loop do
      prompt "Would you like to (h)it or (s)tay?"
      player_turn = gets.chomp.downcase
      break if %w(h s).include?(player_turn)
      prompt "Sorry, please enter 'h' or 's'."
    end

    if player_turn == 'h'
      player_cards << deck.pop
      prompt "You chose to hit!"
      prompt "Your cards are now: #{player_cards}"
      prompt "Your total is now: #{total(player_cards)}"
    end

    break if player_turn == 's' || busted?(player_cards)
  end

  if busted?(player_cards)
    display_result(dealer_cards, player_cards)
    play_again? ? next : break
  else
    prompt "You stayed at #{total(player_cards)}"
  end

  prompt "Dealer turn..."

  loop do
    break if total(dealer_cards) >= DEALER_LIMIT || busted?(dealer_cards)

    prompt "Dealer hits!"
    dealer_cards << deck.pop
    prompt "Dealer's cards are now: #{dealer_cards}"
  end

  if busted?(dealer_cards)
    prompt "Dealer total is now: #{total(dealer_cards)}"
    display_result(dealer_cards, player_cards)
    play_again? ? next : break
  else
    prompt "Dealer stays at #{total(dealer_cards)}"
  end

  display_round_summary(dealer_cards, player_cards)
  display_result(dealer_cards, player_cards)

  case detect_result(dealer_cards, player_cards)
  when :player
    player_score += 1
  when :dealer
    dealer_score += 1
  end

  break unless play_again?
end

prompt "Thank you for playing."
