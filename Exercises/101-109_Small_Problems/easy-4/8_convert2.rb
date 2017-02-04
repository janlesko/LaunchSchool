DIGITS = { '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, 
           '6' => 6, '7' => 7, '8' => 8, '9' => 9, '0' => 0 }

def string_to_integer(string)
  result = 0
  string.chars.each { |char| result = result * 10 + DIGITS[char] }
  result
end

# def string_to_signed_integer(string)
#   if string[0] == '-'
#     return string_to_integer(string.delete '-') * (-1)
#   elsif string[0] == '+'
#     return string_to_integer(string.delete '+')
#   else
#     string_to_integer(string)
#   end
# end

# def string_to_signed_integer(string)
#   case string[0]
#   when '-' then -string_to_integer(string[1..-1])
#   when '+' then string_to_integer(string[1..-1])
#   else          string_to_integer(string)
#   end
# end

def string_to_signed_integer(string)
  integer = string_to_integer(string.delete('+-'))
  string[0] == '-' ? -integer : integer
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100