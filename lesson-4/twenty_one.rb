SUITS = %w(hearts diamonds clubs spades).freeze
VALUES = %w(2 3 4 5 6 7 8 9 10 jack queen king ace).freeze
WIN_SCORE = 21
DEALER_LIMIT = (WIN_SCORE - 4)

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

def calculate_total(deck)
  total = 0

  deck.each do |card|
    total += 10 if card[1].to_i.zero?
    total += 11 if card[1] == 'ace'
    total += card[1].to_i
  end

  deck.select { |card| card == 'ace' }.count.times do
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

def display_cards_and_total(player_deck, dealer_deck, mode)
  case mode
  when 'player'
    prompt "Your cards are #{player_deck}"
    prompt "Your total value is: #{calculate_total(player_deck)}"
  when 'dealer'
    prompt "Dealer's cards are #{dealer_deck}"
    prompt "Dealer's total value is: #{calculate_total(dealer_deck)}"
  when 'initial'
    prompt "Your cards are #{player_deck}"
    prompt "Your total value is: #{calculate_total(player_deck)}"
    prompt "Dealer's cards are #{dealer_deck[1]} and ?"
  end
end

def diplay_summary(player_deck, dealer_deck)
  puts "============================SUMMARY============================"
  prompt "Your cards are #{player_deck}"
  prompt "Your total value is: #{calculate_total(player_deck)}"
  prompt "Dealer's cards are #{dealer_deck}"
  prompt "Dealer's total value is: #{calculate_total(dealer_deck)}"
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

loop do
  clear_screen
  deck = initialize_deck

  player_deck = []
  dealer_deck = []

  initial_round(player_deck, dealer_deck, deck)

  display_cards_and_total(player_deck, dealer_deck, 'initial')

  loop do
    loop do
      break if busted?(player_deck) || hit_or_stay == 's'
      prompt "You hit!"
      draw_card(deck, player_deck)
      display_cards_and_total(player_deck, dealer_deck, 'player')
    end

    break if busted?(player_deck)

    prompt "You chose to stay."
    prompt "Dealer's turn..."

    loop do
      break if calculate_total(dealer_deck) > 17 || busted?(dealer_deck)
      prompt "Dealer hits!"
      draw_card(deck, dealer_deck)
      display_cards_and_total(player_deck, dealer_deck, 'dealer')
    end

    break if busted?(dealer_deck)

    prompt "Dealer chose to stay."
    break
  end

  diplay_summary(player_deck, dealer_deck)
  display_result(player_deck, dealer_deck)

  break unless play_again?
end

prompt "Thank you for playing."
