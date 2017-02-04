def multiply_all_pairs(ary1, ary2)
  p ary1.product(ary2).map { |pair| pair.inject(:*) }.sort
end

multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]