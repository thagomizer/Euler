# A number chain is created by continuously adding the square of the digits
# in a number to form a new number until it has been seen before.

# For example,

# 44 -> 32 -> 13 -> 10 -> 1 -> 1
# 85 -> 89 -> 145 -> 42 -> 20 -> 4 -> 16 -> 37 -> 58 -> 89

# Therefore any chain that arrives at 1 or 89 will become stuck in an endless
# loop. What is most amazing is that EVERY starting number will eventually
# arrive at 1 or 89.

# How many starting numbers below ten million will arrive at 89?
require 'pp'

class Fixnum
  def square_sum
    n = self
    sum = 0
    while n > 0
      least_sig_digit = n % 10
      sum += least_sig_digit**2
      n = n /10
    end
    return sum
  end
end

$cache = {}

def chain n
  result = $cache[n] || n
  until (result == 1 or result == 89) do
    return $cache[result] if $cache[result]
    result = result.square_sum
  end
  return result
end

puts "44 expected 1 #{chain 44}"
puts "85 expected 89 #{chain 85}"

1.upto(81*7) do |n|
  $cache[n] = chain n
end

r89 = 0
2.upto(10_000_000) do |n|
  r89 += 1 if $cache[n.square_sum] == 89
end

pp "89 #{r89}"

# time ruby script.rb
# 44 expected 1 1
# 85 expected 89 89
# "89 8581146"

# real	1m24.475s
# user	1m21.645s
# sys	0m0.128s
