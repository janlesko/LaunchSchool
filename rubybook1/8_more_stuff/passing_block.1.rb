def take_block(x, &block)
  block.call(x)
end

#number = 42
take_block(42) do |num|
  puts "Block being called in the method! #{num}"
end