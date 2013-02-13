#!/usr/bin/ruby -w
# A Pythagorean triplet is a set of three natural numbers, a  b  c, for which,

# a2 + b2 = c2
# For example, 32 + 42 = 9 + 16 = 25 = 52.

# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

def calc_equation(x, y)
  return (1000 * x) + (1000 * y) - (x * y) == 500000
end

c = 0

(100..500).each do |x|
  (100..500).each do |y|
    if calc_equation(x, y) then
      puts "A = #{x}"
      puts "B = #{y}"
      c = 1000 - x - y
      puts "C = #{c}"
      puts "Product #{x * y * c}"
      break
    end
  end
  break if c > 0
end

# A = 200
# B = 375
# C = 425
# Product 31875000

# real	0m0.073s
# user	0m0.065s
# sys	0m0.004s
