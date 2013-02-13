# We shall say that an n-digit number is pandigital if it makes use of all the
# digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is
# also prime.

# What is the largest n-digit pandigital prime that exists?
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


found = false
9.downto(1) do |n|
  permutations = (1..n).to_a.permutation.to_a.map{|x| x.join.to_i}.reverse

  permutations.each do |p|
    if p.prime? then
      puts p
      found = true
      break
    end
  end
  break if found
end

# 7652413

# real	0m8.293s
# user	0m7.145s
# sys	0m0.124s

