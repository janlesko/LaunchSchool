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
  attr_accessor :deck

  def initialize
    @deck = Card.new.all_cards.shuffle
  end

  def deal_one
    deck.pop
  end
end

class Participant
  attr_accessor :cards

  attr_reader :total

  def initialize
    @cards = []
  end

  def draw_card(new_card)
    cards << new_card
  end

  def busted?
    total > 21
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
    values.count("ace").times { total_value -= 10 if total_value > 21 }
    total_value
  end

  def show_hand
    puts "#{self.class}'s cards are: #{cards.join(' ')}"
    puts "Their total value is: #{total}"
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
    puts "#{self.class}'s cards are: #{cards[0].join(' ')} and ?"
    puts ""
  end
end

class Twentyone
  attr_reader :player, :dealer, :deck

  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def play
    display_welcome_message
    loop do
      deal_cards
      display_initial_hands
      player_moves
      dealer_moves
      display_hands
      display_result
      play_again? ? reset : break
    end
    display_goodbye_message
  end

  def reset
    player.cards = []
    dealer.cards = []
    clear
  end

  def deal_cards
    2.times do
      player.draw_card(deck.deal_one)
      dealer.draw_card(deck.deal_one)
    end
  end

  def display_initial_hands
    player.show_hand
    dealer.show_initial_hand
  end

  def display_hands
    clear
    player.show_hand
    dealer.show_hand
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
      break if player.busted? || dealer.busted? || dealer.total > 17
      dealer.draw_card(deck.deal_one)
      puts "Dealer hits!"
      display_hands
    end
  end

  def display_result
    if player.busted?
      puts "Player busted!"
    elsif dealer.busted?
      puts "Dealer busted!"
    elsif player.total > dealer.total
      puts "Player wins!"
    elsif player.total < dealer.total
      puts "Dealer wins!"
    else
      puts "It's a tie!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if %w(y yes n no).include?(answer)
      puts "Not a valid choice."
    end
    %w(y yes).include?(answer)
  end

  def display_welcome_message
    clear
    puts "Welcome to Twenty-One Game!"
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
