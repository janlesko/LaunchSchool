# module Diamond
#   def self.make_diamond(last_letter)
#     string = ''
#     upper = []
#     spaces = 1
#     @letters = ("A"..last_letter).to_a.each do |ele|
#       upper << ele and next if ele == "A"
#       upper << ele + " " * spaces + ele
#       spaces += 2
#     end
#     result = (upper + upper.take(upper.size - 1).reverse)
#     result.each { |ele| string << ele.center(result.size) + "\n" }
#     string
#   end
# end

class Diamond
  def self.make_diamond(letter)
    arr = ("A"..letter).to_a
    result = []
    arr.each_with_index do |item, idx|
      left_half = " " * (arr.size - (idx + 1)) + item + " " * idx
      result << left_half + left_half.reverse[1..-1] + "\n"
    end
    (result + result[0..-2].reverse).join
  end
end

puts Diamond.make_diamond("C")