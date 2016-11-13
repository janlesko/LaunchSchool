
CARD_SUIT = %W(H D S C)
CARD_VALUE = %w(2 3 4 5 6 7 8 9 10 J Q K A)

def initialize_deck
  new_deck = []
  CARD_SUIT.each do |suit|
    CARD_VALUE.each do |value|
      new_deck << [suit, value]
    end
  end
  new_deck
end

def calculate_total(hand)
  total = 0
  hand.each do |card|
    if card[1] == 'J' || card[1] == 'Q' || card[1] == 'K'
      total += 10
    else 
      total += card[1].to_i
    end
    if card[1] == 'A'
      if total < 12
        total += 10
      else
        total +=1
      end
    end
  end
  total
end

def busted?(hand)
  calculate_total(hand) > 21 ? true : false
end

def determine_winner(player, dealer)
  if calculate_total(player) > calculate_total(dealer)
    return "Player"
  else
    return "Dealer"
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

  deck = initialize_deck

  player_deck = []
  dealer_deck = []

  dealer_deck << deck.sample
  deck.delete(dealer_deck.last)
  dealer_deck << deck.sample
  deck.delete(dealer_deck.last)

  player_deck << deck.sample
  deck.delete(player_deck.last)

  loop do
  answer = nil
  loop do
    player_deck << deck.sample
    deck.delete(player_deck.last)

    p player_deck
    p calculate_total(player_deck)
    p dealer_deck[0]

    break if busted?(player_deck)
    puts 'hit or stay?'
    answer = gets.chomp
    break if answer == 'stay'
  end

  puts "You chose to stay" if answer == 'stay'
  puts "You are busted!" if busted?(player_deck)

  loop do
    if calculate_total(dealer_deck) < 17
      dealer_deck << deck.sample
      deck.delete(dealer_deck.last)
    else
      break
    end
  end

  if !busted?(dealer_deck)
    puts "Dealer chose to stay"
  else
    puts "Dealer is busted! You won!"
  end

  p dealer_deck
  p calculate_total(player_deck)

  break if busted?(dealer_deck) || busted?(player_deck)

  puts "The winner is #{determine_winner(player_deck, dealer_deck)}"
  break

  end

  if busted?(dealer_deck)
    puts "You won the game."
  elsif busted?(player_deck)
    puts "Dealer won the game."
  end

  break unless play_again?

end

puts 'Thank you for playing.'