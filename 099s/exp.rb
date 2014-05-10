# Comparing two numbers written in index form like 2^11 and 3^7 is not
# difficult, as any calculator would confirm that 2^11 = 2048 < 3^7 =
# 2187.

# However, confirming that 632382^518061 > 519432^525806 would be much
# more difficult, as both numbers contain over three million digits.

# Using base_exp.txt (right click and 'Save Link/Target As...'), a 22K
# text file containing one thousand lines with a base/exponent pair on
# each line, determine which line number has the greatest numerical
# value.

# NOTE: The first two lines in the file represent the numbers in the
# example given above.
require 'pp'
require 'prime'

class Fixnum
  $factorizations = {1 => [1], 2 => [2]}

  def prime_factorization
    return $factorizations[self] if $factorizations[self]
    if Prime.prime?
      $factorizations[self] = [self]
      return [self]
    end

    root = Math.sqrt(self).floor
    root.downto(1) do |x|
      if self % x == 0 then
        f = x.prime_factorization + (self / x).prime_factorization
        $factorizations[self] = f
        return f
      end
    end
  end
end

nums = []
File.open("base_exp.txt") do |f|
  f.each_line do |line|
    b, p = line.split(',').map(&:to_i)
    nums << p * Math.log(b)
  end
end

pp nums.each_with_index.max[1] + 1
