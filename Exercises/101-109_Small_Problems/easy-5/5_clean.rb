# def cleanup(string)
#   string.gsub(/\W+/, ' ')
# end

# def cleanup(text)
#   text.gsub(/[^a-z]/i, ' ').squeeze(' ')
# end

def cleanup(text)
  letters = ('a'..'z').to_a
  text = text.chars.map do |char|
    letters.include?(char) ? char : ' '
  end
  p text.join.squeeze(' ')
end

p cleanup("---what's my +*& line?") == ' what s my line '