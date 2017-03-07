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

deck = Deck.new

drawn = []
52.times { drawn << deck.draw }
p drawn
p drawn.count { |card| card.rank == 5 } == 4
p drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
p drawn != drawn2 # Almost always.