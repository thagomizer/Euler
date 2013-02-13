require 'mathn'
last = 1
x = (1..1000).inject(0) do |r,i|
  last = 1+1/(1+last)
  if last.numerator.to_s.size > last.denominator.to_s.size
    r + 1
  else
    r
  end
end

p x
