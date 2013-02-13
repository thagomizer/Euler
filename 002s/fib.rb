#!/usr/bin/ruby -w

# Find the sum of all even valued fibbinoci numbers that are less than 4 million

# Generate all the fib numbers less than 4 million
x = 1
y = 2
evens = [2]

while y < 4000000 do
  t = x + y
  x = y
  y = t
  evens << y if y % 2 == 0
end

puts evens.inject{|sum, n| sum += n }

# 4613732

# real	0m0.007s
# user	0m0.003s
# sys	0m0.003s
