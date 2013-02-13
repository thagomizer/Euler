require 'rubygems'
require 'pp'

# Starting in the top left corner of a 22 grid, there are 6 routes
# (without backtracking) to the bottom right corner.

# Each route is a combination of rights and downs.  The number of rights and
# downs is equal to the the manhattan distance from corner to corner.  And
# half of them must be downs and half must be rights.

side = ARGV.shift.to_i

path = []

side.times do |n|
  path << "D"
  path << "R"
end

def permute(ary)
  results = []
  if ary.length == 1
    results << ary
  else
    ary.length.times do |n|
      wierdo = ary[n]
      rest = ary[0...n] + ary[(n+1)...(ary.length)]
      sub = permute(rest)
      results += sub.collect{|x| [wierdo] + x}
    end
  end
  results.uniq
end

def permute_count(ary)
  result = 0
  if ary.length == 1
    return 1
  else
    ary.length.times do |n|
      wierdo = ary[n]
      rest = ary[0...n] + ary[(n+1)...(ary.length)]
      sub = permute_count(rest)
      result += sub
    end
  end
  result
end

paths2 = permute(path).sort
#  paths2
puts paths2.length

#puts permute_count(path)

