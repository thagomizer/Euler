# The following iterative sequence is defined for the set of positive integers:

# n  n/2 (n is even)
# n  3n + 1 (n is odd)

# Using the rule above and starting with 13, we generate the following sequence:

# 13  40  20  10  5  16  8  4  2  1
# It can be seen that this sequence (starting at 13 and finishing at 1)
# contains 10 terms. Although it has not been proved yet (Collatz Problem),
# it is thought that all starting numbers finish at 1.

# Which starting number, under one million, produces the longest chain?

$lengths = {}

def next_in_sequence(n)
  return ((n*3)+1) if n % 2 == 1
  n/2
end

max_chain_length = 0
winner = 0
1_000_000.times do |x|
  chain_length = 0

  n = next_in_sequence(x)
  while n > 1
    if $lengths[n] then
      chain_length += $lengths[n] + 1
      break
    end
    chain_length += 1
    n = next_in_sequence(n)
  end

  $lengths[x] = chain_length

  if chain_length > max_chain_length then
    max_chain_length = chain_length
    winner = x
  end
end

puts "Winner #{winner} Max Chain Length #{max_chain_length}"

# Winner 837799 Max Chain Length 523

# real	0m12.931s
# user	0m12.304s
# sys	0m0.070s
