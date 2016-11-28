def interleave(ary1, ary2)
  result = ary1
  ary2.each_with_index { |el, in| }
end

interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']