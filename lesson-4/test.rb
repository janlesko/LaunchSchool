TITLE = <<-TWENTYONE.freeze
 ____  _  _  ____  __ _  ____  _  _       __   __ _  ____
(_  _)/ )( \\(  __)(  ( \\(_  _)( \\/ )___  /  \\ (  ( \\(  __)
  )(  \\ /\\ / ) _) /    /  )(   )  /(___)(  O )/    / ) _)
 (__) (_/\\_)(____)\\_)__) (__) (__/       \\__/ \\_)__)(____)
==========================================================
TWENTYONE

DECK = %w(2h 3h 4h 5h 6h 7h 8h 9h 10h Jh Qh Kh Ah
          2c 3c 4c 5c 6c 7c 8c 9c 10c Jc Qc Kc Ac
          2s 3s 4s 5s 6s 7s 8s 9s 10s Js Qs Ks As
          2d 3d 4d 5d 6d 7d 8d 9d 10d Jd Qd Kd Ad).freeze

SUIT = { h: '♥', c: '♣', s: '♠', d: '♦' }.freeze

# graphic for shown card
shown = []
shown[0] = '  ┌─────────┐'
shown[1] = '  │XY        │'
shown[2] = '  │         │'
shown[3] = '  │         │'
shown[4] = '  │    S    │'
shown[5] = '  │         │'
shown[6] = '  │         │'
shown[7] = '  │        XY│'
shown[8] = '  └─────────┘'

# graphic for hidden card
hidden = []
hidden[0] = '  ┌─────────┐'
hidden[1] = '  │░░░░░░░░░│'
hidden[2] = '  │░░░░░░░░░│'
hidden[3] = '  │░░░░░░░░░│'
hidden[4] = '  │░░░░░░░░░│'
hidden[5] = '  │░░░░░░░░░│'
hidden[6] = '  │░░░░░░░░░│'
hidden[7] = '  │░░░░░░░░░│'
hidden[8] = '  └─────────┘'

def clear
  system 'cls'   # windows
  system 'clear' # mac
end

def build_hidden_card(player, hidden)
  hidden.each_index { |idx| player[idx] = hidden[idx] }
end

def build_shown_card(player, card, shown)
  shown.each_with_index do |line, idx|
    face = line.tr_s('XY', card[0..-2])
    face = face.gsub('10 ', '10').gsub(' 10', '10')
    face.tr!('S', SUIT[card[-1, 1].to_sym].to_s)
    player[idx] = "#{player[idx]}#{face}"
  end
end

def build_card_display(player, hand, shown, hidden, hide = false)
  player.clear
  hand.each_with_index do |card, card_number|
    if hide && card_number.zero?
      build_hidden_card(player, hidden)
    else
      build_shown_card(player, card, shown)
    end
  end
end

def draw_table(dealer_hand, player_hand)
  clear
  puts "#{TITLE}\n"
  puts "  Dealer's Hand"
  dealer_hand.each { |line| puts line }
  puts "\n  Your Hand"
  player_hand.each { |line| puts line }
  puts
end

def calculate_hand_value(hand)
  hand_value = [0, 0]
  hand.each do |card|
    card = card[0..-2]
    card = card == 'A' ? 11 : card.to_i # letters evalutate to 0 when to_i
    card = card.zero? ? 10 : card # if card value is 0 then it is a face card
    hand_value[0] += card == 11 ? 1 : card
    hand_value[1] += hand_value[1] == 11 && card == 11 ? 1 : card # is AA?
  end
  hand_value.sort
end

def display_hand_value(hand_value)
  if hand_value[0] == hand_value[1]
    hand_value[0]
  elsif hand_value.max > 21
    hand_value.min
  else
    "#{hand_value[0]} or #{hand_value[1]}"
  end
end

def final_hand_value(hand)
  if hand[0] == hand[1] || hand[0] > 21 || hand[1] > 21
    hand[0]
  else
    hand.max
  end
end

def bust?(hand)
  hand > 21
end

def winner?(hand1, hand2)
  hand1 > hand2 && hand1 <= 21
end

def display_winner(player, dealer)
  dealer_total = final_hand_value(dealer)
  player_total = final_hand_value(player)
  puts "Dealer Hand: #{dealer_total}\nYour Hand: #{player_total}"
  if bust?(dealer_total) || winner?(player_total, dealer_total)
    puts 'You Win!'
  elsif bust?(player_total) || winner?(dealer_total, player_total)
    puts 'Dealer Wins!'
  else
    puts "It's a Tie!"
  end
end

def pause
  sleep 0.7
end

# initialize player values
player_hand = []
player_total = []
player_hand_display = []

# initialize dealer values
dealer_hand = []
dealer_total = []
dealer_hand_display = []

loop do
  # create and shuffle deck
  available_cards = DECK.dup.shuffle

  # deal cards
  dealer_hand = available_cards.pop(2)
  player_hand = available_cards.pop(2)

  # build graphics for dealers hand
  build_card_display(dealer_hand_display, dealer_hand, shown, hidden, true)

  # begin players play
  loop do
    # build graphics for player's hand
    build_card_display(player_hand_display, player_hand, shown, hidden)

    # display the table
    draw_table(dealer_hand_display, player_hand_display)

    # get player hand total
    player_total = calculate_hand_value(player_hand)

    # no need to draw any more cards if player has 21 or has busted
    break if player_total.min > 21 || player_total.max == 21

    puts "You have #{display_hand_value(player_total)} what is your move?"
    print '(S)tand or (H)it: '

    move = gets.chomp.downcase
    if move.start_with?('h')
      player_hand << available_cards.pop
      player_hand.flatten!
      pause
    end
    break if move.start_with?('s') # end loop if player stands
  end

  # begin dealers play
  loop do
    # uncover dealer's hole card on first iteration and then show new cards
    pause
    build_card_display(dealer_hand_display, dealer_hand, shown, hidden)
    draw_table(dealer_hand_display, player_hand_display)

    # calculate dealer hand
    dealer_total = calculate_hand_value(dealer_hand)

    # no need to draw if player has busted
    break if player_total.min > 21

    # end drawing if dealer has 17 or over
    break if dealer_total.min >= 17 || dealer_total.max >= 17

    # dealer draws another card
    dealer_hand << available_cards.pop
    dealer_hand.flatten!
  end

  # who won the game?
  display_winner(player_total, dealer_total)

  # play again?
  answer = ''
  loop do
    print 'Do you want to play again? (Y or N): '
    answer = gets.chomp.downcase
    break if answer == 'n' || answer == 'y'
  end
  break if answer == 'n'
  pause
end