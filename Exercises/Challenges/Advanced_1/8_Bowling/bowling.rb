require 'pry'

class Game
  def initialize
    @rolls = Hash.new([])
  end

  def roll(pins_down)
    round = @rolls.keys.count + 1
    #binding.pry
    if @rolls[round - 1].inject(:+) == 10 || @rolls[round - 1].count == 2
      @rolls[round] += [pins_down]
    elsif round == 1
      @rolls[round] += [pins_down]
    else
      @rolls[round - 1] += [pins_down]
    end
  end

  def score
    result = []
    @rolls.each do |round, pins_down|
      if pins_down == [10]
        result << 10 + next_two_rounds(round)
      elsif pins_down.inject(:+) == 10
        result << 10 + @rolls[round + 1].first
      else
        result << pins_down.inject(:+)
      end
    end
    p @rolls
    p result
    p result.inject(:+)
  end

  def next_two_rounds(round)
    if @rolls[round + 1].count == 2
      @rolls[round + 1].inject(:+)
    else
      @rolls[round + 1].first + @rolls[round + 2].first
    end
  end

end

# game = Game.new
# game.roll(10)
# game.roll(10)
# game.roll(10)
# game.roll(5)
# game.roll(3)

# game.rolls