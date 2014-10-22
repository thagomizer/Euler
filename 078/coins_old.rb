# Let p(n) represent the number of different ways in which n coins can
# be separated into piles. For example, five coins can separated into
# piles in exactly seven different ways, so p(5)=7.

# OOOOO
# OOOO   O
# OOO   OO
# OOO   O   O
# OO   OO   O
# OO   O   O   O
# O   O   O   O   O
# Find the least value of n for which p(n) is divisible by one million.

require 'pp'

$summation_cache = Hash.new { |h, k| h[k] = [0, 1] }

def summations(n, max)
  return (n / 2) + 1 if max == 2
  return (n + 3)**2 / 12 if max == 3

  if $summation_cache[n][max]
    return $summation_cache[n][max]
  end

  t = case
  when max == 0
    0
  when n < max
    summations(n, max - 1)
  when n == max
    1 + summations(n, max - 1)
  else
    summations(n, max - 1) +
      summations(n - max, max)
  end

  $summation_cache[n][max] = t

  t
end

n = ARGV[0].to_i

1.upto(n) do |x|
  s = summations(n, n)
  if s % 1_000_000 == 0
    p "Number of coins #{n}"
    p "Piles #{s}"
  end

  if x == n
    p "Number of coins #{n}"
    p "Piles #{s}"
  end
end
