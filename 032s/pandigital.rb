# We shall say that an n-digit number is pandigital if it makes use of all the
# digits 1 to n exactly once; for example, the 5-digit number, 15234, is 1
# through 5 pandigital.

# The product 7254 is unusual, as the identity, 39  186 = 7254, containing
# multiplicand, multiplier, and product is 1 through 9 pandigital.

# Find the sum of all products whose multiplicand/multiplier/product identity
# can be written as a 1 through 9 pandigital.

# HINT: Some products can be obtained in more than one way so be sure to only
# include it once in your sum.

require 'pp'

def find_products a
  products = []

  p = a[-4..-1].join.to_i

  3.times do |x|
    f1 = a[0..x].join.to_i
    f2 = a[x+1..4].join.to_i

    next if p < f1 or p < f2
    next unless f1 < f2


    if f1 * f2 == p then
      products << p
      pp "#{f1} * #{f2} = #{p}"
    end
  end

  products
end

permutations = (1..9).to_a.permutation.to_a

products = []
permutations.each do |p|
  products += find_products(p)
  break if p[0] > 5
end

products.uniq!
pp products
pp products.inject(:+)


# "12 * 483 = 5796"
# "18 * 297 = 5346"
# "27 * 198 = 5346"
# "28 * 157 = 4396"
# "39 * 186 = 7254"
# "4 * 1738 = 6952"
# "4 * 1963 = 7852"
# "42 * 138 = 5796"
# "48 * 159 = 7632"
# [5796, 5346, 4396, 7254, 6952, 7852, 7632]
# 45228

# real	0m13.383s
# user	0m11.824s
# sys	0m0.116s
