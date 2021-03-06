# Triangle, square, pentagonal, hexagonal, heptagonal, and octagonal numbers are
# all figurate (polygonal) numbers and are generated by the following formulae:

# Triangle    n(n + 1)/2      1, 3, 6, 10, 15, ...
# Square      n^2           1, 4, 9, 16, 25, ...
# Pentagonal  n(3n - 1)/2   1, 5, 12, 22, 35, ...
# Hexagonal   n(2n - 1)     1, 6, 15, 28, 45, ...
# Heptagonal  n(5n - 3)/2   1, 7, 18, 34, 55, ...
# Octagonal   n(3n - 2)     1, 8, 21, 40, 65, ...

# The ordered set of three 4-digit numbers: 8128, 2882, 8281, has three
# interesting properties.

# The set is cyclic, in that the last two digits of each number is the first
# two digits of the next number (including the last number with the first).
# Each polygonal type: triangle (P3,127=8128), square (P4,91=8281), and
# pentagonal (P5,44=2882), is represented by a different number in the set.
# This is the only set of 4-digit numbers with this property.

# Find the sum of the only ordered set of six cyclic 4-digit numbers for which
# each polygonal type: triangle, square, pentagonal, hexagonal, heptagonal,
# and octagonal, is represented by a different number in the set.
require 'pp'

$numbers = []

i = 2
while i < 150 do
  $numbers << [((i * (i + 1))/2).to_s, :triangle]
  $numbers << [((i**2)).to_s, :square]
  $numbers << [((i * (3 * i - 1))/2).to_s, :pent]
  $numbers << [((i * (2 * i - 1))).to_s, :hex]
  $numbers << [((i * (5 * i - 3)) /2).to_s, :hept]
  $numbers << [((i * (3 * i - 2))).to_s, :oct]

  i += 1
end

$numbers.reject!{|digit, _| digit.length != 4}
$last_digits = {}
$first_digits = {}


$numbers.each do |number, kind|
  last_two = number[2, 2]
  first_two = number[0, 2]

  $last_digits[last_two] ||= []
  $last_digits[last_two] << [number, kind]

  $first_digits[first_two] ||= []
  $first_digits[first_two] << [number, kind]
end

$first_digits.freeze
$last_digits.freeze

def find_chain(found_kinds, current_chain)
  if found_kinds.values.all? then
    if current_chain.first[0, 2] == current_chain.last[2, 2] then
      return current_chain
    else
      return false
    end
  end

  number = current_chain.last
  next_links = $first_digits[number[2,2]]
  return false unless next_links

  next_links = next_links.reject{|_, k| found_kinds[k]}
  return false if next_links.empty?

  next_links.each do |link_num, link_kind|
    found_kinds[link_kind] = true
    chain = find_chain(found_kinds, current_chain + [link_num])
    return chain if chain

    found_kinds[link_kind] = false
  end
  return false
end

$numbers.each do |number, kind|
  found = { :triangle => false,
            :square   => false,
            :pent     => false,
            :hex      => false,
            :hept     => false,
            :oct      => false}
  found[kind] = true


  chain = find_chain(found, [number])
  if chain
    puts "CHAIN #{chain.join(', ')}"
    puts "SUM #{chain.inject(0){|sum, n| sum + n.to_i}}"
    exit
  end
end

# CHAIN 1281, 8128, 2882, 8256, 5625, 2512
# SUM 28684

# real	0m0.018s
# user	0m0.013s
# sys	0m0.004s
