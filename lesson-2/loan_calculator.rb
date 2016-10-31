def valid_number?(number)
  (number.to_i.to_s == number || number.to_f.to_s == number) &&
    (number.to_i >= 0 || number.to_f >= 0)
end

puts "Welcome to Loan Calculator!"
puts "It will calculate the monthly payments on a loan."

loop do
  loan_amount = nil
  loop do
    puts "Enter the loan amount"
    loan_amount = gets.chomp
    break if valid_number?(loan_amount)
    puts "That is not a valid number."
  end

  annual_perc_rate = nil
  loop do
    puts "Enter the Annual Percentage Rate (APR)"
    annual_perc_rate = gets.chomp
    break if valid_number?(annual_perc_rate)
    puts "That is not a valid number."
  end

  loan_duration_years = nil
  loan_duration_months = nil
  loop do
    puts "Select the loan duration in months"
    loan_duration_months = gets.chomp
    puts "Select the loan duration in years"
    loan_duration_years = gets.chomp
    break if valid_number?(loan_duration_months) &&
             valid_number?(loan_duration_years)
    puts "That is not a valid number."
  end

  annual_perc_rate = annual_perc_rate.to_f / 100
  monthly_perc_rate = annual_perc_rate / 12
  loan_duration_months = loan_duration_months.to_i +
                         loan_duration_years.to_i * 12

  if monthly_perc_rate.zero?
    monthly_payment = loan_amount.to_f / loan_duration_months
  else
    monthly_payment = loan_amount.to_f * (monthly_perc_rate /
                      (1 - (1 + monthly_perc_rate)**-loan_duration_months))
  end

  if loan_duration_months.zero?
    puts "The loan of $" + loan_amount +
         " needs to be paid back as soon as it is received."
  else
    puts "Your monthly payments is $#{format('%02.2f', monthly_payment)}."
  end

  puts "Do you wish to start calculation again? Press \"Y\" to confirm."
  choice = gets.chomp.downcase

  break unless choice == "y"
end

puts "Thank you for using the Loan Calculator!"
