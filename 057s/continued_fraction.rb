# It is possible to show that the square root of two can be expressed as an
# infinite continued fraction.

# 2 = 1 + 1/(2 + 1/(2 + 1/(2 + ... ))) = 1.414213...

# By expanding this for the first four iterations, we get:

# 1 +               1/2  = 3/2 = 1.5
# 1 +        1/(2 + 1/2) = 7/5 = 1.4
# 1 + 1/(2 + 1/(2 + 1/2)) = 17/12 = 1.41666...
# 1 + 1/(2 + 1/(2 + 1/(2 + 1/2))) = 41/29 = 1.41379...

# The next three expansions are 99/70, 239/169, and 577/408, but the eighth
# expansion, 1393/985, is the first example where the number of digits in the
# numerator exceeds the number of digits in the denominator.

# In the first one-thousand expansions, how many fractions contain a numerator
# with more digits than denominator?
require 'pp'
require 'mathn'

h = 1/2
count = 0

t = h
1000.times do
  approximation = 1 + t
  numerator_l = approximation.numerator.to_s.length
  denominator_l = approximation.denominator.to_s.length
  count += 1 if numerator_l > denominator_l
  t = 1 /(2 + t)
end

puts count

# 153

# real	0m3.148s
# user	0m3.134s
# sys	0m0.008s
