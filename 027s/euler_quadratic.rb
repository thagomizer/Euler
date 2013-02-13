require 'pp'

# Considering quadratics of the form:
# n^2 + an + b, where |a|  1000 and |b|  1000
#
# Find the product of the coefficients, a and b, for the quadratic
# expression that produces the maximum number of primes for
# consecutive values of n, starting with n = 0.

$primes = Hash.new

def prime?(n)
  return false if n < 2
  return $primes[n] if $primes[n]

  root = Math.sqrt(n).to_i
  (2..root).each do |x|
    if n % x == 0 then
      $primes[n] = false
      return false
    end
  end
  $primes[n] = true
  true
end

most_primes = 0
best_pair = [0, 0]

(-1_000..1_000).each do |a|
  (-1_000..1_000).each do |b|
    p = Proc.new{|x| x**2 + a * x + b}
    i = 0
    while prime?(p.call(i)) do
      i += 1
    end
    if i > most_primes then
      most_primes = i
      best_pair = [a, b]
    end
  end
end


puts most_primes
pp best_pair
puts best_pair[0] * best_pair[1]


#-59231

# 71
# [-61, 971]
# -59231

# real	0m35.132s
# user	0m33.475s
# sys	0m0.246s
