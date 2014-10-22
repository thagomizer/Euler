# Consider quadratic Diophantine equations of the form:

# x^2 - D * y^2 = 1

# For example, when D=13, the minimal solution in x is 649^2 - 13 * 180^2 = 1.

# It can be assumed that there are no solutions in positive integers
# when D is square.

# By finding minimal solutions in x for D = {2, 3, 5, 6, 7}, we obtain
# the following:

# 3^2 - 2 * 2^2 = 1
# 2^2 - 3 * 1^2 = 1
# 9^2 - 5 * 4^2 = 1
# 5^2 - 6 * 2^2 = 1
# 8^2 - 7 * 3^2 = 1

# Hence, by considering minimal solutions in x for D <= 7, the largest
# x is obtained when D=5.
# Find the value of D <= 1000 in minimal solutions of x for which the
# largest value of x is obtained.

require 'pp'

class Fixnum
  def square?
    Math.sqrt(self)**2 == self
  end
end

def find_minimal(d, max_x = 1_000_000)
  (2..max_x).each do |x|
    y = Math.sqrt((1 - x**2) / (-1 * d))
    if y % 1 == 0
      return [x, y.to_i]
    end
  end
  return [nil, nil]
end

# pp find_minimal(61.to_f, 1_000_000_000)

result = {:x => 1, :d => 1}

(2..400).each do |d|
  next if d.square?
  x, y = find_minimal(d.to_f)

  if !x
    puts d
    next
  end

  if x > result[:x]
    result[:x] = x
    result[:d] = d
    pp result
  end
end

pp result

# $square_cache = Hash.new(false)
# $squares = []

# n = ARGV[0].to_i

# (1..5_000_000).each do |x|
#   t = x**2
#   $square_cache[t] = x**2
# end

# def find_minimal(d)
#   s = 1
#   while true do
#     val = d * s**2 + 1
#     if $square_cache[val]
#       return Math.sqrt(val)
#     end

#     if s > 1_000
#       return 0.0
#     else
#       s += 1
#     end
#   end
# end

# max = 0

# 2.upto(n) do |n|
#   next if n.square?

#   x = find_minimal(n)
#   max = x if x > max
#   puts "ERROR #{n}" if x == 0.0
# end

# puts max
