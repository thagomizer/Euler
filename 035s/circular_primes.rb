# The number, 197, is called a circular prime because all rotations of the
# digits: 197, 971, and 719, are themselves prime.

# There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71,
# 73, 79, and 97.

# How many circular primes are there below one million?

require 'pp'

class Fixnum

  def prime?
    root = Math.sqrt(self).to_i
    (2..root).each do |x|
      if self % x == 0 then
        return false
      end
    end
    true
  end
end


def all_rotations(x)
  result = [x]
  digits = x.to_s.split('').map{|d| d.to_i}

  (digits.length - 1).times do
    temp = digits.shift
    digits << temp
    result << digits.join.to_i
  end
  result
end


circulars = []

(2..1_000_000).each do |n|
  rotations = all_rotations(n)
  not_prime = rotations.find{|x| !x.prime?}
  circulars << n unless not_prime
end

pp circulars.length

# 55

# real	1m38.438s
# user	1m35.796s
# sys	0m0.189s
