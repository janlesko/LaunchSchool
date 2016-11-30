# def show_multiplicative_average(ary)
#   p format('%.3f', ary.inject(:*) / ary.size.to_f)
# end

def show_multiplicative_average(ary)
  puts "The result is #{(ary.inject(:*) / ary.size.to_f).round(3)}"
end

show_multiplicative_average([3, 5])
# The result is 7.500

show_multiplicative_average([2, 5, 7, 11, 13, 17])
# The result is 28361.667