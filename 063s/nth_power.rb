# The 5-digit number, 16807=7**5, is also a fifth power. Similarly, the 9-digit
# number, 134217728=8**9, is a ninth power.

# How many n-digit positive integers exist which are also an nth power?
require 'pp'

count = 0
24.times do |power|
  i = 1
  max = 10**power
  product = 0
  while product < max do
    product = i**power
    if product.to_s.length == power then
      count += 1
    end
    i += 1
  end
end

pp count

# 49

# real	0m0.012s
# user	0m0.007s
# sys	0m0.003s
