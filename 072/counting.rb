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
  $totients = {1 => 1, 2 => 1}
  $factors = {1 => [1, 1], 2 => [2, 1]}
  $real_factors = { 1 => [], 2 => [[2, 1]]}

  def totient
    return $totients[self] if $totients[self]

    $totients[self] = case
                      when Prime.prime?(self)
                        self - 1
                      when self.even?
                        m = self / 2
                        if m.even?
                          m.totient * 2
                        else
                          m.totient
                        end
                      else
                        m, n = simple_factors
                        d = m.gcd(n)
                        (m.totient * n.totient * d/d.totient)
                      end
  end

  def simple_factors
    $factors[self] ||= begin
                         root = Math.sqrt(self).floor
                         root.downto(1) do |x|
                           next unless self % x == 0
                           break [x, self / x]
                         end
                       end
  end

  def µ
    $real_factors[self] ||= Prime.prime_division(self)
    if self.square_free?
      return 1 if $real_factors[self].length.even?
      return -1
    else
      return 0
    end
  end

  def square_free?
    $real_factors[self] ||= Prime.prime_division(self)
    $real_factors[self].none? { |_, pow| pow > 1 }
  end
end

(1..20).each { |n| puts n.µ }

# def count_fractions (denom)
#   (1..denom).map { |n| n.totient }.inject(:+) - 1
# end

# puts count_fractions(1_000_000)
