# A googol (10100) is a massive number: one followed by one-hundred zeros;
# 100100 is almost unimaginably large: one followed by two-hundred zeros.
# Despite their size, the sum of the digits in each number is only 1.

# Considering natural numbers of the form, ab, where a, b < 100, what is the
# maximum digital sum?
require 'pp'

class Numeric
  def digit_sum
    n = self
    sum = 0
    while n > 0
      sum += n % 10
      n = n / 10
    end
    sum
  end
end

max_sum = 0
values = [0,0]

(0..100).each do |a|
  (0..100).each do |b|
    sum = (a**b).digit_sum
    if sum > max_sum
      max_sum = sum
      values = [a, b]
    end
  end
end

puts max_sum
pp values

# 972
# [99, 95]

# real	0m2.232s
# user	0m2.116s
# sys	0m0.008s
