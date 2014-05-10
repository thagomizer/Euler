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

$squares = Hash.new(false)

class Fixnum
  def square?
    $squares[self]
  end
end

(1..10_000_000).each do |x|
  $squares[x**2] = true
end

def find_minimal(d)
  $squares.each_key do |s|
    val = d * s + 1
    if $squares[val]
      return Math.sqrt(val)
    end
  end
  return 0.0
end

max = 0

2.upto(1000) do |n|
  next if n.square?

  x = find_minimal(n)
  max = x if x > max
  puts "ERROR #{n}" if x == 0.0
end

puts max
