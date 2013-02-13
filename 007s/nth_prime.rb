# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see
# that the 6th prime is 13.

# What is the 10,001st prime number?
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

prime_count = 0
num = 1
while prime_count < 10_001 do
  num += 1
  prime_count += 1 if num.prime?
end

pp num

# 104743

# real	0m1.865s
# user	0m1.834s
# sys	0m0.009s
