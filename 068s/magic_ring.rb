# Consider the following "magic" 3-gon ring, filled with the numbers 1 to 6, and each line adding to nine.


# Working clockwise, and starting from the group of three with the numerically lowest external node (4,3,2 in this example), each solution can be described uniquely. For example, the above solution can be described by the set: 4,3,2; 6,2,1; 5,1,3.

# It is possible to complete the ring with four different totals: 9, 10, 11, and 12. There are eight solutions in total.

# Total	Solution Set
# 9	4,2,3; 5,3,1; 6,1,2
# 9	4,3,2; 6,2,1; 5,1,3
# 10	2,3,5; 4,5,1; 6,1,3
# 10	2,5,3; 6,3,1; 4,1,5
# 11	1,4,6; 3,6,2; 5,2,4
# 11	1,6,4; 5,4,2; 3,2,6
# 12	1,5,6; 2,6,4; 3,4,5
# 12	1,6,5; 3,5,4; 2,4,6
# By concatenating each group it is possible to form 9-digit strings; the maximum string for a 3-gon ring is 432621513.

# Using the numbers 1 to 10, and depending on arrangements, it is possible to form 16- and 17-digit strings. What is the maximum 16-digit string for a "magic" 5-gon ring?

# Outside is A, B, C, D, E
# Inside is F, G, H, I, J
# Equations are A+F+J, B+G+F, C+H+G, D+I+H, E+J+I

found = 0

(1..10).to_a.permutation(10) do |p|
  a, b, c, d, e, f, g, h, i, j = p

  next unless a == [a, b, c, d, e].min

  radials = [
             [a, f, j],
             [b, g, f],
             [c, h, g],
             [d, i, h],
             [e, j, i],
            ]

  goal = radials[1].inject(:+)

  if radials.all? { |r| r.inject(:+) == goal }
    s = "#{a}#{f}#{j}#{e}#{j}#{i}#{d}#{i}#{h}#{c}#{h}#{g}#{b}#{g}#{f}"
    next if s.length > 16
    if s.to_i > found then
      found = s.to_i
    end
  end
end

puts found

# 6531031914842725

# real	0m6.652s
# user	0m6.590s
# sys	0m0.056s
