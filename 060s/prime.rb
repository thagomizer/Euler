# The primes 3, 7, 109, and 673, are quite remarkable. By taking any two primes
# and concatenating them in any order the result will always be prime. For
# example, taking 7 and 109, both 7109 and 1097 are prime. The sum of these four
# primes, 792, represents the lowest sum for a set of four primes with this
# property.

# Find the lowest sum for a set of five primes for which any two primes
# concatenate to produce another prime.

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

def prime_permutations(a, b)
  return "#{a}#{b}".to_i.prime? && "#{b}#{a}".to_i.prime?
end

def combinations(ary, length)
  return [] if length == 0
  return ary.map{|x| [x]} if length == 1

  combos = combinations(ary, length - 1)
  results = []

  ary.each do |a|
    combos.each do |p|
      next if p.include?(a)
      results.push(p + [a])
    end
  end

  return results
end

primes = []
10_000.times do |n|
  primes << n if n.prime?
end
primes.delete(2)

0.upto(primes.length - 5) do |a_i|
  a = primes[a_i]
  (a_i + 1).upto(primes.length - 4) do |b_i|
    b = primes[b_i]
    next unless prime_permutations(a, b)

    (b_i + 1).upto(primes.length - 3) do |c_i|
      c = primes[c_i]
      next unless prime_permutations(a, c)
      next unless prime_permutations(b, c)

      (c_i + 1).upto(primes.length - 2) do |d_i|
        d = primes[d_i]
        next unless prime_permutations(a, d)
        next unless prime_permutations(b, d)
        next unless prime_permutations(c, d)

        (d_i + 1).upto(primes.length - 1) do |e_i|
          e = primes[e_i]
          next unless prime_permutations(a, e)
          next unless prime_permutations(b, e)
          next unless prime_permutations(c, e)
          next unless prime_permutations(d, e)

          puts "A:#{a} B:#{b} C:#{c} D:#{d} E:#{e}"
          puts "#{a + b + c + d + e}"
          exit
        end
      end
    end
  end
end

# A:13 B:5197 C:5701 D:6733 E:8389
# 26033

# real	0m15.673s
# user	0m15.281s
# sys	0m0.035s
