# Starting with the number 1 and moving to the right in a clockwise direction a
# 5 by 5 spiral is formed as follows:

# 21 22 23 24 25
# 20  7  8  9 10
# 19  6  1  2 11
# 18  5  4  3 12
# 17 16 15 14 13

# It can be verified that the sum of the numbers on the diagonals is 101.

# What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral
# formed in the same way?
require 'pp'
def sum_spiral(side_length)
  evens = (2..(side_length-1)).step(2)
  moves = evens.map{|n| [n, n, n, n]}.flatten

  x = 1
  sum = 1
  moves.each do |m|
    x += m
    sum += x
  end
  sum
end

pp sum_spiral(1001)

def generate_moves(n)
  x_dir = "+"
  y_dir = "-"
  moves = [0]

  (1..n).each do |i|
    i.times{moves << "x#{x_dir}"}
    i.times{moves << "y#{y_dir}"}

    # swap the directions
    t = x_dir
    x_dir = y_dir
    y_dir = t
  end
  moves
end


def draw_spiral(side_length)
  spiral = []
  side_length.times do |i|
    spiral[i] = []
    side_length.times do
      spiral[i] << 0
    end
  end

  moves = generate_moves(side_length)

  i = 1
  x = side_length/2
  y = side_length/2
  while i <= side_length**2
    spiral[y][x] = i.to_s.center(4)

    case moves[i]
    when "x+"
      x = x + 1
    when "x-"
      x = x - 1
    when "y+"
      y = y + 1
    when "y-"
      y = y - 1
    end

    i += 1
  end
  spiral.reverse!
  spiral.each do |row|
    puts row.join(' ')
  end
end

# draw_spiral(51)



# 669171001

# real	0m0.017s
# user	0m0.011s
# sys	0m0.005s
