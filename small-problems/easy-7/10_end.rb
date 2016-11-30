# def penultimate(string)
#   p string.split[-2]
# end

# return middle word
def penultimate(str)
  size = str.split.size
  p str.split.slice(size / 2)
end

penultimate('last word') == 'last'
penultimate('Launch School is surely great!') == 'is'