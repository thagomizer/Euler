# -*- coding: utf-8 -*-
require 'pp'

# Consider the fraction, n/d, where n and d are positive integers. If
# n < d and HCF(n,d)=1, it is called a reduced proper fraction.

# If we list the set of reduced proper fractions for d <= 8 in
# ascending order of size, we get:

# 1/8, 1/7, 1/6, 1/5, 1/4, 2/7, 1/3, 3/8, 2/5, 3/7, 1/2, 4/7, 3/5,
# 5/8, 2/3, 5/7, 3/4, 4/5, 5/6, 6/7, 7/8

# It can be seen that there are 21 elements in this set.

# How many elements would be contained in the set of reduced proper
# fractions for d <= 1,000,000?

require 'prime'

class Fixnum
  $factors = {}

  def µ
    if self.square_free?
      self.factors.length.even? ? 1 : -1
    else
      0
    end
  end

  def square_free?
    self.factors.none? { |_, pow| pow > 1 }
  end

  def factors
    $factors[self] ||= Prime.prime_division(self)
  end
end

def count_fractions n
  (1..n).inject(0) { |sum, k| sum + (k.µ * (n/k)**2) } / 2
end

puts count_fractions(1_000_000)

# NOT FAST ENOUGH...GRRR
# 303963552391

# real	1m24.769s
# user	1m24.196s
# sys	0m0.496s
