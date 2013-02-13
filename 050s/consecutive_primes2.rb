# The prime 41, can be written as the sum of six consecutive primes:

# 41 = 2 + 3 + 5 + 7 + 11 + 13
# This is the longest sum of consecutive primes that adds to a prime below
# one-hundred.

# The longest sum of consecutive primes below one-thousand that adds to a prime,
# contains 21 terms, and is equal to 953.

# Which prime, below one-million, can be written as the sum of the most
# consecutive primes?

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

  def self.primes
    $primes.reject{|k, v| !v}.keys
  end
end

max_number = 1_000_000

(3..max_number).each do |x|
  x.prime?
end

max = [0, 0]
main_primes = Fixnum.primes.sort

# Find the max cons size
sum = 0
i = 0
while sum < max_number
  sum += main_primes[i]
  i += 1
end

i.downto(2) do |cons_size|
  main_primes.each_cons(cons_size) do |cons|
    sum = cons.inject(:+)
    break if sum > max_number
    if sum.prime? and sum < max_number then
      pp [cons_size, sum]
      exit 0
    end
  end
end


# time ruby consecutive_primes2.rb
# [543, 997651]

# real	0m57.453s
# user	0m51.587s
# sys	0m0.183s
