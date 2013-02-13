# The cube, 41063625 (345^3), can be permuted to produce two other cubes:
# 56623104 (384^3) and 66430125 (405^3). In fact, 41063625 is the smallest cube
# which has exactly three permutations of its digits which are also cube.

# Find the smallest cube for which exactly five permutations of its digits are
# cube.
require 'pp'

$cubes = []
(1..100_000).each do |x|
  $cubes << x**3
end

cube_digits = Hash.new()

$cubes.each do |c|
  sorted_digits = c.to_s.split('').sort.join
  cube_digits[sorted_digits] ||= []
  cube_digits[sorted_digits] << c
end

results = []
cube_digits.each do |k, v|
  results += v if v.length > 4
end
pp results.sort.first

# 127035954683

# real	0m3.764s
# user	0m3.695s
# sys	0m0.040s
