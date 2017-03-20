# class Triangle
#   def initialize(size)
#     @size = size
#   end

#   def rows
#     result = []
#     (1..@size).each do |num|
#       ones = Array.new(num, 1)
#       result << transform(ones, result.last, ones.size - 1)
#     end
#     result
#   end

#   private

#   def transform(ones, last_row, last_index)
#     row = []
#     ones.each_with_index do |one, index|
#       if index.zero? || index == last_index
#         row << one
#         next
#       end
#       row << last_row[index] + last_row[index - 1]
#     end
#     row
#   end
# end

# class Triangle
#   def initialize(size)
#     @size = size - 1
#   end
  
#   def rows
#     result = [[1]]
#     @size.times { result << next_row(result.last) }
#     result
#   end
  
#   def next_row(last_row)
#     row = []
#     last_row.each_with_index do |num, idx|
#       idx.zero? ? row << 1 : row << num + last_row[idx - 1]
#     end
#     row << 1
#     row
#   end
# end

class Triangle
  attr_reader :rows
  
  def initialize(size)
   @rows = (1..size).map { next_row } 
  end
  
  def next_row
    bottom_row = @previous_row ? [0, *@previous_row, 0] : [0, 1]
    @previous_row = bottom_row.each_cons(2).map { |left, right| left + right }
  end
end

p Triangle.new(5).rows