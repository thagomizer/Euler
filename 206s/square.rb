# Find the unique positive integer whose square has the form
# 1_2_3_4_5_6_7_8_9_0, where each "_" is a single digit.

require 'pp'

i = 1_390_000_000
found = false
r = /1\d2\d3\d4\d5\d6\d7\d8\d9\d0/

while i > 1010101010
  i -= 10
  break if (i**2).to_s =~ r
  puts i if i % 1_000_000 == 0
end

puts i

# min 1_010_101_010
# max 1_389_026_623

# 1389019170

# real	0m0.333s
# user	0m0.317s
# sys	0m0.005s
