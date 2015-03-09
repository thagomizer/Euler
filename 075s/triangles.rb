require 'pp'
# It turns out that 12 cm is the smallest length of wire that can be
# bent to form an integer sided right angle triangle in exactly one
# way, but there are many more examples.

# 12 cm: (3,4,5)
# 24 cm: (6,8,10)
# 30 cm: (5,12,13)
# 36 cm: (9,12,15)
# 40 cm: (8,15,17)
# 48 cm: (12,16,20)

# In contrast, some lengths of wire, like 20 cm, cannot be bent to
# form an integer sided right angle triangle, and other lengths allow
# more than one solution to be found; for example, using 120 cm it is
# possible to form exactly three different integer sided right angle
# triangles.

# 120 cm: (30,40,50), (20,48,52), (24,45,51)

# Given that L is the length of the wire, for how many values of L <=
# 1,500,000 can exactly one integer sided right angle triangle be
# formed?

## Pythagorean triples!!!
## Either all even, or 2 even and 1 odd
##

MAX = 1_500_000

search_max = Math.sqrt(MAX)

triple_count = Hash.new(0)
ab = {}

k = 1
triple = []
a, b, c = 0

(2..search_max).each do |m|
  (1...m).each do |n|
    a = m**2 - n**2
    b = 2 * m * n
    if a > b
      a, b = b, a
    end
    next if ab["#{a},#{b}"]
    c = m**2 + n**2
    sum = a + b + c
    k = 1
    while (t_sum = sum * k) <= MAX do
      break if ab["#{a*k},#{b*k}"]
      ab["#{a*k},#{b*k}"] = true
      triple_count[t_sum] += 1
      k += 1
    end
  end
end

pp triple_count.select { |k, v| v == 1 }.length

# time time ruby triangles.rb 
# time time ruby triangles.rb 
# 161667
#         9.78 real         9.46 user         0.30 sys

# real	0m9.787s
# user	0m9.462s
# sys	0m0.303s
