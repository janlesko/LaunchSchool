def valid_number?(number)
  (number.to_i.to_s == number || number.to_f.to_s == number) && number.to_i > 0
end

loop do
  puts "Hello, welcome to Loan Calculator!"
  puts "It will help you determine the monthly payments on a loan."

  loan_amount = nil
  loop do
    puts "Enter the loan amount"
    loan_amount = gets.chomp
    break if valid_number?(loan_amount)
    puts "That is not a valid number."
    puts "Please enter the loan amount in the following example format: 10000"
  end

  apr = nil
  loop do
    puts "Enter the Annual Percentage Rate (APR)"
    apr = gets.chomp
    break if valid_number?(apr)
    puts "That is not a valid number."
  end

  loan_duration_years = nil
  loan_duration_months = nil
  loop do
    puts "Select if you wish to enter the loan duration in months or years."
    puts "Hit \"M\" for months or \"Y\" for years."
    choice = gets.chomp.downcase

    if choice == "m"
      puts "Enter the loan duration in months"
      loan_duration_months = gets.chomp
    elsif choice == "y"
      puts "Enter the loan duration in years"
      loan_duration_years = gets.chomp
    end

    break if valid_number?(loan_duration_months) ||
             valid_number?(loan_duration_years)
    puts "That is not a valid choice or number."
  end

  apr = apr.to_f / 100
  mir = apr / 12
  loan_duration_months = loan_duration_months.to_i +
                         loan_duration_years.to_i * 12

  monthly_payment = loan_amount.to_f *
                    (mir / (1 - (1 + mir)**-loan_duration_months))

  puts "Your monthly payments is $#{format('%02.2f', monthly_payment)}."

  puts "You you with to start calculation again?"
  choice = gets.chomp

  break unless choice.downcase.start_with?('y')
end

prompt("Thank you for using the Loan Calculator!")
