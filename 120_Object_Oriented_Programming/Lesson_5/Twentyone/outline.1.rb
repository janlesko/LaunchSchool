require 'pry'

# Twenty-One is a card game consisting of a dealer and a player, where the 
# participants try to get as close to 21 as possible without going over.

# Here is an overview of the game:
# - Both participants are initially dealt 2 cards from a 52-card deck.
# - The player takes the first turn, and can "hit" or "stay".
# - If the player busts, he loses. If he stays, it's the dealer's turn.
# - The dealer must hit until his cards add up to at least 17.
# - If he busts, the player wins. If both player and dealer stays, then the 
#   highest total wins.
# - If both totals are equal, then it's a tie, and nobody wins.

# nouns and verbs:

# nouns: deck, cards, player
# verbs: draw, hit, stay

# organize:

# deck
# cards
# player
#   draw
#   hit
#   stay
  
class Deck
  attr_accessor :deck
  
  def initialize
    @deck = Card.new.all_cards.shuffle
  end
  
  def deal
    self.deck.pop
  end
end

class Card
  SUITS = %w(clubs diamonds hearts spades)
  VALUES = %w(2 3 4 5 6 7 8 9 10 jack queen king ace)
  SYMBOLS = { 'hearts' => '♥', 'clubs' => '♣',
              'spades' => '♠', 'diamonds' => '♦' }
  
  attr_reader :all_cards
  
  def initialize
    @all_cards = SUITS.product(VALUES)
  end
end
  
class Participant
  attr_accessor :cards, :deck
  
  def initialize
    @cards = []
    @deck = Deck.new
  end
  
  def hits
    puts "#{self.class} hits!"
    cards << deck.deal
  end
  
  def stays(stay=false)
    puts "#{self.class} stays!"
    binding.pry
    stay
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
    (values.count("ace")).times { total_value -= 10 if total_value > 21 }
    total_value
  end
end
class Player < Participant
  def choice
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

end
  
class Twentyone
  attr_reader :player, :dealer
  
  def initialize
    @player = Player.new
    @dealer = Dealer.new
  end
  
  def play
    loop do
      display_welcome_message
      deal_cards
      display_initial_cards_and_total
      loop do 
        player_moves
        break if player.busted? || player.stays
        display_cards_and_total
      end
      loop do
        dealer_moves
        break if dealer.busted? || dealer.stays
        display_cards_and_total
      end
      determine_winner
    end
    display_goodbye_message
  end
  
  def display_cards_and_total
    puts "Player's cards are: #{format_card_message(player.cards).join}"
    puts "Their total value is: #{player.total}"
    puts ""
  end
  
  def display_initial_cards_and_total
    puts "Player's cards are: #{format_card_message(player.cards).join}"
    puts "Their total value is: #{player.total}"
    puts ""
    puts "Dealer cards are: #{format_card_message(dealer.cards).first}and ?"
    puts ""
  end
  
  def display_welcome_message
    puts "Welcome to Twenty-One Game!"
    puts ""
  end
  
  def display_goodbye_message
    puts "Thank you for playing. Goodbye."
  end
  
  def format_card_message(deck)
  output = []
  deck.each do |card|
    output << "#{Card::SYMBOLS[card[0]]} #{card[1]}  "
  end
  output
  end
  
  def deal_cards
    player.hits
    dealer.hits
    player.hits
    dealer.hits
  end
    
  def player_moves
    case player.choice
    when "h" then player.hits
    when "s" then player.stays(true)
    end
  end  
  
  def dealer_moves
    dealer.total < 17 ? dealer.hits : dealer.stays(true)
  end
    
end
  
Twentyone.new.play