# The Fibonacci sequence is defined by the recurrence relation:

# Fn = Fn1 + Fn2, where F1 = 1 and F2 = 1.
# Hence the first 12 terms will be:

# F1 = 1
# F2 = 1
# F3 = 2
# F4 = 3
# F5 = 5
# F6 = 8
# F7 = 13
# F8 = 21
# F9 = 34
# F10 = 55
# F11 = 89
# F12 = 144
# The 12th term, F12, is the first term to contain three digits.

# What is the first term in the Fibonacci sequence to contain 1000 digits?
require 'pp'

if ARGV[0]
  $target_digit_count = ARGV[0].to_i
else
  $target_digit_count = 1000
end

def fib(n0, n1, max_iterations, iterations)
  n2 = n0 + n1
  if max_iterations == iterations then
    return [n1, n2, iterations + 1]
  elsif n2.to_s.length == $target_digit_count then
    return [iterations + 1]
  else
    fib(n1, n2, max_iterations, (iterations + 1))
  end
end

def recursive_fib
  x = [1, 1, 2]
  term_num = 0
  while x.length > 1 do
    term_num += x[2]
    x = fib(x[0], x[1], 100, 0)
  end
  term_num += x[0]
  term_num
end

puts "Answers #{recursive_fib}"

# Answers 4782

# real	0m0.440s
# user	0m0.429s
# sys	0m0.008s
