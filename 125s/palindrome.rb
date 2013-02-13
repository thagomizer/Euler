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

def sum_of_squares(total, starting_num, can_be_done)
  return false if starting_num < 1
  sqr = starting_num**2
  rest = total - sqr
#  puts "sqr #{sqr} rest #{rest}"
  if rest < 0 then
    return false
  elsif rest == 0 and can_be_done
    return true
  end
  sum_of_squares(rest, starting_num - 1, true)
end

palindromes = (1..100_000_000).reject{|x| !x.palindrome?}

results = []

palindromes.each do |p|
  found = false

  Math.sqrt(p).to_i.downto(2) do |n|
    found = sum_of_squares(p, n, false)
    break if found
  end

  results << p if found
end

pp results.length
pp results.inject(:+)
