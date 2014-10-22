# If a box contains twenty-one coloured discs, composed of fifteen
# blue discs and six red discs, and two discs were taken at random, it
# can be seen that the probability of taking two blue discs, P(BB) =
# (15/21)(14/20) = 1/2.


# The next such arrangement, for which there is exactly 50% chance of
# taking two blue discs at random, is a box containing eighty-five
# blue discs and thirty-five red discs.


# By finding the first arrangement to contain over 10^12 =
# 1,000,000,000,000 discs in total, determine the number of blue discs
# that the box would contain.
require 'pp'

s = 10e12 + 2
max = s + 10e6
n = s
target = Rational(1, 2)
loop do
  b = (n * 1/Math.sqrt(2)).ceil

  prob = Rational(b**2 - b, n**2 - n)

  if prob == target
    pp "b #{b.to_i} n #{n.to_i}"
#    exit
  end

  n += 3
  exit if n > max
end
