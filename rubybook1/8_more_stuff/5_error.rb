def execute(block)
  block.call
end

execute { puts "Hello from inside the execute method!" }

# we are not passing any argument to the method
# to pass a block we have to insert & before the block parameter