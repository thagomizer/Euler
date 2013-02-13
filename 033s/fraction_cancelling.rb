# The fraction 49/98 is a curious fraction, as an inexperienced mathematician in
# attempting to simplify it may incorrectly believe that 49/98 = 4/8, which is
# correct, is obtained by cancelling the 9s.

# We shall consider fractions like, 30/50 = 3/5, to be trivial examples.

# There are exactly four non-trivial examples of this type of fraction, less
# than one in value, and containing two digits in the numerator and denominator.

# If the product of these four fractions is given in its lowest common terms,
# find the value of the denominator.

require 'set'
require 'pp'

class Integer
  def digits
    self.to_s.split(//)
  end
end

numerators = []
denominators = []

1.upto(100) do |denom|
  d = Set.new(denom.digits)

  1.upto(denom - 1) do |num|
    n = Set.new(num.digits)
    common = d.intersection(n).to_a
    next if common.empty? or common[0] == "0"

    new_d = d.to_a
    new_d[new_d.index(common[0])] = nil

    new_n = n.to_a
    new_n[new_n.index(common[0])] = nil

    new_denom = new_d.join.to_f
    new_num = new_n.join.to_f

    next if new_denom == 0 or new_num == 0

    if (num.to_f/denom) == (new_num/new_denom) then
      numerators << num
      denominators << denom
    end
  end
end

pp numerators.inject(:*).to_f/denominators.inject(:*)

# 0.01

# real	0m0.174s
# user	0m0.148s
# sys	0m0.006s
