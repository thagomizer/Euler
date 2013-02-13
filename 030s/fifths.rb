# Surprisingly there are only three numbers that can be written as the sum of
# fourth powers of their digits:

# 1634 = 1^4 + 6^4 + 3^4 + 4^4
# 8208 = 8^4 + 2^4 + 0^4 + 8^4
# 9474 = 9^4 + 4^4 + 7^4 + 4^4
# As 1 = 1^4 is not a sum it is not included.

# The sum of these numbers is 1634 + 8208 + 9474 = 19316.

# Find the sum of all the numbers that can be written as the sum of fifth powers
# of their digits.
require 'pp'

def helper(num)
  digits = num.to_s.split('').map{|x| x.to_i**5}
  sum = digits.inject{|sum, n| sum + n}
  if num == sum
    return num
  end
  0
end

result1 = (4_000..200_000).map{|x| helper(x)}.inject{|sum, n| sum + n}
result2 = (4_000..200_000).inject(0){|sum, n| sum + helper(n)}
puts result1
puts result2

# 443839
# 443839

# real	0m9.259s
# user	0m8.949s
# sys	0m0.023s
