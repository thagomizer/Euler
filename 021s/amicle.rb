require 'pp'

limit = ARGV[0] || 10_000
limit = limit.to_i

def divisors(n)
  l = Math.sqrt(n).to_i
  divisors = [1]
  while l > 1 do
    if (n % l) == 0 then
      divisors << l
      divisors << (n/l)
    end
    l -= 1
  end
  divisors.sort
end

def divisor_sum(n)
  l = Math.sqrt(n).to_i
  sum = 1
  while l > 1 do
    if (n % l) == 0 then
      sum += l
      sum += (n/l)
    end
    l -= 1
  end
  sum
end

sums = []

limit.times do |n|
  next if n == 0
  sums[n] = divisor_sum(n)
end

result = 0

sums.each_with_index do |d_a, a|
  next unless d_a

  if (d_a != a) and (sums[d_a] == a) then
    result += a
  end
end

puts result

# 31626

# real	0m0.554s
# user	0m0.545s
# sys	0m0.006s
