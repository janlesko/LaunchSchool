# def balanced?(string)
#   balancer = 0
#   string.chars.each do |char|
#     return false if balancer == -1
#     if char == "("
#       balancer += 1
#     elsif char == ")"
#       balancer -= 1
#     end
#   end

#   balancer.zero?
# end

def balanced?(string)
  parens = 0
  string.each_char do |char|
    parens += 1 if char == '('
    parens -= 1 if char == ')'
    break if parens < 0
  end

  parens.zero?
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false