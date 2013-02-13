# Working from left-to-right if no digit is exceeded by the digit to its left it
# is called an increasing number; for example, 134468.

# Similarly if no digit is exceeded by the digit to its right it is called a
# decreasing number; for example, 66420.

# We shall call a positive integer that is neither increasing nor decreasing a
# "bouncy" number; for example, 155349.

# Clearly there cannot be any bouncy numbers below one-hundred, but just over
# half of the numbers below one-thousand (525) are bouncy. In fact, the least
# number for which the proportion of bouncy numbers first reaches 50% is 538.

# Surprisingly, bouncy numbers become more and more common and by the time we
# reach 21780 the proportion of bouncy numbers is equal to 90%.

# Find the least number for which the proportion of bouncy numbers is exactly
# 99%.

class Integer
  def bouncy?
    digits = self.to_s.split(//).map{|d| d.to_i}
    increasing = digits == digits.sort
    decreasing = digits == digits.sort.reverse
    !(increasing or decreasing)
  end
end

i = 100
bouncy = 0.0
ratio = bouncy/i

while ratio < 0.99 do
  i += 1
  bouncy += 1 if i.bouncy?
  ratio = bouncy/i
end

puts i
puts ratio

# 1587000
# 0.99

# real	0m35.286s
# user	0m33.169s
# sys	0m0.055s
