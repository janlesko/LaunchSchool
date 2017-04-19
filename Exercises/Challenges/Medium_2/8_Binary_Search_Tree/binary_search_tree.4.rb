class Bst
  @@tree = []
  
  def initialize(top_number)
    @top_number = top_number
    @@tree << new_branch(top_number)
  end
  
  def self.tree
    @@tree
  end
  
  def new_branch(number)
    branch = Hash.new { |hash, key| hash[key] = {right: nil, left: nil} }
    branch[number]
  end
  
  def insert(number)
    @@tree.each do |branch|
      if number > branch.key && branch[branch.key][:right].nil?
        branch[branch.key][:right] = Bst.new(number)
        break
      elsif number <= branch.key && branch[branch.key][:right].nil?
        branch[branch.key][:left] = Bst.new(number)
        break
      end
    end
    @@tree << new_branch(number)
  end
  
  def data
    @top_number
  end
  
  def left
    @@tree[@top_number][:left]
  end
  
  def right
    @@tree[@top_number][:right]
  end
end

four = Bst.new 4
four.insert 2
four.insert 6
four.insert 1

four.insert 3
p four.insert 7
p four.insert 5
p four.data
p four.left.data
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
p Bst.tree