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

## Algebra

##   1       b       b - 1
## ----- = ----- * ---------
##   2       n       n - 1

## 2b^2 - 2b = n^2 - n

## Factor via quadratic equation

## b = 0.5 * (1 + Math.sqrt(2 * n**2 - 2 * n + 1))
## b = 0.5 * (1 - Math.sqrt(2 * n**2 - 2 * n + 1))


n = 10e12
loop do
  b = 0.5 * (1 + Math.sqrt(2 * n**2 - 2 * n + 1))

  if b.to_i == b
    pp "b #{b.to_i} n #{n.to_i}"
    prob = Rational(b, n) * Rational(b - 1, n - 1)
    pp prob.to_f
    exit
  end

  n += 1
end
