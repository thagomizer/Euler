# The first known prime found to exceed one million digits was discovered in
# 1999, and is a Mersenne prime of the form 269725931; it contains exactly
# 2,098,960 digits. Subsequently other Mersenne primes, of the form 2p1, have
# been found which contain more digits.

# However, in 2004 there was found a massive non-Mersenne prime which contains
# 2,357,207 digits: 28433 * 2**7_830_457 + 1.

# Find the last ten digits of this prime number.
require 'pp'


# Find the last 3 digits of 2^20

product = 1
7_830_457.times do
  product = product * 2
  product = product % 10_000_000_000
end

answer = (product * 28433 + 1) % 10_000_000_000

pp answer

# 8739992577

# real	0m3.969s
# user	0m3.956s
# sys	0m0.005s
