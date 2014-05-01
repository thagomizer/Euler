# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

# Find the sum of all the primes below two million.

# class Fixnum
#   def prime?
#     root = Math.sqrt(self).to_i
#     (2..root).each do |x|
#       if self % x == 0 then
#         return false
#       end
#     end
#     true
#   end
# end
require 'prime'

sum = 0
Prime.each(2_000_000) do |i|
  sum += i
end
puts sum

# 142913828922

# real	1m30.198s
# user	1m29.146s
# sys	0m0.110s
