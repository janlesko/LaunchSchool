require 'pry'
class Sieve
  def initialize(size)
    @numbers = 2.upto(size).to_a
  end
  
  # def primes
  #   selected = []
  #   @numbers.each do |num|
  #     @numbers.each do |num1|
  #       next if num == num1
  #       next if selected.include?(num1)
  #       selected << num1 if (num1 % num).zero?
  #     end
  #   end
  #   @numbers - selected
  # end
  
  def primes
    @numbers.each do |prime|
      binding.pry
      @numbers.reject! do |num|
        (num != prime) && (num % prime == 0)
      end
    end
    @numbers
  end
end

sieve = Sieve.new(20)

p sieve.primes
