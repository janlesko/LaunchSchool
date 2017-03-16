class Series
  def initialize(num_string)
    @result = []
    @digits = num_string.chars.map(&:to_i)
  end
  
  def slices(size)
    raise ArgumentError if @digits.size < size
    
    # index = 0
    # loop do
    #   @result << @digits[index, size]
    #   index += 1
    #   break if (index + size) > @digits.size
    # end
    
    0.upto(@digits.size - size) do |index|
      @result << @digits[index, size]
    end
    
    @result
  end
end