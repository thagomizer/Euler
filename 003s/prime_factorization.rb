#!/usr/bin/ruby -w
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

  def prime_factorization
    return [self] if self.prime?
    return [1] if self == 1

    root = Math.sqrt(self).ceil
    root.downto(1) do |x|
      if self % x == 0 then
        return x.prime_factorization + (self / x).prime_factorization
      end
    end
    puts "THERE WAS BADNESS"
  end
end

pp 600851475143.prime_factorization.sort.reverse[0]
# 6857

# real	0m0.161s
# user	0m0.155s
# sys	0m0.004s
