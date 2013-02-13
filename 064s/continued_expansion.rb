require 'pp'
# m = 0
# d = 1
# @s = ARGV[0].to_i
# @a_initial = Math.sqrt(@s).floor
# a = @a_initial

# def calculate_next_values(m0, d0, a0)
#   m1 = (d0 * a0) - m0
#   d1 = (@s - m1**2)/d0
#   a1 = (@a_initial +m1)/d1
#   [m1, d1, a1]
# end

# history = {}
# count = -1

# loop do
#   key = "#{m}#{d}"
#   if history[key] then
#     puts count
#     break
#   else
#     history[key] = true
#   end
#   m, d, a = calculate_next_values(m, d, a)
#   count += 1
# end

class Fixnum
  def period_of_sqrt_expansion
    if Math.sqrt(self) == Math.sqrt(self).to_i then
      return 0
    end

    m = 0
    d = 1
    a0 = Math.sqrt(self).floor
    a = a0

    history = {}
    count = -1
    as = []

    loop do
      key = "#{m},#{d},#{a}"
      pp key
      if history[key] then
        pp as
      end
      return count if history[key]
      as << a
      history[key] = true

      m1 = (d * a) - m
      d1 = (self - m1**2)/d
      a1 = (a0 +m1)/d1
      m = m1
      d = d1
      a = a1
      count += 1
    end
  end
end

n = 1040
puts "n #{n} period #{n.period_of_sqrt_expansion}"

