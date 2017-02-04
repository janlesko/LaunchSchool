# def max_rotation(num)
#   counter = num.to_s.size
#   while counter > 1
#     num = rotate_rightmost_digits(num, counter)
#     counter -= 1
#   end
#   num
# end

def max_rotation(num)
  size = num.to_s.size
  size.downto(2) do |n|
    num = rotate_rightmost_digits(num, n)
  end
  num
end

def rotate_rightmost_digits(number, n)
  all_digits = number.to_s.chars
  all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
  all_digits.join.to_i
end

def rotate_array(ary)
  ary[1..-1] + [ary[0]]
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845