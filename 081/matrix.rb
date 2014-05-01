# In the 5 by 5 matrix below, the minimal path sum from the top left to the bottom right, by only moving to the right and down, is indicated in bold red and is equal to 2427.

# 131	673	234	103	18
# 201	96	342	965	150
# 630	803	746	422	111
# 537	699	497	121	956
# 805	732	524	37	331

# Find the minimal path sum, in matrix.txt (right click and 'Save Link/Target As...'), a 31K text file containing a 80 by 80 matrix, from the top left to the bottom right by only moving right and down.

require 'pp'

class Cell
  attr_accessor :value, :right, :down

  def initialize(value = nil)
    self.value = value;
  end
end

dimension = 4
matrix = []

File.open("small_matrix.txt") do |f|
  f.each_line do |line|
    matrix << line.split(",").map { |x| cell = Cell.new(x.to_i) }
  end
end

matrix.each_with_index do |row, row_index|
  row.each_with_index do |cell, col_index|
    if col_index < dimension then
      cell.right = matrix[row_index][col_index + 1]
    end
    if row_index < dimension then
      cell.down = matrix[row_index + 1][col_index]
    end
  end
end

matrix.flatten!
