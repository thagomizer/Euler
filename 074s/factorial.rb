# The number 145 is well known for the property that the sum of the
# factorial of its digits is equal to 145:

# 1! + 4! + 5! = 1 + 24 + 120 = 145

# Perhaps less well known is 169, in that it produces the longest
# chain of numbers that link back to 169; it turns out that there are
# only three such loops that exist:

# 169 -> 363601 -> 1454 -> 169
# 871 -> 45361 -> 871
# 872 -> 45362 -> 872

# It is not difficult to prove that EVERY starting number will
# eventually get stuck in a loop. For example,

# 69 -> 363600 -> 1454 -> 169 -> 363601 (-> 1454)
# 78 -> 45360 -> 871 -> 45361 (-> 871)
# 540 -> 145 (-> 145)

# Starting with 69 produces a chain of five non-repeating terms, but
# the longest non-repeating chain with a starting number below one
# million is sixty terms.

# How many chains, with a starting number below one million, contain
# exactly sixty non-repeating terms?

$factorials = {
  0 => 1,
  1 => 1,
  2 => 2,
  3 => 6,
  4 => 24,
  5 => 120,
  6 => 720,
  7 => 5040,
  8 => 40320,
  9 => 362880
}

$chains = {}

def chain_length(n)
  start = n
  seen = {}

  while !seen[n]
    if $chains[n]
      $chains[start] = seen.keys + $chains[n]
      return $chains[start]
    end

    seen[n] = true
    digits = n.to_s.split('').map &:to_i

    sum = digits.map { |n| $factorials[n] }.inject(:+)

    n = sum
  end

  $chains[start] = seen.keys
end

count = 0

(100..1_000_000).each do |n|
  l = chain_length(n).length
  count += 1 if l == 60
end

puts count

# time ruby factorial.rb 
# 402

# real	0m51.433s
# user	0m51.116s
# sys	0m0.309s
