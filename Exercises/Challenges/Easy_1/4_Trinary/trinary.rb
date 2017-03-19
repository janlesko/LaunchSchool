class Trinary
  BASE = 3
  VALID_DIGITS = /[0-2]/
  
  def initialize(octal_number)
    @octal_number = octal_number.to_s.chars
  end
  
  def to_decimal
    return 0 unless @octal_number.all? { |digit| digit =~ VALID_DIGITS }
    @octal_number.reverse.map.with_index do |num, idx|
      num.to_i * (BASE ** idx)
    end.inject(:+)
  end
end