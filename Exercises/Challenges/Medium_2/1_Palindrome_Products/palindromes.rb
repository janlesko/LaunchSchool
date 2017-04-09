class Palindromes
  def initialize(min_factor: 1, max_factor: 1)
    @range = (min_factor..max_factor).to_a
    @palindromes = Hash.new([])
    #@palindormes = Hash.new { |hash, key| hash[key] = [] }
  end

  def generate
    @range.repeated_combination(2).to_a.each do |x, y|
      @palindromes[x * y] += [[x, y]] if palindrome?(x * y)
      #@palindromes[x * y] << [x, y] if palindrome?(x * y)
    end
  end

  def largest
    Struct.new(:value, :factors).new(largest_product, @palindromes[largest_product])
  end

  def smallest
    Struct.new(:value, :factors).new(smallest_product, @palindromes[smallest_product])
  end

  def smallest_product
    @palindromes.keys.min  
  end

  def largest_product
    @palindromes.keys.max
  end

  def palindrome?(number)
    number.to_s == number.to_s.reverse
  end
end
