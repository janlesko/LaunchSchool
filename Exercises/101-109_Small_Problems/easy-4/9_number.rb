# DIGITS = { 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5', 
#            6 => '6', 7 => '7', 8 => '8', 9 => '9', 0 => '0' }

DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(number)
  string = ''
  loop do
    number, remainder = number.divmod(10)
    string.prepend(DIGITS[remainder])
    break if number == 0
  end
  p string
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'