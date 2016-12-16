def transpose(matrix)
  result = []
  0.upto(2) do |x|
    transposed_row = matrix.map { |row| row[x] }
    result << transposed_row
  end
  p result
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]