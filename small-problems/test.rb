def swapcase(string)
  string.chars.map { |char| char == char.downcase ? char.upcase : char.downcase}.join
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'