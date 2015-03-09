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

# MAX = 750_000
MAX = 5_000

#triples = Hash.new { |h, k| h[k] = [] }
triple_count = Hash.new(0)
ab = {}

k = 1
triple = []

(2..MAX).each do |m|
  (1...m).each do |n|
    a = m**2 - n**2
    b = 2 * m * n
    a,b = [a,b].sort
    next if ab[[a,b]]

    c = m**2 + n**2
    sum = a + b + c
 #   triple = [a, b, c]
    k = 1
    while (t_sum = sum * k) < MAX do
      ab[[a*k,b*k]] = true
#      triples[sum * k] << (triple.map { |n| n * k })
      triple_count[t_sum] += 1
      k += 1
    end
  end
end

# pp triples[120]
pp triple_count[120]
