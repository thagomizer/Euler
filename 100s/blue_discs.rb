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

# Total | Blue | Red   |
#  4    |   3  |  1    |
#  21   |   15 |  6    |
#  120  |   85 |  13   |
#  697  |  493 |  204  |
#  4060 | 2871 | 1189  |
# 23661 | 16731| 6930  |

require 'pp'

factor = Math.sqrt(2)

total = 10
while total < (1e14 + 10_000)
  b = (total / factor).ceil
  n2 = b * (b - 1) * 2
  d = total * (total - 1)
  if n2 == d then
    puts "total #{total}, blue: #{b}, red #{total - b}"
    total = (total * 5.8284).floor
    exit if total > 1e12
  else
    total += 1
  end
end

# total 21, blue: 15, red 6
# total 697, blue: 493, red 204
# total 23661, blue: 16731, red 6930
# total 803761, blue: 568345, red 235416
# total 4684660, blue: 3312555, red 1372105
# total 27304197, blue: 19306983, red 7997214
# total 159140520, blue: 112529341, red 46611179
# total 927538921, blue: 655869061, red 271669860
# total 5406093004, blue: 3822685023, red 1583407981
# total 31509019101, blue: 22280241075, red 9228778026
# total 183648021600, blue: 129858761425, red 53789260175

# real	0m1.452s
# user	0m1.387s
# sys	0m0.060s
