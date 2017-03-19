class SumOfMultiples
  def initialize(*factors)
    @factors = factors
  end
  
  def self.to(limit)
    new(3, 5).to(limit)
  end
  
  def to(limit)
    (0...limit).select do |num|
      @factors.any? { |fac| num % fac == 0 }
    end.inject(:+)
  end
end

p SumOfMultiples.to(20)

p SumOfMultiples.new(7, 13, 17).to(20)

