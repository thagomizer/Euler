# If we take 47, reverse and add, 47 + 74 = 121, which is palindromic.

# Not all numbers produce palindromes so quickly. For example,

#     349 + 943 = 1292,
#     1292 + 2921 = 4213
#     4213 + 3124 = 7337

# That is, 349 took three iterations to arrive at a palindrome.

# Although no one has proved it yet, it is thought that some numbers, like 196,
# never produce a palindrome. A number that never forms a palindrome through the
# reverse and add process is called a Lychrel number. Due to the theoretical
# nature of these numbers, and for the purpose of this problem, we shall assume
# that a number is Lychrel until proven otherwise. In addition you are given
# that for every number below ten-thousand, it will either (i) become a
# palindrome in less than fifty iterations, or, (ii) no one, with all the
# computing power that exists, has managed so far to map it to a palindrome. In
# fact, 10677 is the first number to be shown to require over fifty iterations
# before producing a palindrome: 4668731596684224866951378664 (53 iterations,
# 28-digits).

# Surprisingly, there are palindromic numbers that are themselves Lychrel
# numbers; the first example is 4994.

# How many Lychrel numbers are there below ten-thousand?

# NOTE: Wording was modified slightly on 24 April 2007 to emphasise the
# theoretical nature of Lychrel numbers.
require 'pp'

class Numeric
  def lychrel?
    i = 1
    sum = self + self.reverse
    while i < 51 do
      return false if sum.palindrome?
      sum = sum + sum.reverse
      i += 1
    end
    true
  end

  def reverse
    self.to_s.reverse.to_i
  end

  def palindrome?
    self.to_s == self.to_s.reverse
  end
end

puts "349 Expect false Is #{349.lychrel?}"
puts "10677 Expect true Is #{10677.lychrel?}"
puts "4994 Expect true Is #{4994.lychrel?}"

lychrel_count = 0
1.upto(10_000) do |x|
  lychrel_count += 1 if x.lychrel?
end

puts
puts lychrel_count


# 349 Expect false Is false
# 10677 Expect true Is true
# 4994 Expect true Is true

# 249

# real	0m0.233s
# user	0m0.226s
# sys	0m0.005s
