# Some positive integers n have the property that the sum [ n + reverse(n) ]
# consists entirely of odd (decimal) digits. For instance, 36 + 63 = 99 and
# 409 + 904 = 1313. We will call such numbers reversible; so 36, 63, 409, and
# 904 are reversible. Leading zeroes are not allowed in either n or reverse(n).

# There are 120 reversible numbers below one-thousand.

# How many reversible numbers are there below one-billion (109)?

require 'pp'

class Integer
  def reverse
    self.to_s.reverse.to_i
  end

  def reversible?
    return false if self % 10 == 0
    sum = self + self.reverse
    sum.to_s =~ /^[13579]+$/
  end

  def all_even?
    self.to_s =~ /^[02468]+$/
  end
end

# 100_000.times do
#   987_654_321.reverse
# end

count = 0

(1..1_000_000_000).each do |n|
  puts "*" if n % 1_000_000 == 0
  next if n.reverse < n
  next if n.all_even?
  if n.reversible? then
    count += 2
  end
end

puts count
