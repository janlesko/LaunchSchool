class Bst
  attr_reader :data, :left, :right

  def initialize(top_number)
    @data = top_number
  end

  def insert(number)
    if number > data
      if @right
        @right.insert(number)
      else
        @right = Bst.new(number)
      end
    else
      if @left
        @left.insert(number)
      else
        @left = Bst.new(number)
      end
    end
  end
end

four = Bst.new 4
four.insert 2
four.insert 6
four.insert 1

four.insert 3
four.insert 7
four.insert 5
p four.data
p four.left.data
p four.right.data
p four.left.left.data
p four.left.right.data
p four.right.data
p four.right.left.data
p four.right.right.data
# 2, 
# 1, 
# 3, 
# 6, 
# 5, 
# 7, 