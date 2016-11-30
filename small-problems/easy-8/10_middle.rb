def center_of(string)
  result = ''
  middle = string.size / 2
  if string.size.even?
    result << string[middle - 1]
    result << string[middle]
  else
    result << string[middle]
  end
  p result
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'