module Displayable
  def clear
    system('clear') || system('cls')
  end

  def joinor(arr, delimiter=', ', word='or')
    joinor_arr = arr.dup

    joinor_arr[-1] = "#{word} #{joinor_arr.last}" if joinor_arr.size > 1

    joinor_arr.size > 2 ? joinor_arr.join(delimiter) : joinor_arr.join(' ')
  end

  def display_welcome_message(game)
    puts "Welcome to #{game}!"
    puts ""
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ""
  end

  def display_goodbye_message(game)
    puts "Thanks for playing #{game}! Goodbye!"
  end
end

module Choosable
  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Sorry, must be y or n."
    end
    answer == 'y'
  end
end

class Participant
  attr_accessor :busted
  attr_reader :staying, :hand

  def initialize
    reset
  end

  def hit(deck)
    @hand << deck.deal_one_card
  end

  def stay
    @staying = true
  end

  def busted?
    @busted = true if total > Game::WINNING_TOTAL
  end

  def total
    total = hand.inject(0) { |sum, card| sum + card.value }

    number_of_aces = hand.count { |card| card.name == 'Ace' }

    number_of_aces.times { total -= 10 if total > Game::WINNING_TOTAL }

    total
  end

  def reset
    @hand = []
    @staying = false
    @busted = false
  end
end

class Card
  attr_accessor :name, :value

  def initialize(name)
    @name = name
    @value = assign_value
  end

  def to_s
    @name
  end

  private

  def assign_value
    case @name
    when @name.to_i.to_s then @name.to_i
    when 'Ace'           then 11
    else                      10
    end
  end
end

class Deck
  CARDS = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace)

  attr_accessor :deck

  def initialize
    @deck = []
    build_deck
  end

  def deal_one_card
    build_deck if deck.empty?
    deck.shift
  end

  private

  def build_deck
    CARDS.each do |card|
      4.times do
        deck << Card.new(card)
      end
    end
    deck.shuffle!
  end
end

class Game
  include Displayable, Choosable

  WINNING_TOTAL = 21
  INITIAL_CARDS = 2
  DEALER_STAY_VALUE = 17

  attr_accessor :deck

  def initialize
    @deck = Deck.new
    @player = Participant.new
    @dealer = Participant.new
  end

  def start
    clear
    display_welcome_message('Twenty-One')

    loop do
      gameplay
      show_result
      break unless play_again?
      clear
      reset_hands
      display_play_again_message
    end

    display_goodbye_message('Twenty-One')
  end

  private

  def gameplay
    deal_deck
    display_deck
    player_turn
    return if @player.busted
    dealer_turn
  end

  def deal_deck
    INITIAL_CARDS.times { @player.hand << @deck.deal_one_card }
    INITIAL_CARDS.times { @dealer.hand << @deck.deal_one_card }
  end

  def display_deck
    puts "Dealer has: #{@dealer.hand[0]} and unknown card."
    puts "You have: #{joinor(@player.hand, ', ', 'and')}."
    puts ""
    puts "Your current total: #{@player.total}."
    puts ""
  end

  def player_turn
    loop do
      choice = player_hit_or_stay

      case choice[0]
      when 'h' then @player.hit(deck)
      when 's' then @player.stay
      end

      break if @player.staying || @player.busted?
      clear
      display_deck
    end
  end

  def player_hit_or_stay
    answer = nil
    loop do
      puts "(h)it or (s)tay?"
      answer = gets.chomp.downcase
      break if ['h', 's'].include?(answer[0])
      puts "Sorry, not a valid choice."
    end
    answer
  end

  def dealer_turn
    until @dealer.total >= DEALER_STAY_VALUE
      @dealer.hit(deck)
    end

    if @dealer.total > WINNING_TOTAL
      @dealer.busted = true
    else
      @dealer.stay
    end
  end

  def display_final_deck
    clear
    puts "Dealer has: #{joinor(@dealer.hand, ', ', 'and')}."
    puts "You have: #{joinor(@player.hand, ', ', 'and')}."
    puts ""
    puts "Dealer total: #{@dealer.total}. Your total: #{@player.total}"
    puts ""
  end

  def show_result
    display_final_deck
    if @player.busted
      puts "You busted! Dealer won!"
    elsif @dealer.busted
      puts "Dealer busted! You won!"
    elsif @player.total > @dealer.total
      puts "You won!"
    elsif @player.total < @dealer.total
      puts "Dealer won!"
    else
      puts "It's a draw!"
    end
    puts ""
  end

  def reset_hands
    @player.reset
    @dealer.reset
  end
end

Game.new.start