def triangle(angle1, angle2, angle3)
  angles = [angle1, angle2, angle3].sort
  return :invalid if angles.include?(0) || angles.inject(:+) != 180
  if angles.last == 90
    :right
  elsif angles.last > 90
    :obtuse
  else
    :acute
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid