def minilang(execute)
  execute = execute.downcase.split(" ")
  register = 0
  stack = []
  execute.each do |command|
    case command
    when 'print' then puts register
    when 'push'  then stack += [register]
    when 'mult'  then register *= stack.pop
    when 'add'   then register += stack.pop
    when 'pop'   then register = stack.pop
    when 'div'   then register /= stack.pop
    when 'mod'   then register %= stack.pop
    when 'sub'   then register -= stack.pop
    else              register = command.to_i
    end
  end
end

minilang('3 PUSH 5 MOD PUSH 7 PUSH 4 PUSH 5 MULT PUSH 3 ADD SUB DIV PRINT')
# (3 + (4 * 5) - 7) / (5 % 3)

# minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# # 5
# # 10
# # 4
# # 7

# minilang('PRINT')
# # 0

# minilang('5 PUSH 3 MULT PRINT')
# # 15

# minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# # 5
# # 3
# # 8

# minilang('5 PUSH POP PRINT')
# # 5

# minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# # 6

# minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# # 12

# minilang('-3 PUSH 5 SUB PRINT')
# # 8

# minilang('6 PUSH')
# # (nothing printed; no PRINT commands)