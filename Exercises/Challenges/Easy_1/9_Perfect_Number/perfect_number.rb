module PerfectNumber
  def self.classify(number)
    raise RuntimeError if number < 0
    if sum_of_divisors(number) == number
      'perfect'
    elsif sum_of_divisors(number) > number
      'abundant'
    else
      'deficient'
    end
  end

  def self.sum_of_divisors(number)
    (1...number).select { |divisor| (number % divisor).zero? }.inject(:+)
  end
end
