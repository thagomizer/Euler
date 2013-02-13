# 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.

# Find the sum of all numbers which are equal to the sum of the factorial of their digits.

# Note: as 1! = 1 and 2! = 2 are not sums they are not included.

require 'pp'

def factorial(x)
  if x <= 1
    return 1
  end
  x * factorial(x - 1)
end

$factorials = (0..9).map{|x| factorial(x)}

def curious?(num)
  digits = num.to_s.split('').map{|x| x.to_i}
  sum = digits.inject(0){|sum, n| sum + $factorials[n]}
  puts num if sum == num
  return sum == num
end

result = (10..2_000_000).inject(0){|sum, x| curious?(x) ? sum + x : sum}
puts result

# 145
# 40585
# 40730

# real	0m52.767s
# user	0m50.720s
# sys	0m0.102s
