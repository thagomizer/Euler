require 'pp'

# Peter has nine four-sided (pyramidal) dice, each with faces
# numbered 1, 2, 3, 4.
# Colin has six six-sided (cubic) dice, each with faces
# numbered 1, 2, 3, 4, 5, 6.

# Peter and Colin roll their dice and compare totals: the highest total wins.
# The result is a draw if the totals are equal.

# What is the probability that Pyramidal Pete beats Cubic Colin? Give your
# answer rounded to seven decimal places in the form 0.abcdefg



def generate_possibilities(length, faces)
  return faces if length == 1

  possibilities = generate_possibilities(length - 1, faces)
  results = []

  # take each face and tack it on to the entire array of possibilities
  faces.each do |f|
    possibilities.each do |p|
      results.push(p + f)
    end
  end

  return results
end

# Generate all combinations of nine 4 sided dice
peter = generate_possibilities(9, [[1], [2], [3], [4]])
colin = generate_possibilities(6, [[1], [2], [3], [4], [5], [6]])

peter_sums = peter.map{|result| result.inject(:+)}
colin_sums = colin.map{|result| result.inject(:+)}

total = peter.length * colin.length
peter_wins = 0

p_sum = Hash.new(0)
peter_sums.each do |s|
  p_sum[s] += 1
end

peter_wins2 = 0

colin_sums.each do |cs|
  p_sum.keys.each do |ps|
    if ps > cs then
      peter_wins2 = peter_wins2 + p_sum[ps]
    end
  end
end

pp peter_wins2.to_f/total

# 0.57314407678298

# real	0m2.499s
# user	0m2.316s
# sys	0m0.049s
