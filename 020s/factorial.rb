# n! means n * (n - 1) * ... * 3 * 2 * 1

# For example, 10! = 10 * 9 * ... * 3 * 2 * 1 = 3628800,
# and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

# Find the sum of the digits in the number 100!

fact = (1..100).inject(1){|factorial, n| factorial * n}
puts fact.to_s.split('').inject(0){|sum, n| sum + n.to_i}

# 648

# real	0m0.007s
# user	0m0.003s
# sys	0m0.003s
