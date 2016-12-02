def balancer(string)
  return false unless string.count("(") == string.count(")")

  paren_count = 0

  string.split("").each do |char|
    paren_count += 1 if char == "("
    paren_count -= 1 if char == ")"

    
    return false if paren_count < 0
  end
  true
end

p balancer("hi") # => true
p balancer("(hi") # => false
p balancer("(hi)") # => true
p balancer(")hi(") # => false