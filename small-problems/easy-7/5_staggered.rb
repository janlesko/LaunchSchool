# def staggered_case(string)
#   result = []
#   string.chars.each_with_index do |char, index|
#     if index.even?
#       result << char.upcase
#     else
#       result << char.downcase
#     end
#   end
#   p result.join
# end

def staggered_case(string, first_up = true)
  result = ''
  need_upper = first_up
  string.chars.each do |char|
    if need_upper
      result += char.upcase
    else
      result += char.downcase
    end
    need_upper = !need_upper
  end
  p result
end

p staggered_case('I Love Launch School!', first_up = false) == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'