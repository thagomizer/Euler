#!/usr/bin/ruby -w

require 'enumerator'

class String
  def euler_score
    split(//).map { |c| c[0] - ?@ }.sum || 0
  end
end

module Enumerable
  def map_with_index
    Enumerable::Enumerator.new(self, :each_with_index).map { |o, index|
      yield o, index
    }
  end

  def sum
    self.inject(&:+)
  end
end

names = [""] + File.read("names.txt").scan(/\w+/).sort
sum   = names.map_with_index { |name, index| name.euler_score * index }.sum

p sum

# 871198282

# real	0m0.169s
# user	0m0.157s
# sys	0m0.007s
