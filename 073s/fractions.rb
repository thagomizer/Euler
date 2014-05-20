# Consider the fraction, n/d, where n and d are positive integers. If
# n < d and HCF(n,d)=1, it is called a reduced proper fraction.

# If we list the set of reduced proper fractions for d <= 8 in
# ascending order of size, we get:

#    1/8, 1/7, 1/6, 1/5, 1/4, 2/7, 1/3, 3/8, 2/5, 3/7, 1/2, 4/7, 3/5,
#    5/8, 2/3, 5/7, 3/4, 4/5, 5/6, 6/7, 7/8

# It can be seen that there are 3 fractions between 1/3 and 1/2.

# How many fractions lie between 1/3 and 1/2 in the sorted set of
# reduced proper fractions for d <= 12,000?

require 'rational'
require 'pp'

low = Rational(1, 3)
high = Rational(1, 2)

input = ARGV[0].to_i

fracts = 0

input.downto(1).each do |d|
  n = (low * d).ceil

  loop do
    temp = Rational(n, d)
    break if temp > high
    fracts += 1 if temp.denominator == d
    n += 1
  end
end

puts fracts - 2  # 1/2 and 1/3 are in the count so remove them

# bash-3.2$ time ruby fractions.rb 12000
# 7295372

# real	0m10.822s
# user	0m10.766s
# sys	0m0.055s
