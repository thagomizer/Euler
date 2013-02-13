# 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

# What is the sum of the digits of the number 2^1000?
require 'pp'

num = 2**1_000
pp num.to_s.split('').map{|x| x.to_i}.inject(:+)

# 1366

# real	0m0.017s
# user	0m0.009s
# sys	0m0.005s
