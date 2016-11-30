def double_consonants(string)
  double = ('a'..'z').to_a - %w(a e i o u)
  result = ''
  string.each_char do |char|
    if double.include?(char.downcase)
      result << char * 2
    else
      result << char
    end
  end
  p result
end

# def double_consonants(str)
#   str.chars.map { |char| char =~ /[b-df-hj-np-tv-z]/i ? char * 2 : char }.join
# end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""