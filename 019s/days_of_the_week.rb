sundays = 0
y = 1901
while y < 2001
  m = 1
  while m < 13
    sundays += 1 if Time.local(y, m, 1, 0, 0, 0).wday == 0
    m += 1
  end
  y += 1
end
puts sundays

# 171

# real	0m0.019s
# user	0m0.014s
# sys	0m0.004s
