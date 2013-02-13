# Take the number 192 and multiply it by each of 1, 2, and 3:

# 192  1 = 192
# 192  2 = 384
# 192  3 = 576
# By concatenating each product we get the 1 to 9 pandigital, 192384576. We will
# call 192384576 the concatenated product of 192 and (1,2,3)

# The same can be achieved by starting with 9 and multiplying by 1, 2, 3, 4, and
# 5, giving the pandigital, 918273645, which is the concatenated product of 9
# and (1,2,3,4,5).

# What is the largest 1 to 9 pandigital 9-digit number that can be formed as
# the concatenated product of an integer with (1,2, ... , n) where n  1?
require 'pp'

class Fixnum
  def pandigital?
    correct_digits = %w(1 2 3 4 5 6 7 8 9)
    self.to_s.split(//).sort == correct_digits
  end
end

max = 0

found = false
i = 9876
range = (1..2)
until found do
  n = range.map{|x| x * i}.join.to_i
  found = n.pandigital?
  i += -1
end
max = n if found

found = false
i = 987
range = (1..3)
until found do
  n = range.map{|x| x * i}.join.to_i
  break if n < max
  found = n.pandigital?
  i += -1
end
max = n if found and n > max

found = false
i = 98
range = (1..4)
until found do
  n = range.map{|x| x * i}.join.to_i
  break if n < max
  found = n.pandigital?
  i += -1
end
max = n if found and n > max

found = false
i = 9
range = (1..5)
until found do
  n = range.map{|x| x * i}.join.to_i
  break if n < max
  found = n.pandigital?
  i += -1
end
max = n if found and n > max

puts max

# time ruby pandigital.rb
# 932718654

# real	0m0.067s
# user	0m0.044s
# sys	0m0.004s
