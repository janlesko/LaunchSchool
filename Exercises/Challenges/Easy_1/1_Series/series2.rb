class Series
  def initialize(digits)
    @digits = digits
  end
  
  def slices(size)
    raise ArgumentError if size > @digits.size
    @digits.chars.map(&:to_i).each_cons(size).to_a
  end
end