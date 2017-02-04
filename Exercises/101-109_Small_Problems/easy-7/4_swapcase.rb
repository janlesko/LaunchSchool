# def swapcase(string)
#   downcases = ('a'..'z').to_a
#   result = []
#   string.chars.each do |char|
#     if downcases.include?(char)
#       result << char.upcase
#     else
#       result << char.downcase
#     end
#   end
#   p result.join
# end

def swapcase(string)
  characters = string.chars.map do |char|
    if char =~ /[a-z]/
      char.upcase
    elsif char =~ /[A-Z]/
      char.downcase
    else
      char
    end
  end
  p characters.join
end


p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'