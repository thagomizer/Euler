# -*- coding: utf-8 -*-
# The nth term of the sequence of triangle numbers is given by, tn = ½n(n+1); so
# the first ten triangle numbers are:

# 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

# By converting each letter in a word to a number corresponding to its
# alphabetical position and adding these values we form a word value. For
# example, the word value for SKY is 19 + 11 + 25 = 55 = t10. If the word value
# is a triangle number then we shall call the word a triangle word.

# Using words.txt (right click and 'Save Link/Target As...'), a 16K text file
# containing nearly two-thousand common English words, how many are triangle
# words?

require 'pp'

$triangle_numbers = []

def calculate_triangle_numbers
  20.times do |n|
    $triangle_numbers << ((n-1)*n)/2
  end
end

def convert_word_to_numbers(word)
  word.split(//).map{|c| c[0] - ?@}.inject{|sum, int| sum + int}
end

def is_triangle?(num)
  calculate_triangle_numbers if $triangle_numbers.empty?
end

calculate_triangle_numbers

f = File.open("words.txt", "r")
words = f.read
words = words.gsub('"', '').strip.split(",")

nums = words.map{|w| convert_word_to_numbers(w)}
nums.reject!{|n| !$triangle_numbers.include?(n)}

pp nums.count

# 162

# real	0m0.062s
# user	0m0.051s
# sys	0m0.006s
