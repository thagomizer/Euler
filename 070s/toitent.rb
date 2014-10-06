# Euler's Totient function, phi(n) [sometimes called the phi
# function], is used to determine the number of positive numbers less
# than or equal to n which are relatively prime to n. For example, as
# 1, 2, 4, 5, 7, and 8, are all less than nine and relatively prime to
# nine, phi(9)=6.

# The number 1 is considered to be relatively prime to every positive
# number, so phi(1)=1.

# Interestingly, phi(87109)=79180, and it can be seen that 87109 is a
# permutation of 79180.

# Find the value of n, 1 < n < 107, for which phi(n) is a permutation of
# n and the ratio n/phi(n) produces a minimum

require 'pp'
require 'prime'

class Fixnum
  $totients = {2 => 1.to_f}
  $factorizations = {1 => [1], 2 => [2]}

  def totient
    return 1 if self == 1

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

  def permutation?(n)
    self.to_s.split('').sort == n.to_s.split('').sort
  end
end

min = {:phi_n => 100_000, :n => 0}

2.upto(107) do |n|
  phi = n.totient
  next unless phi.to_i.permutation?(n)
  if min[:phi_n] > (n/phi)
    min[:phi_n] = n/phi
    min[:n] = n
  end
end

pp min

{:phi_n=>1.75, :n=>21}

real	0m0.122s
user	0m0.072s
sys	0m0.049s
