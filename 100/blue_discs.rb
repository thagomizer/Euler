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

# b = count of blue disks
# r = count of red disks
# (b/(b + r)) * ((b - 1)/(b + r - 1))


# ## Using algebra its easy to see that this can be solved by solving
# ## for a quadratic
# ## x^2 - x = 2y^2 - 2y
# ## y < x
# ## 2y^2 - 2y - (x^2 - x) = 0


# ### ATTEMPT 2
# i = 10**12
# while true do
#   denom = i * (i - 1)
#   x = denom / 2
#   f = Math.sqrt(x).ceil
#   num = f * (f - 1)

#   if x == num then
#     puts "i #{i} blue #{f}"
#     exit
#   end

#   i += 1
# end


total_disks = 21
1.upto(total_disks).each do |red|
  blue = total_disks - red
  quadratic = blue**2 + (red * blue) - (2 * red)

puts "Red #{red} Blue #{blue}"
puts quadratic

  if quadratic == 0 then
    puts "Red #{red} Blue #{blue}"
    break
  end
end
