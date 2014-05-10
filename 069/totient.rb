# -*- coding: utf-8 -*-
# Euler's Totient function, φ(n) [sometimes called the phi function], is used to
# determine the number of numbers less than n which are relatively prime to n.
# For example, as 1, 2, 4, 5, 7, and 8, are all less than nine and relatively
# prime to nine, φ(9)=6.


# n     Relatively Prime     φ(n)     n/φ(n)
#----------------------------------------------
# 2     1                    1        2
# 3     1,2                  2        1.5
# 4     1,3                  2        2
# 5     1,2,3,4              4        1.25
# 6     1,5                  2        3
# 7     1,2,3,4,5,6          6        1.1666...
# 8     1,3,5,7              4        2
# 9     1,2,4,5,7,8          6        1.5
# 10    1,3,7,9              4        2.5


# It can be seen that n=6 produces a maximum n/φ(n) for n  10.

# Find the value of n <= 1,000,000 for which n/φ(n) is a maximum.

require 'pp'

class Integer
  # require 'prime'

  # @@prime = Prime.instance

  def totient(threshold = 50000)
    sum = 1
    # return (self - 1) if @@prime.prime?(self)

    2.upto(self - 1) do |k|
      if k.gcd(self) == 1
        sum +=1
      end
      # return false if sum >= threshold
    end
    sum.to_f
  end
end

end_point = ARGV[0].to_i
max_totient = 1
max_n       = 2
max_ratio   = 2

results = []

# faster
(2..end_point).each do |n|
  totient = n.totient

  next unless totient

  ratio = n/n.totient

  if ratio > max_ratio
    max_n = n
    max_ratio = ratio
    max_totient = totient
  end
end

pp [max_n, max_ratio, max_totient]
