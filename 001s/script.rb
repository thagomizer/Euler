#!/usr/bin/ruby -w

sum = (1...1000).find_all{|x| (x % 5 == 0 || x % 3 == 0)}.inject(&:+)
p sum

# 233168

# real	0m0.110s
# user	0m0.061s
# sys	0m0.049s
