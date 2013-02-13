#!/usr/bin/ruby -w

# Find the greatest product of five consecutive digits in the 1000-digit number.

filename = ARGV[0] || "number.txt"

file = File.open(filename, "r")
digits = [0, 0, 0, 0, 0]
max_product = 0

s = file.readline
nums = s.split ""
nums.each do |n|
  digits << n.to_i
  digits.delete_at 0
  product = digits.inject(1) {|prod, d| prod * d}
  max_product = product if product > max_product
end

puts max_product


# 40824

# real	0m0.031s
# user	0m0.010s
# sys	0m0.004s
