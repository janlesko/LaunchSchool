arr = ["b", "a"]

arr = arr.product(Array(1..3))
# [["b", 1], ["b", 2], ["b", 3], ["a", 1], ["a", 2], ["a", 3]]

arr.first.delete(arr.first.last)
# will delete 1 from ["b", 1] and return 1

arr = ["b", "a"]

arr = arr.product([Array(1..3)])
# [["b", [1, 2, 3]], ["a", [1, 2, 3]]]

arr.first.delete(arr.first.last)
# will delete "[1, 2, 3]" from ["b", [1, 2, 3]] and return [1, 2, 3]a
