# The first two consecutive numbers to have two distinct prime factors are:

#         14 = 2  7
#         15 = 3  5

# The first three consecutive numbers to have three distinct prime factors are:

#         644 = 2^2  7  23
#         645 = 3  5  43
#         646 = 2  17  19.

# Find the first four consecutive integers to have four distinct primes factors.
# What is the first of these numbers?

require 'pp'

class Fixnum
  $primes = {0 => false, 1 => false, 2 => true}
  $prime_factors = {0 => [0], 1 => [1], 2 => [2]}

  def prime?
    return $primes[self] unless $primes[self].nil?

    root = Math.sqrt(self).to_i
    (2..root).each do |x|
      if self % x == 0 then
        $primes[self] = false
        return false
      end
    end
    $primes[self] = true
    true
  end

  def prime_factors
    return $prime_factors[self] if $prime_factors[self]
    if self.prime? then
      $prime_factors[self] = [self]
      return [self]
    end

    root = Math.sqrt(self).to_i
    root.downto(2) do |x|     # going backwards to keep the tree short
      if self % x == 0 then
        a = x
        b = self / x
        a_factors = a.prime_factors
        factors = (a.prime_factors + b.prime_factors).uniq
        $prime_factors[self] = factors
        return factors
      end
    end
  end
end

a = []
a_factors = []

x = 2
seeking = 4
while true do
  f = x.prime_factors
  if f.length == seeking
    a << x
    a_factors << f
    if a.length == seeking then
      uniq_factors = a_factors.flatten
      if uniq_factors.length == seeking**2 then
        puts "FOUND"
        pp a
        pp a_factors.map{|x| x.sort}
        break
      end
      a.shift
      a_factors.shift
    end
  else
    a = []
    a_factors = []
  end
  x += 1
end

# FOUND
# [134043, 134044, 134045, 134046]
# [[3, 7, 13, 491], [2, 23, 31, 47], [5, 17, 19, 83], [2, 3, 11, 677]]

# real	0m14.344s
# user	0m13.035s
# sys	0m0.055s
