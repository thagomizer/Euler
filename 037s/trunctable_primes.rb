# The number 3797 has an interesting property. Being prime itself, it is
# possible to continuously remove digits from left to right, and remain prime at
# each stage: 3797, 797, 97, and 7. Similarly we can work from right to
# left: 3797, 379, 37, and 3.

# Find the sum of the only eleven primes that are both truncatable from left to
# right and right to left.

# NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.
require 'pp'

class Fixnum
  $primes = {}
  $primes[0] = false
  $primes[1] = false

  def prime?
    return $primes[self] unless $primes[self].nil?

    root = Math.sqrt(self).to_i
    (2..root).each do |x|
      if self % x == 0
        $primes[self] = false
        return false
      end
    end
    $primes[self] = true
    true
  end

  def to_digits
    self.to_s.split(//)
  end
end

def trunctable n
  digits = n.to_digits

  until digits.empty? do
    return false unless digits.join.to_i.prime?
    digits.pop
  end

  digits = n.to_digits
  digits.shift
  until digits.empty? do
    return false unless digits.join.to_i.prime?
    digits.shift
  end

  return true
end

trunctable_primes = []

10.upto(1_000_000) do |x|
  x_string = x.to_s
  next if x_string =~ /^[14689]/
  next if x_string =~ /[14589]$/
  if x > 100 then
    next if x_string =~ /[02468]/
  end

  if trunctable x then
    puts "found #{x}"
    trunctable_primes << x
    if trunctable_primes.length > 11
      puts "limited"
      break
    end
  end
end

pp trunctable_primes
pp trunctable_primes.inject(:+)

# [23, 37, 53, 73, 313, 317, 373, 797, 3137, 3797, 739397]
# 748317

# real	0m3.381s
# user	0m3.211s
# sys	0m0.008s
