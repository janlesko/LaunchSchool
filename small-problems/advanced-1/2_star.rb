# def star(num)
# (num / 2 - 1).downto(0) { |n| puts ((("*" + " " * n) * 2) + "*").center(num) }
# puts "*" * num
# (0).upto(num / 2 - 1) { |n| puts ((("*" + " " * n) * 2) + "*").center(num) }
# end

def star(n)
  middle = (n / 2).floor
  n.times do |x|
    line = " " * n
    line[x] = "*"
    line[n-1-x] = "*"
    line[middle] = "*"

    if x == middle
      puts "*" * n
    else 
      puts line
    end
  end
end

star(5)

# *  *  *
#  * * *
#   ***
# *******
#   ***
#  * * *
# *  *  *