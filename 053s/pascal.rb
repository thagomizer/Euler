# There are exactly ten ways of selecting three from five, 12345:

# 123, 124, 125, 134, 135, 145, 234, 235, 245, and 345

# In combinatorics, we use the notation, 5C3 = 10.

# In general,  nCr = n!/(r!(n-r)!), where r  n, n! = n(n1)...321, and 0! = 1.
# It is not until n = 23, that a value exceeds one-million: 23C10 = 1144066.

# How many, not necessarily distinct, values of  nCr, for 1  n  100, are greater
# than one-million?
require 'pp'

class Fixnum
  def factorial
    return 1 if self == 0
    return 1 if self == 1
    (2..self).inject(:*)
  end
end

target = 1_000_000
desired_count = 0

(23..100).each do |n|
  (1..n).each do |r|
    count = n.factorial/(r.factorial * (n - r).factorial)
    if count > target then
      desired_count += 1
    end
  end
end

puts "desired_count #{desired_count}"

# desired_count 4075

# real	0m0.454s
# user	0m0.434s
# sys	0m0.004s
