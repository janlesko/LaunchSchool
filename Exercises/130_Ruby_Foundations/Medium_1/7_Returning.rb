# Group 1
def check_return_with_proc
  my_proc = proc { return }
  my_proc.call
  puts "This will never output to screen."
end

check_return_with_proc

# if we return from within a Proc, and that Proc is defined within a method, we
# will immediately exit that method

# method execution was ended when we called proc which contained return command

# Group 2
def check_return_with_proc_2(my_proc)
  my_proc.call
end

my_proc = proc { return }

check_return_with_proc_2(my_proc)

# if we return from within a Proc and that Proc is defined outside of a method, 
# an error will be raised when we call that Proc. We cannot return from the top
# level of the program.

# my proc is defined outside of the method and passed inside in a form of argument
# we get an error when calling the proc because the return commnad if defined
# outside of the method

# Group 3
def check_return_with_lambda
  my_lambda = lambda { return }
  my_lambda.call
  puts "This will be output to screen."
end

check_return_with_lambda

# if we return from within a Lambda and that Lambda is defined within a method,
# then program execution jumps to where the Lambda code is defined. After that,
# code executino then proceeds to the next line of the method after the call 
# to that lambda

# return command defined inside of a lambda will not cause method to interupt
# it's command execution flow

# Group 4
my_lambda = lambda { return }
def check_return_with_lambda(my_lambda)
  my_lambda.call
  puts "This will be output to screen."
end

check_return_with_lambda(my_lambda)

# same as 3

# method executed it's last command and the flow was not interupted by the return
# command inside the lambda defined outside of the method

# Group 5
def block_method_3
  yield
end

block_method_3 { return }

# if we return from an implicit block that is yielded to a method then error will
# be raised. We are trying to return from some code in our program that isn't a
# method.

# an error was raised when we tried to yield into the block which had return
# command



# we can't return from a proc or block that is defined outside a method
# if we return from a proc that is defined withing a method, we will exit the method
# if we return from a lambda that is defined within a method or outside of it,
# then program execution will proceed to the next line after lambda call