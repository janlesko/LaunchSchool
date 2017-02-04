# def triangle(side1, side2, side3)
#   ary = [side1, side2, side3]
#   sum = ary.inject(:+)
#   ary.each do |side|
#     return :invalid if side >= sum - side || side == 0
#     return :equilateral if sum / side == side
#     return :isosceles if ary.count(side) == 2
#   end
#   :scalene
# end

# def triangle(side1, side2, side3)
#   sides = [side1, side2, side3]
#   largest_side = sides.max

#   case
#   when 2 * largest_side > sides.inject(:+), sides.include?(0)
#     :invalid
#   when side1 == side2 && side2 == side3
#     :equilateral
#   when side1 == side2 || side1 == side3 || side2 == side3
#     :isosceles
#   else
#     :scalene
#   end
# end

def triangle(s1, s2, s3)
  tri = [s1, s2, s3].sort
  return :invalid if tri[0] + tri[1] <= tri[2] || tri.include?(0)
  sides = tri.uniq.count
  case sides
  when 1 then :equilateral
  when 2 then :isosceles
  when 3 then :scalene
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid