#!/usr/bin/ruby -w

# Find the greatest product of five consecutive digits in the 1000-digit number.

filename = ARGV[0] || "number.txt"
number = ""
File.open(filename, "r") do |f|
  number = f.read
end

max_product = 0
digits = number.split ""
digits.map! { |n| n.to_i }
digits.each_cons(5) do |ary|
  product = ary.inject(1) { |prod, d| prod * d }
  max_product = product if product > max_product
end

puts max_product


# 40824

# real	0m0.031s
# user	0m0.010s
# sys	0m0.004s
