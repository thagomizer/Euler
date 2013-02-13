# The Fibonacci sequence is defined by the recurrence relation:

# Fn = Fn1 + Fn2, where F1 = 1 and F2 = 1.
# It turns out that F541, which contains 113 digits, is the first Fibonacci
# number for which the last nine digits are 1-9 pandigital (contain all the
# digits 1 to 9, but not necessarily in order). And F2749, which contains 575
# digits, is the first Fibonacci number for which the first nine digits are 1-9
# pandigital.

# Given that Fk is the first Fibonacci number for which the first nine digits
# AND the last nine digits are 1-9 pandigital, find k.

# First nine ary[0..9]
# Last nine ary[-2..-1]
require 'pp'

$fibs = [0, 1, 1]

def pandigital n
  return false if n < 100_000_000_000_000_000

  digits = n.to_s.split(//)

  first_nine = digits[0..9]
  last_nine  = digits[-9..-1]

  correct_digits = %w(1 2 3 4 5 6 7 8 9)
  return ((last_nine.sort == correct_digits) and
          (first_nine.sort == correct_digits))
end

fn1 = 1
fn2 = 1
i = 2
found = false
until found do
  puts "*" if i % 10000 == 0
  new = fn1 + fn2
  found = pandigital(new)
  fn1 = fn2
  fn2 = new
  i += 1
end

puts i

