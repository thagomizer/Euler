# A perfect number is a number for which the sum of its proper divisors is
# exactly equal to the number. For example, the sum of the proper divisors of 28
# would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

# A number n is called deficient if the sum of its proper divisors is less than
# n and it is called abundant if this sum exceeds n.

# As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest
# number that can be written as the sum of two abundant numbers is 24. By
# mathematical analysis, it can be shown that all integers greater than 28123
# can be written as the sum of two abundant numbers. However, this upper limit
# cannot be reduced any further by analysis even though it is known that the
# greatest number that cannot be expressed as the sum of two abundant numbers is
# less than this limit.

# Find the sum of all the positive integers which cannot be written as the sum
# of two abundant numbers.

require 'pp'

limit = ARGV[0] || 100_000
limit = limit.to_i

def divisor_sum(n)
  l = Math.sqrt(n).to_i
  sum = 1
  while l > 1 do
    if (n % l) == 0 then
      sum += l
      sum += (n/l) unless l == (n/l)
    end
    l -= 1
  end
  sum
end

abundant_list = []
abundants = []

limit.times do |n|
  next if n == 0
  if n < divisor_sum(n) then
    abundant_list[n] = true
    abundants << n
  end
end

result = 0

limit.times do |n|
  is_sum = false
  abundants.each do |a|
    if n < a then
      break
    elsif abundant_list[n - a] then
      is_sum = true
      break
    end
  end
  result += n unless is_sum
end

puts result

# 4179871

# real	0m33.843s
# user	0m29.700s
# sys	0m0.100s
