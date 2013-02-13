# The palindromic number 595 is interesting because it can be written as the
# sum of consecutive squares: 62 + 72 + 82 + 92 + 102 + 112 + 122.

# There are exactly eleven palindromes below one-thousand that can be written
# as consecutive square sums, and the sum of these palindromes is 4164. Note
# that 1 = 0^2 + 1^2 has not been included as this problem is concerned with the
# squares of positive integers.

# Find the sum of all the numbers less than 108 that are both palindromic and
# can be written as the sum of consecutive squares.
require 'pp'

class Fixnum
  def palindrome?
    self.to_s == self.to_s.reverse
  end
end

squares = []
@palindromes = []
1.upto(10_000) do |x|
  squares << x**2
end

def sum_of_squares(to_use, sum, max, can_use)
  return false if to_use.empty?

  sum += to_use[0]

  return false if sum > max

  if sum.palindrome? and can_use
    @palindromes << sum
  end

  sum_of_squares(to_use[1..-1], sum, max, true)
end

squares.each_index do |index|
  sum_of_squares(squares[index..-1], 0, 100_000_000, false)
end

@palindromes.uniq!
pp @palindromes.length  #166
pp @palindromes.inject(:+) #2906969179


# 166
# 2906969179

# real	0m1.818s
# user	0m1.594s
# sys	0m0.007s

