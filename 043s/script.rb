# The number, 1406357289, is a 0 to 9 pandigital number because it is made up of
# each of the digits 0 to 9 in some order, but it also has a rather interesting
# sub-string divisibility property.

# Let d1 be the 1st digit, d2 be the 2nd digit, and so on. In this way, we note
# the following:

#     d2d3d4=406 is divisible by 2
#     d3d4d5=063 is divisible by 3
#     d4d5d6=635 is divisible by 5
#     d5d6d7=357 is divisible by 7
#     d6d7d8=572 is divisible by 11
#     d7d8d9=728 is divisible by 13
#     d8d9d10=289 is divisible by 17
# Find the sum of all 0 to 9 pandigital numbers with this property.

require 'pp'


$primes = [1, 2, 3, 5, 7, 11, 13, 17]

def sub_string_property? n
  i = 0
  n.each_cons(3) do |substring|
    x = substring.join.to_i
    return false unless x % $primes[i] == 0
    i += 1
  end
  true
end

pandigitals = (0..9).to_a.permutation.to_a


results = []

pandigitals.each do |p|
  if sub_string_property? p then
    pp p
    results << p.join.to_i
  end
end



puts "SUM #{results.inject(:+)}"


# [1, 4, 0, 6, 3, 5, 7, 2, 8, 9]
# [1, 4, 3, 0, 9, 5, 2, 8, 6, 7]
# [1, 4, 6, 0, 3, 5, 7, 2, 8, 9]
# [4, 1, 0, 6, 3, 5, 7, 2, 8, 9]
# [4, 1, 3, 0, 9, 5, 2, 8, 6, 7]
# [4, 1, 6, 0, 3, 5, 7, 2, 8, 9]
# SUM 16695334890

# real	1m36.241s
# user	1m17.461s
# sys	0m0.924s
