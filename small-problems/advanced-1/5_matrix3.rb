# def rotate90(matrix, degrees = 90)
#   options = [0, 90, 180, 270, 360]
#   rotated = []
#   options.index(degrees).times do
#     0.upto(matrix[0].size - 1) do |x|
#     rotate = matrix.map { |row| row[x] }
#     rotated << rotate.reverse
#     end
#     matrix = rotated
#     rotated = []
#   end
#   matrix
# end

def rotate90(matrix, degrees = 90)
  rotated = []
  (degrees / 90).times do
    0.upto(matrix[0].size - 1) do |x|
    rotate = matrix.map { |row| row[x] }
    rotated << rotate.reverse
    end
    matrix = rotated
    rotated = []
  end
  matrix
end

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

# matrix2 = [
#   [3, 7, 4, 2],
#   [5, 1, 0, 8]
# ]

p new_matrix1 = rotate90(matrix1, degrees = 180)
# new_matrix2 = rotate90(matrix2)
# new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

# p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
# p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
# p new_matrix3 == matrix2