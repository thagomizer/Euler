require 'pp'

# It can be seen that the number, 125874, and its double, 251748, contain
# exactly the same digits, but in a different order.

# Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x, and 6x,
# contain the same digits.

class Integer
  def to_ordered_digits
    self.to_s.split(//).sort
  end
end

i = 0
found = false
until found do
  i += 1
  x1 = i
  x1_digits = x1.to_ordered_digits
  x2 = 2 * i
  next unless x1_digits == x2.to_ordered_digits
  x3 = 3 * i
  next unless x1_digits == x3.to_ordered_digits
  x4 = 4 * i
  next unless x1_digits == x4.to_ordered_digits
  x5 = 5 * i
  next unless x1_digits == x5.to_ordered_digits
  x6 = 6 * i
  next unless x1_digits == x6.to_ordered_digits
  found = [x1, x2, x3, x4, x5, x6]
end

pp found

# [142857, 285714, 428571, 571428, 714285, 857142]

# real	0m3.983s
# user	0m3.848s
# sys	0m0.008s
