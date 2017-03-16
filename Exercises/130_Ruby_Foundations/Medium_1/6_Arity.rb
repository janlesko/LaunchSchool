# Group 1
my_proc = proc { |thing| puts "This is a #{thing}." } 
puts my_proc
puts my_proc.class
my_proc.call
my_proc.call('cat')

#proc = Proc.new
# we can save block into a variable which is called proc
# we can call proc without the corrent number of arguments

# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}" }
my_second_lambda = -> (thing) { puts "This is a #{thing}" }
puts my_lambda
puts my_second_lambda
puts my_lambda.class
my_lambda.call('dog')
my_lambda.call
my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}" }

# lambdas are objects of the Proc class
# calling lambdas without the argument with raise an error

# # Group 3
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."}
block_method_1('seal')

# nil will assigned to the bock's variable if no value is passed to that block
#  variable

# if the method call does not contain a block and the method implementation
# contains yield, an error will be raised

# # Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
block_method_2('turtle') { puts "This is a #{animal}."}

# if we pass too few arguments to a block, they will be assigned nil value
# an error will be raised if we try to call missing argument inside a block

# block will raise an error if we try to access variable which is outside of the
# block's scope and is not defined inside the block.

