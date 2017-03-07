class PokerHand
  attr_reader :hand
  
  def initialize(deck)
    @hand = []
    5.times { @hand << deck.draw }
  end

  def print
    puts @hand
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private
  
  def occurences
    result = Hash.new(0)
    @hand.map(&:rank).each { |ele| result[ele] += 1 }
    result
  end

  def royal_flush?
    flush? && @hand.map(&:value).inject(:+) == 60
  end

  def straight_flush?
    flush? && straight?
  end

  def four_of_a_kind?
    occurences.has_value?(4)
  end

  def full_house?
    occurences.has_value?(3) && occurences.has_value?(2)
  end

  def flush?
    @hand.map(&:suit).uniq.count == 1
  end

  # def straight?
  #   4.times do |index|
  #     values = @hand.map(&:value).sort
  #     return false if values[index + 1] - values[index] != 1
  #   end
  #   true
  # end
  
  def straight?
    return false if occurences.values.uniq.count > 1
    
    @hand.min.value == @hand.max.value - 4
  end

  def three_of_a_kind?
    occurences.has_value?(3)
  end

  def two_pair?
    occurences.values.count(2) == 2
  end

  def pair?
    occurences.has_value?(2)
  end
end

class Deck
  RANKS = (2..10).to_a + %w(Jack Queen King Ace).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze
  
  attr_reader :cards
  
  def initialize
    @cards = RANKS.product(SUITS).map { |rnk, st| Card.new(rnk, st) }.shuffle
  end
  
  def draw
    initialize if cards.empty?
    cards.pop
  end
end

class Card
  attr_reader :rank, :suit
  include Comparable
  
  VALUES = { "Jack" => 11, "Queen" => 12, "King" => 13, "Ace" => 14 }

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end
  
  def value
    VALUES.fetch(rank, rank)
  end
  
  def to_s
    "#{rank} of #{suit}"
  end
  
  def <=>(other_card)
    value <=> other_card.value
  end
end

# hand = PokerHand.new(Deck.new)
# hand.print

class Array
  alias_method :draw, :pop
end

# Test that we can identify each PokerHand type.
hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])

puts hand.evaluate == 'Royal flush'

hand = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight flush'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Four of a kind'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Full house'

hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])
puts hand.evaluate == 'Flush'

hand = PokerHand.new([
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
puts hand.evaluate == 'Three of a kind'

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Two pair'

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Pair'

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
puts hand.evaluate == 'High card'