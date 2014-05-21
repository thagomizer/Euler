# In the 5 by 5 matrix below, the minimal path sum from the top left
# to the bottom right, by only moving to the right and down, is
# indicated in bold red and is equal to 2427.

#     131	673	234	103	18
#     201	96	342	965	150
#     630	803	746	422	111
#     537	699	497	121	956
#     805	732	524	37	331

# Find the minimal path sum, in matrix.txt (right click and 'Save
# Link/Target As...'), a 31K text file containing a 80 by 80 matrix,
# from the top left to the bottom right by only moving right and down.

require 'pp'

class Cell
  attr_accessor :value, :sum

  def initialize(value = nil)
    self.value = value;
  end
end

matrix = []

File.open("matrix.txt") do |f|
  f.each_line.with_index do |line, row|
    matrix[row] = line.split(",").map { |x| cell = Cell.new(x.to_i) }
  end
end

dim = matrix[0].length - 1

0.upto(dim) do |row|
  0.upto(dim) do |col|
    sum = matrix[row][col].value

    neighbors = []
    if row > 0
      neighbors << matrix[row - 1][col].sum
    end

    if col > 0
      neighbors << matrix[row][col - 1].sum
    end

    sum += neighbors.min.to_i

    matrix[row][col].sum = sum
  end
end

pp matrix[dim][dim].sum

# 427337

# real	0m0.126s
# user	0m0.075s
# sys	0m0.050s
