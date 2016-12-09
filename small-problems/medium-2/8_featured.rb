# def featured(start)
#   fea = start + 1
#   loop do
#     break if ((fea % 7 == 0) && fea.odd? && (fea.to_s.chars.uniq.join.to_i == fea))
#     fea += 1
#   end
#   p fea
# end

def featured(num)
  num = num + 1
  num += 1 until num.odd? && num % 7 == 0

  loop do
    return num if num.to_s.chars.uniq.join.to_i == num
    num += 14
    break if num > 9876543210
  end
  "There is no possible number that fulfills those requirements"
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

# featured(9_999_999_999) # -> There is no possible number that fulfills those requirements