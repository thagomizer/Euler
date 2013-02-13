# The arithmetic sequence, 1487, 4817, 8147, in which each of the terms
# increases by 3330, is unusual in two ways: (i) each of the three terms are
# prime, and, (ii) each of the 4-digit numbers are permutations of one another.

# There are no arithmetic sequences made up of three 1-, 2-, or 3-digit primes,
# exhibiting this property, but there is one other 4-digit increasing sequence.

# What 12-digit number do you form by concatenating the three terms in this
# sequence?
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

  def digits
    self.to_s.split(//)
  end
end

my_primes = []

(1_000..10_000).each do |x|
  my_primes << x if x.prime?
end

max_prime = my_primes.last

found_count = 0
my_primes.each do |prime|
  permutations = prime.digits.permutation.to_a.map{|p| p.join.to_i}
  permutations.reject!{|p| !(p.prime? and p > prime)}

  permutations.each do |perm|
    diff = perm - prime
    if permutations.include?(perm + diff)
      puts "#{prime}#{perm}#{perm + diff}"
      found_count += 1
      break
    end
  end
  break if found_count >  1
end

# time ruby prime_sequence.rb 
# 148748178147
# 296962999629

# real	0m0.152s
# user	0m0.128s
# sys	0m0.005s
