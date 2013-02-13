#!/usr/bin/ruby -w

def pp_row(row)
  str = "["
  row.each do |r|
    str = str + "#{r}, "
  end
  str = str + "]"
  puts str
end


file = File.open(ARGV[0], "r")
orig = []
sum = 0


file.each_line do |line|
  nums = line.split ""
  nums.pop
  nums.collect! {|n| n.to_i}
  orig << nums.reverse
end

numbers = orig.transpose

running_total = 0
place = 1
numbers.each do |row|
  row_sum = row.inject(0) {|sum, n| sum += n}
  running_total = running_total + (row_sum * (1 * place))

  if running_total > 10000000000 then
     running_total = running_total / 10
  else
    place = place * 10
  end
end

puts running_total

# 5537376230

# real	0m0.028s
# user	0m0.019s
# sys	0m0.005s
