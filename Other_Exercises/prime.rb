def find_primes(starts, ends)
  (starts..ends).select do |number|
    is_prime?(number)
  end
end

def is_prime?(number)
  (2..(number - 1)).each do |divisor|
    return false if number % divisor == 0
  end

  true
end


p find_primes(3, 10)
p find_primes(3, 20)