def factorial(num)
  range = (1..num).to_a
  digits = get_factorial(range)
  result = addition(digits.to_s)
  result
end

def get_factorial(ary)
  inter_result = 1
  ary.each do |num|
    inter_result *= num
  end
  inter_result
end

def addition(digits_string)
  result = 0
  digits_string.chars do |char|
    result += char.to_i
  end
  result
end
  
# 1, range (1..num)
# 2, factorial
# 3, split factorial and sum individial digits

p factorial(12)
p factorial(20)
p factorial(100)
p factorial(6)
