#!/usr/bin/ruby -w

def right(grid, r, c)
  if c > 15
    0
  else
    grid[r][c] * grid[r][c + 1] * grid[r][c + 2] * grid[r][c + 3]
  end
end

def left(grid, r, c)
  if c < 3
    0
  else
    grid[r][c] * grid[r][c - 1] * grid[r][c - 2] * grid[r][c - 3]
  end
end

def down(grid, r, c)
  if r > 15
    0
  else
    grid[r][c] * grid[r + 1][c] * grid[r + 2][c] * grid[r + 3][c]
  end
end

def up(grid, r, c)
  if r < 3
    0
  else
    grid[r][c] * grid[r - 1][c] * grid[r - 2][c] * grid[r - 3][c]
  end
end

def diagonal_1(grid, r, c)
  if r > 15 || c > 15
    0
  else
    grid[r][c] * grid[r + 1][c + 1] * grid[r + 2][c + 2] * grid[r + 3][c + 3]
  end
end

def diagonal_2(grid, r, c)
  if r < 3 || c < 3
    0
  else
    grid[r][c] * grid[r - 1][c - 1] * grid[r - 2][c - 2] * grid[r - 3][c - 3]
  end
end

def diagonal_3(grid, r, c)
  if r < 3 || c > 15
    0
  else
    grid[r][c] * grid[r - 1][c + 1] * grid[r - 2][c + 2] * grid[r - 3][c + 3]
  end
end

def diagonal_4(grid, r, c)
  if r > 15 || c < 3
    0
  else
    grid[r][c] * grid[r + 1][c - 1] * grid[r + 2][c - 2] * grid[r + 3][c - 3]
  end
end

file = File.open(ARGV[0], "r")
grid = []
max_product = 0

file.each_line do |line|
  nums = line.split " "
  nums.collect! {|n| n.to_i}
  grid << nums
end

(0..19).each do |r|
  (0..19).each do |c|
    products = [right(grid, r, c),
         left(grid, r, c),
         down(grid, r, c),
         up(grid, r, c),
         diagonal_1(grid, r, c),
         diagonal_2(grid, r, c),
         diagonal_3(grid, r, c),
         diagonal_4(grid, r, c)]

    products.each do |p|
      max_product = p if p > max_product
    end
  end
end

puts max_product

# 70600674

# real	0m0.021s
# user	0m0.015s
# sys	0m0.004s
