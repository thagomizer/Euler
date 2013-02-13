# 2520 is the smallest number that can be divided by each of the numbers from 1
# to 10 without any remainder.

# What is the smallest positive number that is evenly divisible by all of the
# numbers from 1 to 20?
require 'pp'

class Fixnum
  $primes = {0 => false, 1 => false, 2 => true}

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
end

factors = (2..20).to_a
primes = factors.select{|x| x.prime?}
# non_primes = factors.reject{|x| x.prime?}
# Must be at least the product of all the prime factors
min = primes.inject(:*)
num = min

found = false
until found do
  found = true
  factors.each do |f|
    unless num % f == 0
      found = false
      break
    end
  end

  num += min unless found
end

pp num

# 232792560

# real	0m0.015s
# user	0m0.008s
# sys	0m0.005s
