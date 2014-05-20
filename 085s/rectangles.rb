# By counting carefully it can be seen that a rectangular grid
# measuring 3 by 2 contains eighteen rectangles.

# Although there exists no rectangular grid that contains exactly two
# million rectangles, find the area of the grid with the nearest
# solution.

def num_rects length, width
  sum = 0
  (1..length).each do |l|
    (1..width).each do |w|
      sum += l * w
    end
  end
  sum
end

area = 0
diff = 2_000_000
count = 0

(1..100).each do |l|
  (l..100).each do |w|
    c = num_rects(l, w)
    d = (c - 2_000_000).abs
    if d < diff
      diff = d
      count = c
      area = l * w
    end
  end
end


puts area

# 2772

# real	0m1.498s
# user	0m1.444s
# sys	0m0.053s
