# It was proposed by Christian Goldbach that every odd composite number
# can be written as the sum of a prime and twice a square.

#  9 = 7 + 212
#  15 = 7 + 222
#  21 = 3 + 232
#  25 = 7 + 232
#  27 = 19 + 222
#  33 = 31 + 212

# It turns out that the conjecture was false.

# What is the smallest odd composite that cannot be written as the sum of a
# prime and twice a square?

####

class Fixnum
  def prime?
    root = Math.sqrt(self).to_i
    (2..root).each do |x|
      return false if self % x == 0
    end
    true
  end
end

max = 6000
squares = []
primes = []

# Generate squares
(max/10).times do |x|
  squares << x**2
end

r = (1..max)
r.step(2) do |num|
  if num.prime?
    primes << num
    next
  end

  found = false
  primes.each do |p|
    rest = num - p
    if squares.include?(rest/2) then
      found = true
      # puts "Num #{num} Prime #{p} Square #{Math.sqrt(rest/2)}"
      break
    end
  end
  if !found
    puts num
    break
  end
end

# time ruby goldbach.rb
# 5777

# real	0m6.027s
# user	0m5.752s
# sys	0m0.007s
