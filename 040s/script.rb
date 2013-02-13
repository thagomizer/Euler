# An irrational decimal fraction is created by concatenating the positive
# integers:

# 0.123456789101112131415161718192021...

# It can be seen that the 12th digit of the fractional part is 1.

# If dn represents the nth digit of the fractional part, find the value of the
# following expression.

# d1  d10  d100  d1000  d10000  d100000  d1000000
require 'pp'

s = ""
i = 1
while s.length < 1_000_000 do
  s << i.to_s
  i += 1
end

digits = (0..6).map{|x| s[(10**x - 1), 1].to_i}
result = digits.inject(1){|product, n| product * n}

pp result

# 210
# real	0m0.259s
# user	0m0.249s
# sys	0m0.005s
