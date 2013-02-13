# The radical of n, rad(n), is the product of distinct prime factors of n. For
# example, 504 = 2^3 * 3^2 * 7, so rad(504) = 2 * 3 * 7 = 42.

# If we calculate rad(n) for 1  n  10, then sort them on rad(n), and sorting on
# n if the radical values are equal, we get:

#      Unsorted                       Sorted
#    n     rad(n)                n    rad(n)     k
#    1          1                1         1     1
#    2          2                2         2     2
#    3          3                4         2     3
#    4          2                8         2     4
#    5          5                3         3     5
#    6          6                9         3     6
#    7          7                5         5     7
#    8          2                6         6     8
#    9          3                7         7     9
#    10        10               10        10    10

# Let E(k) be the kth element in the sorted n column; for example, E(4) = 8
# and E(6) = 9.

# If rad(n) is sorted for 1  n  100_000, find E(10_000).
require 'pp'

class Integer
  $primes = {}

  def prime?
    return $primes[self] unless $primes[self].nil?

    x = Math.sqrt(self).floor
    (2..x).each do |x|
      return false if (self % x == 0)
    end
    return true
  end

  def self.init_primes
    (2..100_000).each do |x|
      $primes[x] = x.prime?
    end
  end
end

Integer.init_primes

$prime_factors = []

def prime_factors n
  return $prime_factors[n] if $prime_factors[n]

  2.upto(n - 1) do |x|
    next unless $primes[x]
    q, r = n.divmod(x)
    if r == 0 then
      $prime_factors[n] = prime_factors(q) << x
      return $prime_factors[n]
    end
  end
  $prime_factors[n] = [n]
  [n]
end

def rad n
  pf = prime_factors(n).uniq
  pf.inject(:*)
end

# $rad = {}
# (1..100_000).each do |n|
#   puts "*" if n % 10_000 == 0
#   $rad[n] = rad(n)
# end

# $rad_sort = $rad.sort{|a, b| a[1] != b[1] ? a[1] <=> b[1] : a[0] <=> b[0]}
# pp $rad_sort[99_999]

$rad = {}
(1..10).each do |n|
#  puts "*" if n % 10_000 == 0
  $rad[n] = rad(n)
end

$rad_sort = $rad.sort{|a, b| a[1] != b[1] ? a[1] <=> b[1] : a[0] <=> b[0]}
pp $rad_sort
pp $rad_sort[3]
pp $rad_sort[6]




# [99855,
#  19361386640700823163471425054312320082662897612571563761906962414215012369856637179096947335243680669607531475629148240284399976570]

# real	4m50.940s
# user	4m40.295s
# sys	0m0.273sdfg8g8g
