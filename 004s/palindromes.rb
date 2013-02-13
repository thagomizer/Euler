#!/usr/bin/ruby -w

# palindrome

class Integer
  def palindrome?
    return self.to_s == self.to_s.reverse
  end
end

max = 0
a = 0
b =0

999.downto(100) do |x|
  999.downto(100) do |y|
    if (x * y).palindrome? then
      max = x * y if x * y > max
      a = x
      b = y
    end
  end
end

puts max

# 906609

# real	0m1.859s
# user	0m1.849s
# sys	0m0.005s
