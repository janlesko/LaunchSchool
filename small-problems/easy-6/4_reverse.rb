# def reverse!(list)
#   list.sort! { |x, y| y <=> x }
# end

def reverse!(list)
  left_index = 0
  right_index = -1

  while left_index < list.size / 2
    list[left_index], list[right_index] = list[right_index], list[left_index]
    left_index += 1
    right_index -= 1
  end

  list
end

list = [1,2,3,4]
result = reverse!(list) # => [4,3,2,1]
p list == [4, 3, 2, 1]
p list.object_id == result.object_id

list = %w(a b c d e)
reverse!(list) # => ["e", "d", "c", "b", "a"]
p list == ["e", "d", "c", "b", "a"]

list = ['abc']
reverse!(list) # => ["abc"]
p list == ["abc"]

list = []
reverse!([]) # => []
p list == []