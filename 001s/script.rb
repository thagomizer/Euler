#!/usr/bin/ruby -w

a = (1...1000).to_a
z = a.find_all{|x| (x % 5 == 0 || x % 3 == 0)}
p z
sum = z.inject{|sum, n| sum += n}
p sum

# 233168

# real	0m0.167s
# user	0m0.005s
# sys	0m0.004s
