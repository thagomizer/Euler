# Starting with 1 and spiralling anticlockwise in the following way, a square
# spiral with side length 7 is formed.

# 37 36 35 34 33 32 31
# 38 17 16 15 14 13 30
# 39 18  5  4  3 12 29
# 40 19  6  1  2 11 28
# 41 20  7  8  9 10 27
# 42 21 22 23 24 25 26
# 43 44 45 46 47 48 49

# It is interesting to note that the odd squares lie along the bottom right
# diagonal, but what is more interesting is that 8 out of the 13 numbers lying
# along both diagonals are prime; that is, a ratio of 8/13  62%.

# If one complete new layer is wrapped around the spiral above, a square spiral
# with side length 9 will be formed. If this process is continued, what is the
# side length of the square spiral for which the ratio of primes along both
# diagonals first falls below 10%?
require 'pp'

class Fixnum
  def prime?
    return false if self == 1
    root = Math.sqrt(self).to_i
    (2..root).each do |x|
      return false if self % x == 0
    end
    true
  end
end

percent_prime = 1
# Starting with 1 and spiralling anticlockwise in the following way, a square
# spiral with side length 7 is formed.

# 37 36 35 34 33 32 31
# 38 17 16 15 14 13 30
# 39 18  5  4  3 12 29
# 40 19  6  1  2 11 28
# 41 20  7  8  9 10 27
# 42 21 22 23 24 25 26
# 43 44 45 46 47 48 49

# It is interesting to note that the odd squares lie along the bottom right
# diagonal, but what is more interesting is that 8 out of the 13 numbers lying
# along both diagonals are prime; that is, a ratio of 8/13  62%.

# If one complete new layer is wrapped around the spiral above, a square spiral
# with side length 9 will be formed. If this process is continued, what is the
# side length of the square spiral for which the ratio of primes along both
# diagonals first falls below 10%?

prime_count = 0
total = 1.0
i = 2
x = 1
while percent_prime > 0.1 do
  corners = []
  corners << i**2 + 1
  corners << (i+1)**2
  corners << x + (i-1)*2
  corners << x + i*2 + (i-1)*2
  x = corners.last
  i += 2
  total += 4
  prime_count += corners.map{|x| x.prime? ? 1 : 0}.inject(:+)
  percent_prime = prime_count/total
end

puts i - 1

# time ruby spiral.rb
# 26241

# real	0m59.205s
# user	0m57.321s
# sys	0m0.100s
