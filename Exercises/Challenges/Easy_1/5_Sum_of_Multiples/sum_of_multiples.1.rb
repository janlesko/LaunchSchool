class SumOfMultiples
  def initialize(*dividors)
    @dividors = [*dividors]
  end
  
  def self.to(number)
    new(3, 5).to(number)
  end
  
  def to(number)
    (0...number).select { |num| @dividors.any? { |div| num % div == 0 } }
                .inject(:+)
  end
end

p SumOfMultiples.new(7, 13, 17).to(20)

p SumOfMultiples.to(10)
p SumOfMultiples.to(1)