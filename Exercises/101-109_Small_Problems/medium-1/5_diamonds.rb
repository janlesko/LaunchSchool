# def diamonds(size)

#   spaces = size - size / 2 - 1
#   stars = 1

#   while stars <= size do
#     puts "#{" " * spaces + "*" * stars}"
#     spaces -= 1
#     stars += 2
#   end

#   spaces = 1
#   stars = size - 2

#   while stars > 0
#     puts "#{" " * spaces + "*" * stars}"
#     spaces += 1
#     stars -= 2
#   end
# end

# def diamonds(grid_size)
#   max_size = (grid_size -1) / 2
#   (max_size).downto(0) { |distance| print_row(grid_size, distance) }
#   1.upto(max_size) { |distance| print_row(grid_size, distance) }
# end

# def print_row(grid_size, distance_from_center)
#   stars_number = grid_size - 2 * distance_from_center
#   row = '*' * stars_number
#   puts row.center(grid_size)
# end

# diamonds(9)

# def diamonds(num)
#   1.upto(num) { |n| puts ('*' * n).center(num) if n.odd? }
#   (num - 1).downto(1) { |n| puts ('*' * n).center(num) if n.odd? }
# end

# diamonds(9)

def space(num)
  return '*' if num == 1
  "*#{' ' * (num - 2)}*"
end

def diamond(num)
  1.upto(num) { |n| puts space(n).center(num) if n.odd? }
  (num - 1).downto(1) { |n| puts space(n).center(num) if n.odd? }
end

diamond(9)

#     *
#    ***
#   *****
#  *******
# *********
#  *******
#   *****
#    ***
#     *
