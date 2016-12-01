def buy_fruit(list)
  p list.map { |fruit, quantity| [fruit] * quantity }.flatten
end

buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]