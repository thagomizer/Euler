x = 100

squares = []
(1..x).each do |n|
  squares << (n * n)
end

sum_of_sqrs = squares.inject{|sum, n| sum += n}

p sum_of_sqrs

total = 0
(1..x).each do |n|
  total += n
end

sqr_of_sum = total * total

puts sqr_of_sum

puts sqr_of_sum - sum_of_sqrs

# 338350
# 25502500
# 25164150

# real	0m0.014s
# user	0m0.003s
# sys	0m0.003s
