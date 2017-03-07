# def divisors(num)
#   result = []
#   1.upto(num) { |divisor| result << divisor if num % divisor == 0 }
#   result
# end

def divisors(num)
  result = 1.upto(num / 2).select { |div| num % div == 0 }
  result << num
  result
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891]