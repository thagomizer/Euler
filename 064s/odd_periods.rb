require 'pp'


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
    fraction = []

    loop do
      key = "#{m}|#{d}|#{a}"
      if history[key]
        return fraction.length - fraction.index(key)
      end
      history[key] = true
      fraction << key

      m1 = (d * a) - m
      d1 = (self - m1**2)/d
      a1 = (a0 +m1)/d1
      m = m1
      d = d1
      a = a1
    end
  end
end

odd_count = 0
10_001.times do |n|
  period = n.period_of_sqrt_expansion
  if period.odd? then
    odd_count += 1
  end
end

puts "Odd periods #{odd_count}"

# Odd periods 1322

# real	0m1.905s
# user	0m1.833s
# sys	0m0.010s
