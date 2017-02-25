class Card
  FACES = %w(2 3 4 5 6 7 8 9 10 jack queen king ace)
  SUITS = { 'hearts' => '♥', 'clubs' => '♣',
            'spades' => '♠', 'diamonds' => '♦' }

  attr_reader :all_cards

  def initialize
    @all_cards = SUITS.values.product(FACES)
  end
end

class Deck
  TOO_FEW_CARDS = 10

  attr_accessor :deck

  def initialize
    @deck = new_deck.shuffle
  end

  def new_deck
    Card.new.all_cards
  end

  def almost_empty?
    deck.size < TOO_FEW_CARDS
  end

  def fill
    @deck += new_deck.shuffle
  end

  def deal_one
    deck.pop
  end
end

class Participant
  attr_accessor :cards, :score

  attr_reader :total

  def initialize
    @cards = []
    @score = 0
  end

  def draw_card(new_card)
    cards << new_card
  end

  def busted?
    total > Twentyone::WIN_SCORE
  end

  def total
    values = cards.map { |card| card[1] }
    total_value = 0
    values.each do |value|
      total_value += if value == 'ace'
                       11
                     elsif value.to_i.zero?
                       10
                     else
                       value.to_i
                     end
    end
    adjust_for_aces(total_value, values)
  end

  def adjust_for_aces(total_value, values)
    values.count("ace").times do
      total_value -= 10 if total_value > Twentyone::WIN_SCORE
    end
    total_value
  end

  def show_hand
    puts "#{self.class}'s cards: #{cards.join(' ')}"
    puts "Total value: #{total}"
    puts ""
  end
end

class Player < Participant
  def hit_or_stay
    answer = nil
    loop do
      puts "Would you like to (h)it or (s)tay? (h/s)"
      answer = gets.chomp.downcase
      break if %w(h s).include?(answer)
      puts "Not a valid choice."
    end
    answer
  end
end

class Dealer < Participant
  def show_initial_hand
    puts "#{self.class}'s cards: #{cards[0].join(' ')} and ?"
    puts ""
  end
end

class Twentyone
  WIN_SCORE = 21
  DEALER_LIMIT = 17
  WIN_ROUNDS = 5

  attr_reader :player, :dealer, :deck

  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def play
    display_welcome_message
    loop do
      start_round
      display_game_result
      play_again? ? reset_game : break
    end
    display_goodbye_message
  end

  def start_round
    loop do
      deal_cards
      display_initial_hands
      player_moves
      dealer_moves
      calculate_score
      display_round_result
      break if player.score == WIN_ROUNDS || dealer.score == WIN_ROUNDS
      reset_round
    end
  end

  def deal_cards
    2.times do
      player.draw_card(deck.deal_one)
      dealer.draw_card(deck.deal_one)
    end
  end

  def player_moves
    loop do
      case player.hit_or_stay
      when "h" then player.draw_card(deck.deal_one)
      when "s" then break
      end
      clear
      display_initial_hands
      break if player.busted?
    end
  end

  def dealer_moves
    loop do
      display_hands
      break if player.busted? || dealer.busted?
      if dealer.total > DEALER_LIMIT
        puts "Dealer stays!"
        break
      else
        dealer.draw_card(deck.deal_one)
        puts "Dealer hits!"
        sleep(2)
      end
    end
  end

  def calculate_score
    player.score += 1 if player_won?
    dealer.score += 1 if dealer_won?
  end

  def reset_round
    puts "Press enter to continue"
    gets
    clear
    clear_hands
    deck.fill if deck.almost_empty?
  end

  def clear_hands
    player.cards = []
    dealer.cards = []
  end

  def reset_game
    clear
    initialize
  end

  def display_initial_hands
    display_score
    player.show_hand
    dealer.show_initial_hand
  end

  def display_hands
    clear
    display_score
    player.show_hand
    dealer.show_hand
  end

  def player_won?
    (player.total > dealer.total && !player.busted?) || dealer.busted?
  end

  def dealer_won?
    (player.total < dealer.total && !dealer.busted?) || player.busted?
  end

  def display_round_result
    display_busted
    if player_won?
      puts "Player wins!"
    elsif dealer_won?
      puts "Dealer wins!"
    else
      puts "It's a tie!"
    end
    puts ""
  end

  def display_game_result
    display_hands
    if player.score == WIN_ROUNDS
      puts "Player won the game!"
    else
      puts "Dealer won the game!"
    end
  end

  def display_busted
    if player.busted?
      puts "Player busted!"
    elsif dealer.busted?
      puts "Dealer busted!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts ""
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y yes n no).include?(answer)
      puts "Not a valid choice."
    end
    %w(y yes).include?(answer)
  end

  def display_score
    puts "Player's score: #{player.score} | | Dealer's score: #{dealer.score}"
    puts ""
  end

  def display_welcome_message
    clear
    puts "Welcome to Twenty-One Game!"
    puts ""
    puts "First to #{WIN_ROUNDS} wins."
    puts ""
  end

  def display_goodbye_message
    puts ""
    puts "Thank you for playing. Goodbye."
  end

  def clear
    system("clear") || system("cls")
  end
end

Twentyone.new.play
