# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

# Find the sum of all the primes below two million.
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

i = 3
sum = 2
while i < 2_000_000 do
  sum += i if i.prime?
  i += 2
end
pp sum

# 142913828922

# real	1m30.198s
# user	1m29.146s
# sys	0m0.110s
