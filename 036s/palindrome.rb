# The decimal number, 585 = 10010010012 (binary), is palindromic in both bases.

# Find the sum of all numbers, less than one million, which are palindromic in
# base 10 and base 2.

# (Please note that the palindromic number, in either base, may not include
# leading zeros.)
def palindrome(n)
  (n.to_s == n.to_s.reverse) && (n.to_s(2) == n.to_s(2).reverse)
end

# puts (0..1_000_000).select{|x| palindrome(x)}.inject{|sum, x| sum + x}

x = 1.step(1_000_000, 2).inject{|sum, x| palindrome(x) ? sum + x : sum}
puts x

# 872187

# real	0m1.525s
# user	0m1.477s
# sys	0m0.005s
