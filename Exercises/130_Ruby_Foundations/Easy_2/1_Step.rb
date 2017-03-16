def step(starts, ends, step)
  value = starts
  until value > ends do 
    yield(value)
    value += step
  end
end

step(1, 10, 3) { |value| puts "value = #{value}" }

# value = 1
# value = 4
# value = 7
# value = 10