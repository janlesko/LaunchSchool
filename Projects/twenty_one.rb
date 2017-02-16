SUITS = %w(hearts diamonds clubs spades).freeze
VALUES = %w(2 3 4 5 6 7 8 9 10 jack queen king ace).freeze
WIN_SCORE = 21
DELR_LIMIT = (WIN_SCORE - 4)
WIN_ROUNDS = 5

def prompt(msg)
  puts "=> #{msg}"
end

def clear_screen
  system('clear') || system('cls')
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def draw_card(from_deck, to_whom)
  to_whom << from_deck.pop
end

def card_values(card)
  if card == 'ace'
    11
  elsif card.to_i.zero?
    10
  else
    card.to_i
  end
end

def calculate_total(deck)
  cards = deck.map { |card| card[1] }

  total = 0
  cards.each do |card|
    total += card_values(card)
  end

  cards.count('ace').times do
    total -= 10 if total > WIN_SCORE
  end

  total
end

def busted?(deck)
  calculate_total(deck) > WIN_SCORE
end

def initial_round(player_deck, dealer_deck, deck)
  2.times do
    draw_card(deck, player_deck)
    draw_card(deck, dealer_deck)
  end
end

def hit_or_stay
  answer = nil
  loop do
    prompt "Would you like to (h)it or (s)tay?"
    answer = gets.chomp.downcase
    break if %w(h s).include?(answer)
    prompt "Sorry, please enter 'h' or 's'."
  end
  answer
end

def determine_result(player_deck, dealer_deck)
  player_total = calculate_total(player_deck)
  dealer_total = calculate_total(dealer_deck)

  if player_total > WIN_SCORE
    :player_busted
  elsif dealer_total > WIN_SCORE
    :dealer_busted
  elsif player_total > dealer_total
    :player
  elsif player_total < dealer_total
    :dealer
  else
    :tie
  end
end

def display_result(player_deck, dealer_deck)
  result = determine_result(player_deck, dealer_deck)

  case result
  when :tie then prompt "It's a tie!"
  when :player then prompt "You won!"
  when :dealer then prompt "Dealer won!"
  when :player_busted then prompt "You busted. Dealer won!"
  when :dealer_busted then prompt "Dealer busted. You won!"
  end
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

def display_cards_and_total_initial(player_deck, dealer_deck)
  prompt "Your cards are: #{format_card_message(player_deck).join}"
  prompt "Your total value is: #{calculate_total(player_deck)}"
  puts ""
  prompt "Dealer's cards are: #{format_card_message(dealer_deck).first}and  ?"
end

def display_cards_and_total_player(player_deck)
  puts ""
  prompt "Your cards are: #{format_card_message(player_deck).join}"
  prompt "Your total value is: #{calculate_total(player_deck)}"
  puts ""
end

def display_cards_and_total_dealer(dealer_deck)
  puts ""
  prompt "Dealer's cards are: #{format_card_message(dealer_deck).join}"
  prompt "Dealer's total value is: #{calculate_total(dealer_deck)}"
  puts ""
end

def format_card_message(deck)
  output = []
  symbols = { 'hearts' => '♥', 'clubs' => '♣',
              'spades' => '♠', 'diamonds' => '♦' }
  deck.each do |card|
    output << "#{symbols[card[0]]} #{card[1]}  "
  end
  output
end

def display_game_over(player_score, dealer_score)
  winner = player_score > dealer_score ? 'You' : 'Dealer'
  puts ""
  prompt "Your score is: #{player_score} / Dealer's score is: #{dealer_score}"
  prompt "Game over. #{winner} won!"
  puts ""
end

player_score = 0
dealer_score = 0

loop do
  clear_screen
  deck = initialize_deck

  player_deck = []
  dealer_deck = []

  prompt "First to #{WIN_ROUNDS} wins."
  prompt "Your score is: #{player_score} / Dealer score is: #{dealer_score}"
  puts ""
  initial_round(player_deck, dealer_deck, deck)
  display_cards_and_total_initial(player_deck, dealer_deck)

  loop do
    loop do
      break if busted?(player_deck) || hit_or_stay == 's'
      prompt "You hit!"
      draw_card(deck, player_deck)
      display_cards_and_total_player(player_deck)
    end

    break if busted?(player_deck)

    prompt "You chose to stay."
    prompt "Dealer's turn..."

    loop do
      display_cards_and_total_dealer(dealer_deck)
      break if calculate_total(dealer_deck) > DELR_LIMIT || busted?(dealer_deck)
      prompt "Dealer hits!"
      draw_card(deck, dealer_deck)
    end

    break if busted?(dealer_deck)

    prompt "Dealer chose to stay."
    break
  end

  display_result(player_deck, dealer_deck)

  case determine_result(player_deck, dealer_deck)
  when :player, :dealer_busted
    player_score += 1
  when :dealer, :player_busted
    dealer_score += 1
  end

  if player_score == 5 || dealer_score == 5
    display_game_over(player_score, dealer_score)
    if play_again?
      player_score = 0
      dealer_score = 0
    else
      break
    end
  else
    prompt "Your score is: #{player_score} / Dealer score is: #{dealer_score}"
    prompt "Press enter to continue"
    gets
  end
end

prompt "Thank you for playing."
