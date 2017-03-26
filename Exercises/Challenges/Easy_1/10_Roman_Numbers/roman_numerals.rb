# class Fixnum
#   NUMERALS = { 1000 => 'M', 900 => 'CM', 500 => 'D', 400 => 'CD', 100 => 'C',
#               90 => 'XC', 50 => 'L', 40 => 'XL', 10 => 'X', 9 => 'IX',
#               5 => 'V', 4 => 'IV', 1 => 'I' }
  
#   def to_roman
#     number = self
#     result = ''
#     until number.zero?
#       NUMERALS.each do |arabic, roman|
#         if arabic <= number
#           result += roman 
#           number -= arabic
#           break
#         end
#       end
#     end
#     result
#   end
# end

# p 27.to_roman

# class Fixnum
#   NUMERALS = { 1000 => 'M', 900 => 'CM', 500 => 'D', 400 => 'CD', 100 => 'C',
#               90 => 'XC', 50 => 'L', 40 => 'XL', 10 => 'X', 9 => 'IX',
#               5 => 'V', 4 => 'IV', 1 => 'I' }

#   def to_roman
#     number = self
#     result = ''
#     until number.zero?
#       NUMERALS.each do |arabic, roman|
#         roman_numerals_quantity = number / arabic
#         result += roman * roman_numerals_quantity
#         number -= arabic * roman_numerals_quantity
#       end
#     end
#     result
#   end
# end

class Fixnum
  NUMERALS = { 1000 => 'M', 900 => 'CM', 500 => 'D', 400 => 'CD', 100 => 'C',
               90 => 'XC', 50 => 'L', 40 => 'XL', 10 => 'X', 9 => 'IX',
               5 => 'V', 4 => 'IV', 1 => 'I' }

  def to_roman
    number = self
    return '' if number <= 0
    NUMERALS.each do |arabic, roman|
      return roman + (number - arabic).to_roman if number >= arabic
    end
  end
end

p 27.to_roman