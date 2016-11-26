SUITS = ['H', 'D', 'S', 'C'].freeze
VALUES = %w(2 3 4 5 6 7 8 9 10 J Q K A).freeze
WIN_NUM = 21
DEALER_GOAL = 17

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def total(cards)
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    sum += 11 if value == 'A'
    sum += 10 if %w(J Q K).include?(value)
    sum += value.to_i unless value.to_i.zero?
  end

  values.select { |value| value == 'A' }.count.times do
    sum -= 10 if sum > WIN_NUM
  end

  sum
end

def busted?(card_total)
  card_total > WIN_NUM
end

def detect_result(dealer_total, player_total)
  return :player_busted if player_total > WIN_NUM
  return :dealer_busted if dealer_total > WIN_NUM
  return :player if player_total > dealer_total
  return :dealer if dealer_total > player_total
  :tie
end

def tally(result, score)
  case result
  when :player_busted, :dealer
    score[:dealer] += 1
  when :dealer_busted, :player
    score[:player] += 1
  end
end

def display_score(score)
  prompt "Player: #{score[:player]} -- Dealer: #{score[:dealer]}"
  next_round
end

def next_round
  prompt "Press any key to continue."
  gets
end

def display_results(dealer_total, player_total)
  result = detect_result(dealer_total, player_total)

  case result
  when :player_busted
    prompt "You busted! Dealer wins!"
  when :dealer_busted
    prompt "Dealer busted! You win!"
  when :player
    prompt "You win!"
  when :dealer
    prompt "Dealer wins!"
  when :tie
    prompt "It's a tie!"
  end
end

def play_again?
  loop do
    puts "-------------"
    prompt "Do you want to play again? (y/n)"
    answer = gets.chomp.downcase.strip
    break if ['y', 'yes'].include?(answer)
    return false if ['n', 'no'].include?(answer)
    prompt "Sorry, you must enter either 'y' or 'n'"
  end
  true
end

def display_initial_hands(dealer_cards, player_cards, player_total)
  prompt "Dealer has #{dealer_cards[0]} and ?"
  prompt "You have: #{player_cards[0]} and #{player_cards[1]}, \
for a total of #{player_total}."
end

def hit(hand, deck)
  hand << deck.pop
end

def deal_cards(player_cards, dealer_cards, deck)
  2.times do
    hit(player_cards, deck)
    hit(dealer_cards, deck)
  end
end

def display_hand_after_hit(player_cards, player_total)
  prompt "You chose to hit!"
  prompt "Your cards are now: #{player_cards}"
  prompt "Your total is now: #{player_total}"
end

def hit_or_stay
  player_turn = nil
  loop do
    prompt "Would you like to (h)it or (s)tay?"
    player_turn = gets.chomp.downcase.strip
    break if ['h', 's'].include?(player_turn)
    prompt "Sorry, must enter 'h' or 's'."
  end
  player_turn
end

def display_hands(p_cards, d_cards, p_total, d_total)
  puts "================"
  prompt "Dealer total: #{d_total} with #{d_cards}"
  prompt "Player total: #{p_total} with #{p_cards}"
  puts "================"
end

def winner?(score)
  score.values.include?(5)
end

def determine_winner(score)
  winner = "Player" if score[:player] == 5
  winner = "Dealer" if score[:dealer] == 5
  winner
end

def display_winner(score)
  puts "========================="
  puts "*************************"
  puts " "
  puts "#{determine_winner(score)} Wins!"
  puts " "
  puts "*************************"
  puts "========================="
end

system 'clear'
prompt "Welcome to Twenty-One!"
sleep 1.5

loop do
  score = { player: 0, dealer: 0 }
  loop do
    system 'clear'
    deck = initialize_deck
    player_cards = []
    dealer_cards = []

    deal_cards(player_cards, dealer_cards, deck)
    player_total = total(player_cards)
    dealer_total = total(dealer_cards)
    display_initial_hands(dealer_cards, player_cards, player_total)

    loop do
      player_turn = hit_or_stay
      if player_turn == 'h'
        hit(player_cards, deck)
        player_total = total(player_cards)
        display_hand_after_hit(player_cards, player_total)
      end

      break if player_turn == 's' || busted?(player_total)
    end

    if busted?(player_total)
      tally(detect_result(dealer_total, player_total), score)
      display_hands(player_cards, dealer_cards, player_total, dealer_total)
      display_results(dealer_total, player_total)
      display_score(score)
      winner?(score) ? break : next
    else
      prompt "You stayed at #{player_total}"
    end

    prompt "Dealer turn..."

    loop do
      break if busted?(dealer_total) || dealer_total >= DEALER_GOAL

      prompt "Dealer hits!"
      hit(dealer_cards, deck)
      dealer_total = total(dealer_cards)
      prompt "Dealer's cards are now: #{dealer_cards}"
    end

    if busted?(dealer_total)
      tally(detect_result(dealer_total, player_total), score)
      prompt "Dealer total is now: #{dealer_total}"
      display_results(dealer_total, player_total)
      display_score(score)
      winner?(score) ? break : next
    else
      prompt "Dealer stays at #{dealer_total}"
    end

    display_hands(player_cards, dealer_cards, player_total, dealer_total)
    tally(detect_result(dealer_total, player_total), score)
    display_results(dealer_total, player_total)
    display_score(score)

    winner?(score) ? break : next
  end

  display_winner(score)
  break unless play_again?
end
system 'clear'
prompt "Thank you for playing Twenty-One! Good bye!"