# If p is the perimeter of a right angle triangle with integral length sides,
# {a,b,c}, there are exactly three solutions for p = 120.

# {20,48,52}, {24,45,51}, {30,40,50}

# For which value of p <= 1000, is the number of solutions maximised?
require 'pp'

def num_triangles_for_perimeter p
  triangles = []
  (1..p).each do |a|
    (a..(p-a)).each do |b|
      next if a > b + 1
      c = p - a - b
      a2 = a**2
      b2 = b**2
      c2 = c**2
      if a2 + b2 == c2 then
        triangles << [a, b, c]
      end
    end
  end
  triangles
end

solution = 0
max = 0

(3..1000).each do |perimeter|
  next unless perimeter % 6 == 0
  t = num_triangles_for_perimeter(perimeter).length
  if t > max then
    solution = perimeter
    max = t
    puts "#{solution} #{t}"
  end
end

# 12 1
# 60 2
# 120 3
# 240 4
# 420 5
# 720 6
# 840 8

# real	0m34.853s
# user	0m29.878s
# sys	0m0.121s
