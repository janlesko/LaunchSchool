class Game
  def initialize
    @rolls = Hash.new([])
  end

  def roll(pins_down)
    raise RuntimeError, 'Pins must have a value from 0 to 10' unless 
      pins_down.between?(0, 10)
    raise RuntimeError, 'Should not be able to roll after game is over' if 
      game_over? 
    round = @rolls.keys.count + 1
    if @rolls[round - 1].inject(:+) == 10 || @rolls[round - 1].count == 2
      @rolls[round] += [pins_down]
    elsif round == 1
      @rolls[round] += [pins_down]
    else
      @rolls[round - 1] += [pins_down]
      raise RuntimeError, 'Pin count exceeds pins on the lane' if
        @rolls[round - 1].inject(:+) > 10
    end
  end

  def score
    raise RuntimeError, 'Score cannot be taken until the end of the game' unless 
      @rolls[10].inject(:+) == 10 || @rolls[10].count == 2
    raise RuntimeError, 'Game is not yet over, cannot score!' if 
      @rolls[10].inject(:+) == 10 && @rolls[11].count == 0
    result = 0
    @rolls.each do |round, pins_down|
      break if round == 11
      if pins_down == [10]
        result += 10 + next_two_rounds(round)
      elsif pins_down.inject(:+) == 10
        result += 10 + @rolls[round + 1].first
      else
        result += pins_down.inject(:+)
      end
    end
    result
  end

  def next_two_rounds(round)
    if @rolls[round + 1].count == 2
      @rolls[round + 1].inject(:+)
    else
      @rolls[round + 1].first + @rolls[round + 2].first
    end
  end
  
  def game_over?
    @rolls[10].count == 2 && @rolls[10].inject(:+) != 10
  end
end

