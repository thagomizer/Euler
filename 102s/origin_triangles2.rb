# Three distinct points are plotted at random on a Cartesian plane, for
# which -1000  x, y  1000, such that a triangle is formed.

# Consider the following two triangles:

# A(-340,495), B(-153,-910), C(835,-947)

# X(-175,41), Y(-421,-714), Z(574,-645)

# It can be verified that triangle ABC contains the origin, whereas triangle
# XYZ does not.

# Using triangles.txt (right click and 'Save Link/Target As...'), a 27K text
# file containing the co-ordinates of one thousand "random" triangles, find the
# number of triangles for which the interior contains the origin.

# NOTE: The first two examples in the file represent the triangles in the
# example given above.

require 'pp'

contain_origin = 0

filename = "small_triangles.txt"
file = File.open(filename, "r")
file.each_line do |line|
  nums = line.chomp.split(',').map{|x| x.to_i}
  xs = []
  ys = []
  nums.each_slice(2) do |x, y|
    xs << x.to_i
    ys << y.to_i
  end

  a = xs.map{|x| x > 0}.uniq.length
  b = ys.map{|y| y > 0}.uniq.length


end

puts contain_origin
