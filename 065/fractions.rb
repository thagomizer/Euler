# The square root of 2 can be written as an infinite continued fraction.

# sqrt(2) = 1 + 1/(2 + 1/(2 + 1/(2 + ...))))

# The infinite continued fraction can be written, sqrt(2) = [1;(2)], (2) indicates
# that 2 repeats ad infinitum. In a similar way, sqrt(23) = [4;(1,3,1,8)].

# It turns out that the sequence of partial values of continued fractions for
# square roots provide the best rational approximations. Let us consider the
# convergents for 2.


#   1 + 1/2                         = 3/2
#   1 + 1/(2 + 1/2)                 = 7/5
#   1 + 1/(2 + 1/(2 + 1/2))         = 17/12
#   1 + 1/(2 + 1/(2 + 1/(2 + 1/2))) = 41/29

# Hence the sequence of the first ten convergents for sqrt(2) are:

# 1, 3/2, 7/5, 17/12, 41/29, 99/70, 239/169, 577/408, 1393/985, 3363/2378, ...

# What is most surprising is that the important mathematical constant,
# e = [2; 1,2,1, 1,4,1, 1,6,1 , ... , 1,2k,1, ...].

# The first ten terms in the sequence of convergents for e are:

# 2, 3, 8/3, 11/4, 19/7, 87/32, 106/39, 193/71, 1264/465, 1457/536, ...
# The sum of digits in the numerator of the 10th convergent is 1+4+5+7=17.

# Find the sum of digits in the numerator of the 100th convergent of the
# continued fraction for e.


### For e
## 0) 2
## 1) 2 + 1/(1 + 0) = 3
## 2) 2 + 1/(1 + 1/2) = 2 + 1/(3/2) = 2 + 2/3 = 8/3
## 3) 2 + 1/(1 + 1/(2 + 1/1)) = 2 + 1/(1 + 1/3) = 2 + 1/(4/3) = 2 + 3/4 = 11/4

def partial_products max, count
  case
  when max == count
    return Rational(0, 1)
  when count % 3 == 1
    f = (count / 3 + 1) * 2
    return Rational(1, f + partial_products(max, count + 1))
  else
    return Rational(1, 1 + partial_products(max, count + 1))
  end
end

approx = 2 + partial_products(99,0)
p approx.numerator.to_s.split('').map(&:to_i).inject(:+)

# time ruby fractions.rb
# 272

# real	0m0.114s
# user	0m0.061s
# sys	0m0.052s
