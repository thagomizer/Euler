# The rules for writing Roman numerals allow for many ways of writing each
# number (see About Roman Numerals...). However, there is always a "best" way of
# writing a particular number.

# For example, the following represent all of the legitimate ways of writing the
# number sixteen:

# IIIIIIIIIIIIIIII
# VIIIIIIIIIII
# VVIIIIII
# XIIIIII
# VVVI
# XVI

# The last example being considered the most efficient, as it uses the least
# number of numerals.

# The 11K text file, roman.txt (right click and 'Save Link/Target As...'),
# contains one thousand numbers written in valid, but not necessarily minimal,
# Roman numerals; that is, they are arranged in descending units and obey the
# subtractive pair rule (see About Roman Numerals... for the definitive rules
# for this problem).

# Find the number of characters saved by writing each of these in their minimal
# form.

# Note: You can assume that all the Roman numerals in the file contain no more
# than four consecutive identical units.
require 'pp'

class RomanNumeral
  @@sym_values = { "I" => 1,
                   "V" => 5,
                   "X" => 10,
                   "L" => 50,
                   "C" => 100,
                   "D" => 500,
                   "M"=> 1000}

  @@output_syms = [["M", 1000],
                   ["CM", 900],
                   ["D", 500],
                   ["CD", 400],
                   ["C", 100],
                   ["XC", 90],
                   ["L", 50],
                   ["XL", 40],
                   ["X", 10],
                   ["IX", 9],
                   ["V", 5],
                   ["IV", 4],
                   ["I", 1]]

  def initialize(roman)
    @val = 0
    chars = roman.split(//) << ""
    i = 1
    while i < chars.length do
      v1 = @@sym_values[chars[i - 1]]
      v2 = @@sym_values[chars[i]] || 0

      if v2 > v1 then
        @val += v2 - v1
        i += 2
      else
        @val += v1
        i += 1
      end
    end
  end

  def to_i
    @val
  end

  def to_s
    roman = ""
    remainder = @val
    @@output_syms.each do |sym, val|
      while val <= remainder do
        roman << sym
        remainder = remainder - val
      end
    end
    roman
  end
end

## tests
# r = RomanNumeral.new("I")
# puts "Expected I #{r} 1 #{r.to_i}"

# r = RomanNumeral.new("II")
# puts "Expected II #{r} 2 #{r.to_i}"

# r = RomanNumeral.new("VII")
# puts "Expected VII #{r} 7 #{r.to_i}"

# r = RomanNumeral.new("XVI")
# puts "Expected XVI #{r} 16 #{r.to_i}"

# r = RomanNumeral.new("XIIIIII")
# puts "Expected XVI #{r} 16 #{r.to_i}"

# r = RomanNumeral.new("XIV")
# puts "Expected XIV #{r} 14 #{r.to_i}"

# r = RomanNumeral.new("XIIII")
# puts "Expected XIV #{r} 14 #{r.to_i}"

# r = RomanNumeral.new("XLIX")
# puts "Expected XLIX #{r} 49 #{r.to_i}"

# r = RomanNumeral.new("XXXXVIIII")
# puts "Expected XLIX #{r} 49 #{r.to_i}"

saved = 0

f = File.open('roman.txt', "r")
f.each_line do |line|
  line.strip!
  rn = RomanNumeral.new(line.strip)
  optimal_rn = rn.to_s
  diff = line.length - optimal_rn.length
  saved += diff
end

puts "Saved #{saved} characters"

# time ruby roman.rb
# Saved 743 characters

# real	0m0.064s
# user	0m0.058s
# sys	0m0.005s
