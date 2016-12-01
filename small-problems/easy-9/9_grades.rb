# def get_grade(g1, g2, g3)
#   average = (g1 + g2 + g3) / 3
#   if average.between?(90, 100)
#     return "A"
#   elsif average.between?(80, 89)
#     return "B"
#   elsif average.between?(70, 79)
#     return "C"
#   elsif average.between?(60, 69)
#     return "D"
#   else
#     return "F"
#   end
# end

def get_grade(s1, s2, s3)
  result = (s1 + s2 + s3)/3

  case result
  when 90..100 then 'A'
  when 80..89  then 'B'
  when 70..79  then 'C'
  when 60..69  then 'D'
  else              'F'
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"