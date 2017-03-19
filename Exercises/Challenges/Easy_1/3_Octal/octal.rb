class Octal
  BASE = 8
  VALID_DIGITS = /[0-7]/
  
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

# class Octal
#   BASE = 8
#   INVALID_OCTAL = /\D|[8-9]/
  
#   def initialize(octal_number)
#     @octal_number = octal_number.to_s
#   end
  
#   def to_decimal
#     @octal_number =~ INVALID_OCTAL ? 0 : calculate
#   end
  
#   private
  
#   def calculate
#     decimal = 0
#     @octal_number.reverse.each_char.with_index do |char, index|
#       decimal += char.to_i * (BASE ** index)
#     end
#     decimal
#   end
# end

octal = Octal.new(17)
puts octal.to_decimal