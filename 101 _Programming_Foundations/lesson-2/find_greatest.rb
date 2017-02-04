def find_greatest(numbers)
  saved_number = numbers.first

  numbers.each do |num|
    if saved_number >= num
      next
    else
      saved_number = num
    end
  end

  saved_number
end

numbers = [3,49,6,2,44,2]

p find_greatest(numbers)