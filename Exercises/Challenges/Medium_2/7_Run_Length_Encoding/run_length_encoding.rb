# class RunLengthEncoding
#   def self.encode(string)
#     result = ''
#     counter = 1
#     string.chars.each_with_index do |char, idx|
#       if char == string[idx + 1]
#         counter += 1
#       else
#         result += if counter == 1
#                     char
#                   else
#                     counter.to_s + char
#                   end
#         counter = 1
#       end
#     end
#     result
#   end

#   def self.decode(string)
#     counter = ''
#     result = ''
#     string.chars.each do |char|
#       if char =~ /\d/
#         counter += char
#       else
#         if counter == ''
#           result += char
#         else
#           result += char * counter.to_i
#           counter = ''
#         end
#       end
#     end
#     result
#   end
# end

module RunLengthEncoding
  def self.encode(input)
    #input.gsub(/(.)\1+/)
    input.gsub(/(.)\1{1,}/) do |match| 
      p match
      match.size.to_s + match[0]
    end
  end

  def self.decode(input)
    input.gsub(/\d+\D/) do |match| 
      p match
      match[-1] * match.to_i
    end
  end
end

# input = 'WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB'
# output = '12WB12W3B24WB'

# p RunLengthEncoding.encode(input)
# p RunLengthEncoding.decode(output)