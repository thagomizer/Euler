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

#
# phi = (1 + Math.sqrt(5))/2
# psi = (1 - Math.sqrt(5))/2
#
# Fn = (phi^n - psi^n)/Math.sqrt(5)
#

require 'pp'

$fibs = [0, 1, 1]

def fib n
  result = $fibs[n]
  return result if result

  if n % 2 == 0 then
    x = n/2
    result = fib(x) * (fib(x + 1) + fib(x - 1))
  else
    x = (n + 1)/2
    result = fib(x - 1)**2 + fib(x)**2
  end
  $fibs[n] = result
end

def pandigital digits
  correct_digits = %w(1 2 3 4 5 6 7 8 9)
  return (digits.sort == correct_digits)
end


def last_nine_pandigital n
  return false if n < 1_000_000_000
  digits = n.to_s.split(//)

  last_nine = digits[-9..-1]
  pandigital(last_nine)
end

possibilities = []

fn1 = 1
fn2 = 1
i = 2
count = 120
until count == 0 do
  i += 1
  new = fn1 + fn2 % 1_000_000_000
  if last_nine_pandigital(new) then
    possibilities << i
    count -= 1
  end
  fn1 = fn2
  fn2 = new
end

possibilities.each do |p|
  x = fib(p)
  digits = x.to_s.split(//)[0..8]
  if pandigital(digits)
    puts "FOUND IT"
    puts p
    break
  end
end

# time ruby fib2.rb
# FOUND IT
# 329468

# real	1m4.728s
# user	1m0.163s
# sys	0m0.125s
