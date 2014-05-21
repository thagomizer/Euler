# NOTE: This problem is a more challenging version of Problem 81.

# The minimal path sum in the 5 by 5 matrix below, by starting in any
# cell in the left column and finishing in any cell in the right
# column, and only moving up, down, and right, is indicated in red and
# bold; the sum is equal to 994.

#     131	673	234	103	18
#     201	96	342	965	150
#     630	803	746	422	111
#     537	699	497	121	956
#     805	732	524	37	331

# Find the minimal path sum, in matrix.txt (right click and 'Save
# Link/Target As...'), a 31K text file containing a 80 by 80 matrix,
# from the left column to the right column.

require 'pp'

class Cell
  attr_accessor :value, :cost

  def initialize(value = nil)
    self.value = value;
  end

  def to_s
    "v: #{value} c: #{cost}"
  end
end

matrix = []

File.open("matrix.txt") do |f|
  f.each_line.with_index do |line, row|
    matrix[row] = line.split(",").map { |x| cell = Cell.new(x.to_i) }
  end
end

dim = matrix[0].length - 1

(0..dim).each do |row|
  matrix[row][0].cost = matrix[row][0].value
end

(1..dim).each do |col|
  begin
    adjusted = false
    (0..dim).each do |row|
      cost = matrix[row][col].value

      neighbor_vals = []

      if row > 0 then   # Look up
        neighbor_vals << matrix[row - 1][col].cost
      end

      if row < dim then # Look down
        neighbor_vals << matrix[row + 1][col].cost
      end

      if col > 0 then # Look left
        neighbor_vals << matrix[row][col - 1].cost
      end

      cost += neighbor_vals.compact.min

      if cost != matrix[row][col].cost
        matrix[row][col].cost = cost
        adjusted = true
      end
    end
  end while adjusted
end

costs = (0..dim).map { |row| matrix[row][dim].cost }

pp costs.min

# 260324

# real	0m0.165s
# user	0m0.112s
# sys	0m0.051s
