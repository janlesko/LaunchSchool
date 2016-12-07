DIGITS = ('0'..'9').to_a

# def integer_to_string(number)
#   result = ''
#   loop do
#     number, remainder = number.divmod(10)
#     result.prepend(DIGITS[remainder])
#     break if number == 0
#   end
#   p result
# end

def integer_to_string(num)
  result = ''
  loop do
    result.prepend(DIGITS[num % 10])
    num /= 10
    break if num == 0
  end
  p result
end


integer_to_string(4321) == '4321'
integer_to_string(0) == '0'
integer_to_string(5000) == '5000'