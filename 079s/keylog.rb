# A common security method used for online banking is to ask the user for three
# random characters from a passcode. For example, if the passcode was 531278,
# they may ask for the 2nd, 3rd, and 5th characters; the expected reply would
# be: 317.

# The text file, keylog.txt, contains fifty successful login attempts.

# Given that the three characters are always asked for in order, analyse the
# file so as to determine the shortest possible secret passcode of unknown
# length.

require 'rubygems'
require 'graph'
require 'pp'

f = File.open("keylog.txt", "r")

digraph do
  f.each_line do |line|
    line.strip!
    a, b, c = line.split(//)

    edge a, b
    edge b, c

  end
  save "graph", "png"
end


