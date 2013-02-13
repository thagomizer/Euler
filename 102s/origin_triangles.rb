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

class Point
  attr_accessor :x, :y
  def initialize(x, y)
    @x = x.to_f
    @y = y.to_f
  end
end

class Line
  attr_accessor :m, :b
  def initialize(p1, p2)
    @m = (p1.y - p2.y)/(p1.x - p2.x)
    @b = p1.y - (@m * p1.x)
  end
end

class Triangle
  attr_accessor :a, :b, :c, :inequalities
  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
    @inequalities = []
  end

  def lines
    l1 = Line.new(@a, @b)
    sign = which_sign(l1, @c)
    @inequalities << [l1, sign]

    l2 = Line.new(@b, @c)
    sign = which_sign(l2, @a)
    @inequalities << [l2, sign]

    l3 = Line.new(@c, @a)
    sign = which_sign(l3, @b)
    @inequalities << [l3, sign]
  end

  def contains_origin?
    self.lines
    @inequalities.all?{|x| origin_on_same_side?(*x)}
  end

  def origin_on_same_side? line, sign
    if sign == ">" then
      return 0 > line.b
    else
      return 0 <= line.b
    end
  end

  def which_sign line, point
    expected_x = point.y
    actual_x = (line.m * point.x) + line.b
    actual_x > expected_x ? "<" : ">"
  end
end

contain_origin = 0

filename = "triangles.txt"
file = File.open(filename, "r")
file.each_line do |line|
  nums = line.chomp.split(',').map{|x| x.to_i}
  points = []
  nums.each_slice(2) do |x, y|
    points << Point.new(x, y)
  end
  t = Triangle.new(*points)
  contain_origin += 1 if t.contains_origin?
end

puts contain_origin

# 228

# real  0m0.082s
# user  0m0.062s
# sys   0m0.004s

