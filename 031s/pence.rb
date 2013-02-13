# -*- coding: undecided -*-
# In England the currency is made up of pound, £, and pence, p, and there are
# eight coins in general circulation:

# 1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).
# It is possible to make £2 in the following way:

# 1£1 + 150p + 220p + 15p + 12p + 31p
# How many different ways can £2 be made using any number of coins?
require 'pp'

# $coins = [1, 2, 5, 10, 20, 50, 100, 200]
$coins = [200, 100, 50, 20, 10, 5, 2, 1]

# Ways to build:

# +
# Don't use the first coin
# If you have an empty list the result is 0

def ways_to_build(amount_to_build, coins_to_use)
  return 0 if amount_to_build < 0
  return 1 if amount_to_build == 0
  return 0 if coins_to_use.empty?

  # Use the first coin
  count = ways_to_build(amount_to_build - coins_to_use[0], coins_to_use)

  # Don't use the first coin
  count += ways_to_build(amount_to_build, coins_to_use[1..-1])
end

pp ways_to_build(200, $coins)


# Method A
# Use the first coin so 3 - 2 = 1 is the amount remaining
# Recursively call ways_to_build on the amount remaining
#  Use the first coin so 1 - 1 = 0 is the amount remaining
#  Recursively call ways_to_build on the amount remaining
#    If the total is 0 there's one way to build so return 1
#    1
#  1 way to build at this level
# 1 way to build at this level
#
# Add to that the number of ways to build without using the first coin


# 73682

# real	0m9.329s
# user	0m9.005s
# sys	0m0.023s
