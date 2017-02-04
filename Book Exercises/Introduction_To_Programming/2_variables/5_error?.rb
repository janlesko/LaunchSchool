x = 0
3.times do
  x += 1
end
puts x

y = 0
3.times do
  y += 1
  z = y
end
puts z

#variable z is not available outside of the do/end block