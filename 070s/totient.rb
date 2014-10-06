# Euler's Totient function, phi(n) [sometimes called the phi
# function], is used to determine the number of positive numbers less
# than or equal to n which are relatively prime to n. For example, as
# 1, 2, 4, 5, 7, and 8, are all less than nine and relatively prime to
# nine, phi(9)=6.

# The number 1 is considered to be relatively prime to every positive
# number, so phi(1)=1.

# Interestingly, phi(87109)=79180, and it can be seen that 87109 is a
# permutation of 79180.

# Find the value of n, 1 < n < 10^7, for which phi(n) is a permutation of
# n and the ratio n/phi(n) produces a minimum

require 'pp'
require 'prime'

class Fixnum
  $totients = {1 => 1.to_f, 2 => 1.to_f}
  $factors = {1 => [1, 1], 2 => [2, 1]}

  def totient
    return $totients[self] if $totients[self]

    $totients[self] = case
                      when Prime.prime?(self)
                        t = self - 1
                      when self.even?
                        m = self / 2
                        if m.even?
                          t = m.totient  * 2
                        else
                          t = m.totient
                        end
                      else
                        m, n = simple_factors
                        d = m.gcd(n)
                        (m.totient * n.totient * d/d.totient).to_f
                      end
  end

  def simple_factors
    n = Prime.prime_division(self)[-1][0]
    $factors[self] ||= [n, self/n]
  end

  def permutation?(n)
    self.to_s.split('').sort == n.to_s.split('').sort
  end
end

primes = []
Prime.each(10_000) do |prime|
  primes.unshift(prime)
  break if prime > 4_000
end

min_ratio = 10_000
min_n = 0

primes.permutation(2).each do |a, b|
  n = a * b
  next if n < 5_000_000
  next if n > 10**7
  phi = n.totient
  ratio = (n/phi)
  next unless min_ratio > ratio
  if phi.to_i.permutation?(n)
    min_ratio = ratio
    min_n = n
  end
end

pp min_ratio
pp min_n
