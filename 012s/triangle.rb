# The sequence of triangle numbers is generated by adding the natural numbers. So the 7th triangle number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28. The first ten terms would be:

# 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

# Let us list the factors of the first seven triangle numbers:

#  1: 1
#  3: 1,3
#  6: 1,2,3,6
# 10: 1,2,5,10
# 15: 1,3,5,15
# 21: 1,3,7,21
# 28: 1,2,4,7,14,28
# We can see that 28 is the first triangle number to have over five divisors.

# What is the value of the first triangle number to have over five hundred divisors?

def factors(n)
  (1..n).to_a.select{|x| n % x == 0}
end

def factor_count(n)
  factor_count = 0
  s = Math.sqrt(n).floor
  (1..s).each do |x|
    factor_count += 1 if n % x == 0
  end
  factor_count = factor_count * 2
  factor_count
end

# Generate the first n triangle numbers
def triangle(n)
  (n**2 + n) / 2
end

(1000..1000000).each do |x|
  num = triangle x
  factor_count = factor_count(num)
  if factor_count > 500 then
    puts "FOUND IT"
    puts "#{num}"
    exit
  end
  puts "#{x}, #{num}, #{factor_count}" if x % 10000 == 0
end

# 10000, 50005000, 80
# FOUND IT
# 76576500

# real	0m26.299s
# user	0m25.930s
# sys	0m0.035s
