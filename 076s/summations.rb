# It is possible to write five as a sum in exactly six different ways:

# 4 + 1
# 3 + 2
# 3 + 1 + 1
# 2 + 2 + 1
# 2 + 1 + 1 + 1
# 1 + 1 + 1 + 1 + 1

# How many different ways can one hundred be written as a sum of at
# least two positive integers?

require 'pp'

$summation_cache = Hash.new { |h, k| h[k] = [] }

def summations(n, max)
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
p n
p summations(n, n - 1)

# "100"
# 190569291

# real	0m0.113s
# user	0m0.066s
# sys	0m0.046s
