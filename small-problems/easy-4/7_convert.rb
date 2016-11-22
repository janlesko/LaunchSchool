DIGITS = { '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, 
           '6' => 6, '7' => 7, '8' => 8, '9' => 9, '0' => 0 }

def string_to_integer(string)
  result = 0
  string.chars.each { |char| result = result * 10 + DIGITS[char] }
  result
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570

HEXADECIMAL = { '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, 
                '6' => 6, '7' => 7, '8' => 8, '9' => 9, '0' => 0,
                'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13,
                'E' => 14, 'F' => 15 }

def hexadecimal_to_integer(hex)
  result = 0
  hex.upcase.chars.reverse.each_with_index { |char, index| result = result + HEXADECIMAL[char] * 16 ** index }
  result
end

p hexadecimal_to_integer('4D9f') == 19871

#(4×16×16×16)+(13×16×16)+(9×16)+(15)
