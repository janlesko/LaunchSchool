def prompt(message)
  puts "=> #{message}"
end

def valid_number?(number)
  number.to_f.to_s == number || number.to_i.to_s == number
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt 'Welcome to Calculator! Enter your name:'

name = nil
loop do
  name = gets.chomp

  if name.empty?
    prompt 'Make sure to use a valid name.'
  else
    break
  end
end

prompt "Hi #{name}!"

loop do # main loop
  first_number = nil
  loop do
    prompt 'enter first number'
    first_number = gets.chomp

    if valid_number?(first_number)
      break
    else
      prompt 'Not a valid number'
    end
  end

  second_number = nil
  loop do
    prompt 'enter second number'
    second_number = gets.chomp

    if valid_number?(second_number)
      break
    else
      prompt "Not a valid number"
    end
  end

  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) add
    2) subtract
    3) miltiply
    4) divide
  MSG

  prompt(operator_prompt)

  operator = ''
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else prompt "Must choose 1, 2, 3, or 4"
    end
  end

  prompt "#{operation_to_message(operator)} the two numbers..."

  result = case operator
           when '1'
             first_number.to_f + second_number.to_f
           when '2'
             first_number.to_f - second_number.to_f
           when '3'
             first_number.to_f * second_number.to_f
           when '4'
             first_number.to_f / second_number.to_f
           end

  prompt result.to_s

  prompt 'Do you want to perform another calculation? (Y to calculate again)'
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thank you for using Calculator!"