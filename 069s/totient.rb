# -*- coding: utf-8 -*-
# Euler's Totient function, φ(n) [sometimes called the phi function], is used to
# determine the number of numbers less than n which are relatively prime to n.
# For example, as 1, 2, 4, 5, 7, and 8, are all less than nine and relatively
# prime to nine, φ(9)=6.


# n     Relatively Prime     φ(n)     n/φ(n)
#----------------------------------------------
# 2     1                    1        2
# 3     1,2                  2        1.5
# 4     1,3                  2        2
# 5     1,2,3,4              4        1.25
# 6     1,5                  2        3
# 7     1,2,3,4,5,6          6        1.1666...
# 8     1,3,5,7              4        2
# 9     1,2,4,5,7,8          6        1.5
# 10    1,3,7,9              4        2.5
# 11    1,2,3,4,5,6,7,8,9,10 10       1.1
# 12    1,5,7,11             4        3.0
# 13    1 - 12               12       1.0833
# 14    1                    6        2.333
# 15


# It can be seen that n=6 produces a maximum n/φ(n) for n  10.

# Find the value of n <= 1,000,000 for which n/φ(n) is a maximum.

require 'pp'
require 'prime'

class Fixnum
  $totients = {2 => 1.to_f}
  $factorizations = {1 => [1], 2 => [2]}

  def totient
    return $totients[self] if $totients[self]

    t = 0
    case
    when Prime.prime?(self)
      t = self -1
    when self.even?
      m = self / 2
      if m.even?
        t = m.totient  * 2
      else
        t = m.totient
      end
    else
      factors = self.prime_factorization.uniq
      t = factors.inject(self) { |p, n| p *= (1 - (1.0/n)) }.to_i
    end

    $totients[self] = t.to_f
  end

  def prime_factorization
    return [self] if Prime.prime?(self)
    return $factorizations[self] if $factorizations[self]

    root = Math.sqrt(self).floor
    root.downto(1) do |x|
      if self % x == 0 then
        f = x.prime_factorization + (self / x).prime_factorization
        $factorizations[self] = f
        return f
      end
    end
  end
end

max_t_n = 3
max_n = 6
max_t = 2

(6..1_000_000).step(6).each do |x|
  t = x.totient
  if x/t > max_t_n
    max_t_n = x/t
    max_n = x
    max_t = t
  end
end

puts max_t_n
puts max_n
puts max_t

# 5.539388020833333
# 510510
# 92160.0

# real	0m11.145s
# user	0m11.063s
# sys	0m0.078s
