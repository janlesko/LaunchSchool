class Prime
  def self.nth(number)
    raise ArgumentError if number.zero?
    primes = [2]
    candidate = 3
    until primes.size == number

      primes << candidate if is_prime?(candidate)
      candidate += 2
    end
    primes.last
  end

  def self.is_prime?(candidate)
    (2..Math.sqrt(candidate)).each do |divisor|
      return false if candidate % divisor == 0
    end
    true
  end
end
