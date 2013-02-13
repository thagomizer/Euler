# A permutation is an ordered arrangement of objects. For example, 3124 is one
# possible permutation of the digits 1, 2, 3 and 4. If all of the permutations
# are listed numerically or alphabetically, we call it lexicographic order. The
# lexicographic permutations of 0, 1 and 2 are:

# 012   021   102   120   201   210

# What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4,
# 5, 6, 7, 8 and 9?

require 'pp'

def factorial(x)
  if x == 1
    return 1
  end
  x * factorial(x - 1)
end

def permutation(ary, num)
  if num == 0
    return ary
  else
    res = []
    # Find the first digit
    size = factorial(ary.length - 1)
    index = num / size
    res << ary.delete_at(index)
    res + permutation(ary, num % size)
  end
end

a = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
n = 1_000_000

pp permutation(a, n - 1).join

# "2783915460"

# real	0m0.030s
# user	0m0.007s
# sys	0m0.004s
